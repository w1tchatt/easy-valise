//
//  TravelListViewController.swift
//  EasyValise
//
//  Created by Richard Sourianarayanane on 19/05/2023.
//

import UIKit

class TravelListViewController: UIViewController {
    var travel: Travel = Travel(name: "", date: .now, suitcase: Suitcase(items: [Item(name: "", isChecked: false, section: Section.drugs.rawValue)]))
    private var sectionsUsed: Set<String> = []
    private var sectionsName:[String] = []
    
    @IBOutlet weak var listItemsTableView: UITableView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.listItemsTableView.reloadData()
        self.listItemsTableView.delegate = self
        self.listItemsTableView.dataSource = self
        
        defineSectionsToShow()
    }
}


extension TravelListViewController: UITableViewDelegate, UITableViewDataSource {
    
    private func defineSectionsToShow() {
        for item in travel.suitcase.items {
            sectionsUsed.insert(item.section)
        }
        // mal trié
        sectionsName = Array(sectionsUsed).sorted { $0 < $1 }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionsUsed.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionsName[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionType = Array(sectionsUsed)[section]
        
        let itemsInSection = travel.suitcase.items.filter { $0.section == sectionType }
        return itemsInSection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listItemsTableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
        let section = sectionsName[indexPath.section]
        let itemsInSection = travel.suitcase.items.filter { $0.section == section }
        let item = itemsInSection[indexPath.row]
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
        let point = sender.convert(CGPoint.zero, to: listItemsTableView)
        guard let indexPath = listItemsTableView.indexPathForRow(at: point) else {
            return
        }
        
        let sectionType = Array(sectionsUsed)[indexPath.section]
        let itemsInSection = travel.suitcase.items.filter { $0.section == sectionType }
        let sortedItems = itemsInSection.sorted { $0.name < $1.name }
        let item = sortedItems[indexPath.row]
        item.isChecked = sender.isOn
        self.listItemsTableView.reloadData()
    }
}

