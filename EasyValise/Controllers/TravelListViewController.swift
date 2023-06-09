//
//  TravelListViewController.swift
//  EasyValise
//
//  Created by Richard Sourianarayanane on 19/05/2023.
//

import UIKit

final class TravelListViewController: UIViewController {
    
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
        switchControl.onTintColor = UIColor.systemIndigo
        if item.isChecked {
            switchControl.isOn = true
        } else {
            switchControl.isOn = false
        }
        cell.accessoryView = switchControl
        switchControl.addTarget(self, action: #selector(switchChanged(_:)), for: .valueChanged)
        content.textProperties.font = UIFont(name: "Gill Sans", size: 19.0) ?? UIFont()
        cell.contentConfiguration = content
        cell.backgroundColor = UIColor(named: "Orange")
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor(named: "Orange")

        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemIndigo
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.text = travelListViewModel.sectionsName[section]

        headerView.addSubview(label)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            label.centerYAnchor.constraint(equalTo: headerView.centerYAnchor)
        ])

        return headerView
    }
    
    @objc private func switchChanged(_ sender: UISwitch) {
        
        guard let cell = sender.superview as? UITableViewCell else {
            return
        }
        
        guard let indexPath = listItemsTableView.indexPath(for: cell) else {
            return
        }
        
        let item = travelListViewModel.getItem(indexpathSection: indexPath.section, indexpathRow: indexPath.row)
        
        travelListViewModel.updateIsChecked(for: self.travelListViewModel.travel, item: item, isChecked: sender.isOn) { [weak self] success in
            if success {
                item.isChecked = sender.isOn
                self?.listItemsTableView.reloadData()
            } else {
                sender.isOn = !sender.isOn
                self?.displayAlertRetry(sender: sender)
            }
        }
    }
        
    private func displayAlertRetry(sender: UISwitch) {
        // Declare Alert message
        let dialogMessage = UIAlertController(title: "Erreur", message: "Une erreur est survenue lors de la sauvegarde de l'information. Réessayez ?", preferredStyle: .alert)
        
        // Create OK button with action handler
        let ok = UIAlertAction(title: "Oui", style: .default, handler: { [weak self] (action) -> Void in
            self?.switchChanged(sender)
        })
        
        // Create Cancel button with action handlder
        let cancel = UIAlertAction(title: "Annuler", style: .cancel) { [] (action) -> Void in
        }
        
        //Add OK and Cancel button to dialog message
        dialogMessage.addAction(ok)
        dialogMessage.addAction(cancel)
        
        // Present dialog message to user
        present(dialogMessage, animated: true, completion: nil)
    }
}

