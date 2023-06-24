//
//  ChooseSuitcaseModelViewController.swift
//  EasyValise
//
//  Created by Richard Sourianarayanane on 22/05/2023.
//

import UIKit

class ChooseSuitcaseModelViewController: UIViewController {

    @IBOutlet weak var modelSuitCaseCollectionView: UICollectionView?

    var chooseSuitcaseViewModel: ChooseSuitcaseViewModel!
    
    init(chooseSuitcaseViewModel: ChooseSuitcaseViewModel) {
        self.chooseSuitcaseViewModel = chooseSuitcaseViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
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
        return chooseSuitcaseViewModel.suitcaseCases.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = modelSuitCaseCollectionView?.dequeueReusableCell(withReuseIdentifier: "ModelSuitcase", for: indexPath) as? ModelSuitcaseCollectionViewCell else {return UICollectionViewCell()}
        let suitcaseModel = chooseSuitcaseViewModel.suitcaseCases[indexPath.row]
        cell.configCell(suitCaseName: suitcaseModel.name, suitcaseModel: suitcaseModel)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let validateSuitcaseViewController = storyboard.instantiateViewController(withIdentifier: "ValidateTravelViewController") as? ValidateTravelViewController {
            let validateSuitcaseViewModel = ValidateTravelViewModel(travelName: self.chooseSuitcaseViewModel.travelName, travelDate: self.chooseSuitcaseViewModel.travelDate, suitcaseModelName: self.chooseSuitcaseViewModel.suitcaseCases[indexPath.row].name, items: chooseSuitcaseViewModel.suitcaseCases[indexPath.row].model)
           
            validateSuitcaseViewController.validateTravelViewModel = validateSuitcaseViewModel
            
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
