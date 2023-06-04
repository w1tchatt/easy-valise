//
//  ChooseSuitcaseModelViewController.swift
//  EasyValise
//
//  Created by Richard Sourianarayanane on 22/05/2023.
//

import UIKit

class ChooseSuitcaseModelViewController: UIViewController {

    @IBOutlet weak var modelSuitCaseCollectionView: UICollectionView?

    let suitcaseCases: [SuitcasesModelsEnum] = SuitcasesModelsEnum.allCases
    var travelName: String = ""
    var travelDate: Date! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.modelSuitCaseCollectionView?.register(UINib(nibName: "ModelSuitcaseCollectionViewCell", bundle:nil), forCellWithReuseIdentifier: "ModelSuitcase")
        
        
        self.modelSuitCaseCollectionView?.delegate = self
        self.modelSuitCaseCollectionView?.dataSource = self
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 4
        
        modelSuitCaseCollectionView?.setCollectionViewLayout(layout, animated: true)

    }

}

extension ChooseSuitcaseModelViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return suitcaseCases.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = modelSuitCaseCollectionView?.dequeueReusableCell(withReuseIdentifier: "ModelSuitcase", for: indexPath) as? ModelSuitcaseCollectionViewCell else {return UICollectionViewCell()}
        let suitcaseModel = suitcaseCases[indexPath.row]
        cell.configCell(suitCaseName: suitcaseModel.name)
        //cell.backgroundColor = .randomColor()
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let validateSuitcaseViewController = storyboard.instantiateViewController(withIdentifier: "ValidateTravelViewController") as? ValidateTravelViewController {
            validateSuitcaseViewController.items = suitcaseCases[indexPath.row].model
            validateSuitcaseViewController.suitcaseModelName = suitcaseCases[indexPath.row].name
            validateSuitcaseViewController.travelName = self.travelName
            validateSuitcaseViewController.travelDate = self.travelDate
            self.navigationController?.pushViewController(validateSuitcaseViewController, animated: true)
        }
    }


}


extension ChooseSuitcaseModelViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1.0, left: 8.0, bottom: 1.0, right: 8.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let lay = collectionViewLayout as! UICollectionViewFlowLayout
        let widthPerItem = collectionView.frame.width / 2 - lay.minimumInteritemSpacing

        return CGSize(width: widthPerItem - 8, height: widthPerItem - 8)
    }
}



extension CGFloat {
    static func randomValue() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
extension UIColor {
    static func randomColor() -> UIColor {
        return UIColor(
           red:   .randomValue(),
           green: .randomValue(),
           blue:  .randomValue(),
           alpha: 1.0
        )
    }
}
