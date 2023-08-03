//
//  ValidateTravelViewController.swift
//  EasyValise
//
//  Created by Richard Sourianarayanane on 28/05/2023.
//

import UIKit

final class ValidateTravelViewController: UIViewController {

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var previewItemsTableview: UITableView!
    
    var validateTravelViewModel: ValidateTravelViewModel!
    
    init(validateTravelViewModel: ValidateTravelViewModel) {
        self.validateTravelViewModel = validateTravelViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        previewItemsTableview.register(UITableViewCell.self, forCellReuseIdentifier: "previewItemCell")
        previewItemsTableview.register(UITableViewCell.self, forCellReuseIdentifier: "CreateTravelViewCell")
       // previewItemsTableview.register(UITableViewCell.self, forCellReuseIdentifier: "AddItemTableViewCell")
        previewItemsTableview.register(UINib(nibName: "AddItemTableViewCell", bundle:nil), forCellReuseIdentifier: "AddItemTableViewCell")
        previewItemsTableview.delegate = self
        previewItemsTableview.dataSource = self

        descriptionLabel.text = "Valider la liste des articles de '\(validateTravelViewModel.suitcaseModelName)' ? "
    }
    
    
    @IBAction private func validateTravel(_ sender: UIButton) {
        // save in Coredata
        validateTravelViewModel.saveInCoreData() { [weak self] success in
            if success {
                self?.navigationController?.popToRootViewController(animated: true)
            } else {
                guard let vc = self else {return}
                AlertInfo.display(title: "Erreur", message: "Merci de réessayer.", vc: vc)
            }
        }
    }
}

extension ValidateTravelViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return validateTravelViewModel.sectionsName.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return validateTravelViewModel.sectionsName[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let itemsInSection = self.validateTravelViewModel.items.filter { $0.section == validateTravelViewModel.sectionsName[section] }
        let itemsNumber = itemsInSection.count + 1
        return itemsNumber
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = self.validateTravelViewModel.sectionsName[indexPath.section]
        let itemsInSection = self.validateTravelViewModel.items.filter { $0.section == section }
        if indexPath.row != itemsInSection.count {
            let item = itemsInSection[indexPath.row]
            let cell = previewItemsTableview.dequeueReusableCell(withIdentifier: "previewItemCell", for: indexPath)
            var content = cell.defaultContentConfiguration()
            content.text = item.name
            content.textProperties.font = UIFont(name: "Gill Sans", size: 19.0) ?? UIFont()
            content.textProperties.color = .darkGray
            content.textProperties.alignment = .natural
            cell.contentConfiguration = content
            cell.backgroundColor = UIColor(named: "Orange")
            cell.selectionStyle = .none
            return cell
        } else {
            let cell = previewItemsTableview.dequeueReusableCell(withIdentifier: "AddItemTableViewCell", for: indexPath) as! AddItemTableViewCell
            cell.addButtonTapped = { [weak self] newItem in
                if let newItem, let section = self?.validateTravelViewModel.sectionsName[indexPath.section] {
                    self?.validateTravelViewModel.addNewItem(itemName: newItem, sectionName: section, callback: { success in
                        if success {
                            cell.itemTextField.text = ""
                            self?.previewItemsTableview.reloadData()
                        }
                    })
                }
            }
            return cell
        }
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let section = self.validateTravelViewModel.sectionsName[indexPath.section]
//        let itemsInSection = self.validateTravelViewModel.items.filter { $0.section == section }
//
//        if indexPath.row == itemsInSection.count {
//            print("coucou")
//        }
//    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor(named: "Orange")

        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .systemIndigo
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.text = validateTravelViewModel.sectionsName[section].uppercased()

        headerView.addSubview(label)
        NSLayoutConstraint.activate([
            //label.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            label.leftAnchor.constraint(equalTo: headerView.leftAnchor, constant: 20),
            label.centerYAnchor.constraint(equalTo: headerView.centerYAnchor)
        ])

        return headerView
    }
}

