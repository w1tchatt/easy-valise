//
//  ViewController.swift
//  EasyValise
//
//  Created by Richard Sourianarayanane on 23/04/2023.
//

import UIKit

class HomeViewController: UIViewController {

    
    @IBOutlet weak var homeTableView: UITableView!
    
    let homeViewModel = HomeViewModel()
    //let travel1 = Travel(name: "Paris", date: .now, suitcase: Suitcase(items: SuitcaseModels.shortTravelSummer))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getTravels()
        
        self.homeTableView.delegate = self
        self.homeTableView.dataSource = self
    }
    
    func getTravels() {
        homeViewModel.getTravels { [weak self] success in
            if !success {
                #warning("Put an alert warning")
            }
        }
        self.homeTableView.reloadData()
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return travels.count+1
        return homeViewModel.travels.count+1
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row != homeViewModel.travels.count{
            let cell = homeTableView.dequeueReusableCell(withIdentifier: "TravelCell", for: indexPath)
            var content = cell.defaultContentConfiguration()
            content.text = homeViewModel.travels[indexPath.row].name
            let date = homeViewModel.dateFormatted(date: homeViewModel.travels[indexPath.row].date)
            content.secondaryText = date
            cell.contentConfiguration = content
            return cell
        } else {
            let cell = homeTableView.dequeueReusableCell(withIdentifier: "TravelCell", for: indexPath)
            var content = cell.defaultContentConfiguration()
            content.text = "CREER UN NOUVEAU VOYAGE"
            cell.contentConfiguration = content
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if indexPath.row != homeViewModel.travels.count {
            if let travelListViewController = storyboard.instantiateViewController(withIdentifier: "TravelListViewController") as? TravelListViewController {
                travelListViewController.travel = homeViewModel.travels[indexPath.row]
                self.navigationController?.pushViewController(travelListViewController, animated: true)
            }
        } else {
            if let createTravelViewController = storyboard.instantiateViewController(withIdentifier: "CreateTravelViewController") as? CreateTravelViewController {
                self.navigationController?.pushViewController(createTravelViewController, animated: true)
            }
        }
    }    
}
