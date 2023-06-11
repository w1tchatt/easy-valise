//
//  TravelListViewController.swift
//  EasyValise
//
//  Created by Richard Sourianarayanane on 19/05/2023.
//

import UIKit

class TravelListViewController: UIViewController {
    
    var travelListViewModel: TravelListViewModel!
    
    init(travelListViewModel: TravelListViewModel) {
        self.travelListViewModel = travelListViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @IBOutlet weak var listItemsTableView: UITableView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.listItemsTableView.delegate = self
        self.listItemsTableView.dataSource = self
        
        travelListViewModel.defineSectionsToShow()
    }
}


extension TravelListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return travelListViewModel.sectionsName.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return travelListViewModel.sectionsName[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let itemsInSection = travelListViewModel.travel.suitcase.items.filter { $0.section == travelListViewModel.sectionsName[section] }
        return itemsInSection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listItemsTableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath)
        let item = travelListViewModel.getItem(indexpathSection: indexPath.section, indexpathRow: indexPath.row)
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
        
        // faire une cell dédiée
        guard let cell = sender.superview as? UITableViewCell else {
            return
        }
        
        guard let indexPath = listItemsTableView.indexPath(for: cell) else {
            return
        }
        
        let item = travelListViewModel.getItem(indexpathSection: indexPath.section, indexpathRow: indexPath.row)
        
        travelListViewModel.updateIdChecked(for: self.travelListViewModel.travel, item: item, isChecked: sender.isOn) { [weak self] success in
            if success {
                item.isChecked = sender.isOn
                self?.listItemsTableView.reloadData()
            } else {
                #warning("put a warning message")
            }
        }
        
    }
}

