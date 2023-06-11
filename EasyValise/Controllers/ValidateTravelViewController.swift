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
        previewItemsTableview.delegate = self
        previewItemsTableview.dataSource = self

        descriptionLabel.text = "Validez-vous la liste des articles de '\(validateTravelViewModel.suitcaseModelName)' ? "
        
        validateTravelViewModel.defineSectionsToShow(items: self.validateTravelViewModel.items)
    }
    
    
    @IBAction func validateTravel(_ sender: UIButton) {
        // save in Coredata
        validateTravelViewModel.saveInCoreData() { [weak self] success in
            self?.navigationController?.popToRootViewController(animated: true)
            
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
        return itemsInSection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = previewItemsTableview.dequeueReusableCell(withIdentifier: "previewItemCell", for: indexPath)
        let section = self.validateTravelViewModel.sectionsName[indexPath.section]
        let itemsInSection = self.validateTravelViewModel.items.filter { $0.section == section }
        let item = itemsInSection[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = item.name
        cell.contentConfiguration = content
        return cell
    }
}

