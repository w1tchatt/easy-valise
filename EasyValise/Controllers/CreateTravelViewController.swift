//
//  CreateTravelViewController.swift
//  EasyValise
//
//  Created by Richard Sourianarayanane on 21/05/2023.
//

import UIKit

final class CreateTravelViewController: UIViewController {
    
    @IBOutlet weak var destinationTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    private let createTravelViewModel = CreateTravelViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.minimumDate = Date.now
    }
    
    @IBAction private func handleDatePicker(_ sender: UIDatePicker) {
        let selectedDate = sender.date
        createTravelViewModel.setDate(date: selectedDate)
    }
    
    @IBAction private func defineSuitcase(_ sender: UIButton) {
        if !createTravelViewModel.textFieldIsEmpty(text: self.destinationTextField?.text) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let chooseModelSuitcaseViewController = storyboard.instantiateViewController(withIdentifier: "ChooseModelSuitcaseViewController") as? ChooseSuitcaseModelViewController {
                guard let travelName = destinationTextField.text else {return}
                let chooseSuitcaseViewModel = ChooseSuitcaseViewModel(travelName: travelName, travelDate: self.createTravelViewModel.travelDate)
                chooseModelSuitcaseViewController.chooseSuitcaseViewModel = chooseSuitcaseViewModel
                self.navigationController?.pushViewController(chooseModelSuitcaseViewController, animated: true)
            }
        } else {
            AlertInfo.display(title: "Erreur", message: "Merci de renseigner une destination valide", vc: self)
        }
    }
    
    @IBAction private func dismissKeyboard(_ sender: Any) {
        destinationTextField.resignFirstResponder()
    }
}
