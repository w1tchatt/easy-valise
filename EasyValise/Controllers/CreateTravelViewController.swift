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
    
    private var travelDate: Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.minimumDate = Date()
        datePicker.date = Date()
    }
    
    
    @IBAction func handleDatePicker(_ sender: UIDatePicker) {
        let selectedDate = sender.date
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day, .month, .year], from: selectedDate)
        
        if let year = components.year, let month = components.month, let day = components.day {
            let myDateComponents = DateComponents(year: year, month: month, day: day)
            if let myDate = calendar.date(from: myDateComponents) {
                self.travelDate = myDate
            }
        }
    }
    
    @IBAction func defineSuitcase(_ sender: UIButton) {
    #warning("put protection if textfield or datepicker is empty or not conform")
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let chooseModelSuitcaseViewController = storyboard.instantiateViewController(withIdentifier: "ChooseModelSuitcaseViewController") as? ChooseSuitcaseModelViewController {
            guard let travelName = destinationTextField.text else {return}
            chooseModelSuitcaseViewController.travelName = travelName
            
            chooseModelSuitcaseViewController.travelDate = self.travelDate
            
            self.navigationController?.pushViewController(chooseModelSuitcaseViewController, animated: true)
        }
    }
}
