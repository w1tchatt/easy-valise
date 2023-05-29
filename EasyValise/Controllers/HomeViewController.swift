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
    let travel1 = Travel(name: "Paris", date: .now, suitcase: Suitcase(items: SuitcaseModels.shortTravelSummer))
    var travels: [Travel]!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        travels = [travel1]
        
        self.homeTableView.delegate = self
        self.homeTableView.dataSource = self
        self.homeTableView.reloadData()

    }


//    func createItem(name: String, isChecked: Bool, section: Section) {
//        let newItem = Item(context: CoreDataService.shared.viewContext)
//        newItem.name = name
//        newItem.isChecked = isChecked
//        newItem.section = section
//        CoreDataService.shared.saveContext()
//    }
    
    func createItem(name: String, isChecked: Bool, section: Section) {
        let item1 = Item(name: "Shampoing", isChecked: false, section: Section.clothes.rawValue)
        let item2 = Item(name: "Dentifrice", isChecked: false, section: Section.clothes.rawValue)
        let newTravel = Travel(name: "Paris", date: .now, suitcase: Suitcase(items: [item1, item2]))
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
            #warning("TODO formattage de la date")
            content.secondaryText = String(describing: travels[indexPath.row].date)
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
    
    
}
