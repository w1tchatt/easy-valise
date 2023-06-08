//
//  ViewController.swift
//  EasyValise
//
//  Created by Richard Sourianarayanane on 23/04/2023.
//

import UIKit

class HomeViewController: UIViewController {

    
    @IBOutlet weak var homeTableView: UITableView!
    
    #warning("Temporaire, appeler les infos de coredata")
    let travelViewModel = TravelViewModel()
    //let travel1 = Travel(name: "Paris", date: .now, suitcase: Suitcase(items: SuitcaseModels.shortTravelSummer))
    var travels: [Travel]!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateTravels()
        
        self.homeTableView.delegate = self
        self.homeTableView.dataSource = self
    }
    
    func updateTravels() {
        travelViewModel.getTravels { [weak self] success, theTravels in
            if success {
                self?.travels = theTravels
            } else {
                self?.travels = []
            }
        }
        self.homeTableView.reloadData()
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return travels.count+1
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row != travels.count{
            let cell = homeTableView.dequeueReusableCell(withIdentifier: "TravelCell", for: indexPath)
            var content = cell.defaultContentConfiguration()
            content.text = travels[indexPath.row].name
            let date = dateFormatted(date: travels[indexPath.row].date)
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
        if indexPath.row != travels.count {
            if let travelListViewController = storyboard.instantiateViewController(withIdentifier: "TravelListViewController") as? TravelListViewController {
                travelListViewController.travel = travels[indexPath.row]
                self.navigationController?.pushViewController(travelListViewController, animated: true)
            }
        } else {
            if let createTravelViewController = storyboard.instantiateViewController(withIdentifier: "CreateTravelViewController") as? CreateTravelViewController {
                self.navigationController?.pushViewController(createTravelViewController, animated: true)
            }
        }
    }
    
    private func dateFormatted(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: date)
    }
    
    
}
