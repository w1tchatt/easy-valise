//
//  TravelListViewController.swift
//  EasyValise
//
//  Created by Richard Sourianarayanane on 19/05/2023.
//

import UIKit

class TravelListViewController: UIViewController {
    var travel: Travel = Travel(name: "", date: .now, suitcase: Suitcase(items: [Item(name: "", isChecked: false, section: Section.drugs.rawValue)]))
    private var sectionsName:[String] = []
    
    let travelListViewModel = TravelListViewModel()
    
    @IBOutlet weak var listItemsTableView: UITableView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.listItemsTableView.delegate = self
        self.listItemsTableView.dataSource = self
        
        defineSectionsToShow()
    }
}


extension TravelListViewController: UITableViewDelegate, UITableViewDataSource {
    
    private func defineSectionsToShow() {
        var sectionsUsed: Set<String> = []
        for item in travel.suitcase.items {
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
        let itemsInSection = travel.suitcase.items.filter { $0.section == sectionsName[section] }
        return itemsInSection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listItemsTableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
        let section = sectionsName[indexPath.section]
        let itemsInSection = travel.suitcase.items.filter { $0.section == section }
        let itemsInSectionOrdered = itemsInSection.sorted { $0.name < $1.name }
        let item = itemsInSectionOrdered[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = item.name
        
        let switchControl = UISwitch()
        if item.isChecked {
            switchControl.isOn = true
        } else {
            switchControl.isOn = false
        }
        cell.accessoryView = switchControl
        switchControl.addTarget(self, action: #selector(switchChanged(_:)), for: .valueChanged)
        cell.contentConfiguration = content
        return cell
    }
    
    @objc private func switchChanged(_ sender: UISwitch) {

        guard let cell = sender.superview as? UITableViewCell else {
            return
        }

        guard let indexPath = listItemsTableView.indexPath(for: cell) else {
            return
        }
        
        let itemsInSection = travel.suitcase.items.filter { $0.section == sectionsName[indexPath.section] }
        let itemsInSectionOrdered = itemsInSection.sorted { $0.name < $1.name }
        let item = itemsInSectionOrdered[indexPath.row]
        
        travelListViewModel.updateIdChecked(for: travel, item: item, isChecked: sender.isOn) { success in
            if success {
                item.isChecked = sender.isOn
                self.listItemsTableView.reloadData()
            } else {
                #warning("put a warning message")
            }
        }
        
    }
}

