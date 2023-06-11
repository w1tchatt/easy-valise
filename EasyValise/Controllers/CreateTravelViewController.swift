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
    
    let createTravelViewModel = CreateTravelViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.minimumDate = Date.now
    }
    
    
    @IBAction func handleDatePicker(_ sender: UIDatePicker) {
        let selectedDate = sender.date
        createTravelViewModel.getDate(date: selectedDate)
    }
    
    @IBAction func defineSuitcase(_ sender: UIButton) {
        if !createTravelViewModel.textFieldIsEmpty(text: self.destinationTextField?.text) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let chooseModelSuitcaseViewController = storyboard.instantiateViewController(withIdentifier: "ChooseModelSuitcaseViewController") as? ChooseSuitcaseModelViewController {
                guard let travelName = destinationTextField.text else {return}
                let chooseSuitcaseViewModel = ChooseSuicaseViewModel(travelName: travelName, travelDate: self.createTravelViewModel.travelDate)
                
                chooseModelSuitcaseViewController.chooseSuitcaseViewModel = chooseSuitcaseViewModel

                self.navigationController?.pushViewController(chooseModelSuitcaseViewController, animated: true)
            }
        } else {
            displayAlertInfo(title: "Erreur", message: "Merci de renseigner une destination valide")
        }
    }
    
    private func displayAlertInfo(title: String, message: String) {
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        present(alertVC, animated: true, completion: nil)
    }
}
