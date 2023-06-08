//
//  ValidateTravelViewController.swift
//  EasyValise
//
//  Created by Richard Sourianarayanane on 28/05/2023.
//

import UIKit

class ValidateTravelViewController: UIViewController {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var previewItemsTableview: UITableView!
    
    var travelName: String = ""
    var travelDate: Date!
    var suitcaseModelName: String = ""
    var items: [Item] = []
    
    let validateTravelViewModel = ValidateTravelViewModel()
    private var sectionsName:[String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        previewItemsTableview.register(UITableViewCell.self, forCellReuseIdentifier: "previewItemCell")
        previewItemsTableview.delegate = self
        previewItemsTableview.dataSource = self

        descriptionLabel.text = "Validez-vous la liste des articles de '\(suitcaseModelName)' ? "
        
        defineSectionsToShow()
    }
    
    
    @IBAction func validateTravel(_ sender: UIButton) {
        let newTravel = Travel(name: self.travelName, date: self.travelDate, suitcase: Suitcase(items: self.items))
        
        // send newTravel to viewModel to be save in Coredata
        validateTravelViewModel.saveInCoreData(travel: newTravel) { [weak self] success in
            if let navigationController = self?.navigationController {
                let viewControllers = navigationController.viewControllers
                for viewController in viewControllers {
                    if let homeViewController = viewController as? HomeViewController {
                        self?.navigationController?.popToViewController(homeViewController, animated: true)
                        homeViewController.getTravels()
                    }
                }
            } else {
                #warning("put an alert for retry")
            }
        }
    }
}

extension ValidateTravelViewController: UITableViewDelegate, UITableViewDataSource {
    
    private func defineSectionsToShow() {
        var sectionsUsed: Set<String> = []
        for item in items {
            sectionsUsed.insert(item.section)
        }
        sectionsName = Array(sectionsUsed)
        sectionsName = sectionsName.sorted { $0 < $1 }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
       return sectionsName.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionsName[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let itemsInSection = items.filter { $0.section == sectionsName[section] }
        return itemsInSection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = previewItemsTableview.dequeueReusableCell(withIdentifier: "previewItemCell", for: indexPath)
        let section = sectionsName[indexPath.section]
        let itemsInSection = items.filter { $0.section == section }
        let item = itemsInSection[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = item.name
        cell.contentConfiguration = content
        return cell
    }
    
    
}

