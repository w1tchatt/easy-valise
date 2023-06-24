//
//  ViewController.swift
//  EasyValise
//
//  Created by Richard Sourianarayanane on 23/04/2023.
//

import UIKit

final class HomeViewController: UIViewController {

    
    @IBOutlet weak var homeTableView: UITableView!
    
    let homeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.homeTableView.register(UINib(nibName: "HomeTableViewCell", bundle:nil), forCellReuseIdentifier: "HomeTableViewCell")
        self.homeTableView.register(UINib(nibName: "CreateTravelViewCell", bundle:nil), forCellReuseIdentifier: "CreateTravelViewCell")
        
        self.homeTableView.delegate = self
        self.homeTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getTravels()
    }
    
    private func getTravels() {
        homeViewModel.getTravels { [weak self] success in
            if !success {
                guard let vc = self else {return}
                AlertInfo.display(title: "Erreur", message: "Erreur lors du chargement des données.", vc: vc)
            }
            self?.homeTableView.reloadData()
        }
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeViewModel.travels.count+1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row != homeViewModel.travels.count{
            guard let cell = homeTableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as? HomeTableViewCell else { return UITableViewCell()}
            let date = homeViewModel.dateFormatted(date: homeViewModel.travels[indexPath.row].date)
            let name = homeViewModel.travels[indexPath.row].name
            cell.setup(travelName: name, date: date)
            return cell
        } else {
            guard let cell = homeTableView.dequeueReusableCell(withIdentifier: "CreateTravelViewCell", for: indexPath) as? CreateTravelViewCell else { return UITableViewCell()}
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if indexPath.row != homeViewModel.travels.count {
            if let travelListViewController = storyboard.instantiateViewController(withIdentifier: "TravelListViewController") as? TravelListViewController {
                let travelListViewModel = TravelListViewModel(travel: self.homeViewModel.travels[indexPath.row])
                travelListViewController.travelListViewModel = travelListViewModel
                self.navigationController?.pushViewController(travelListViewController, animated: true)
            }
        } else {
            if let createTravelViewController = storyboard.instantiateViewController(withIdentifier: "CreateTravelViewController") as? CreateTravelViewController {
                self.navigationController?.pushViewController(createTravelViewController, animated: true)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete && indexPath.row != homeViewModel.travels.count {
            homeViewModel.deleteTravel(travel: homeViewModel.travels[indexPath.row]) { success in
                if success {
                    self.getTravels()
                } else {
                    AlertInfo.display(title: "Erreur", message: "Erreur lors de la suppression du voyage", vc: self)
                }
            }
        }
    }
    
    // make last row no deletable
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return indexPath.row != homeViewModel.travels.count
    }
}
