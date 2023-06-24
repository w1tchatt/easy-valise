//
//  ModelSuitcaseCollectionViewCell.swift
//  EasyValise
//
//  Created by Richard Sourianarayanane on 27/05/2023.
//

import UIKit

class ModelSuitcaseCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var suitcaseModelLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func configCell(suitCaseName:String, suitcaseModel:SuitcasesModelsEnum) {
        self.suitcaseModelLabel.text = suitcaseModel.name.uppercased()
        
        switch suitcaseModel {
        case .shortTravelSummer:
            self.iconImageView.image = UIImage(systemName: "sun.max.fill")
            self.iconImageView.tintColor = .yellow
            self.backgroundColor = UIColor(red: 0.340044, green: 0.883662, blue: 0.816156, alpha: 1)
        case .longTravelSummer:
            self.iconImageView.image = UIImage(systemName: "sun.max.fill")
            self.iconImageView.tintColor = .yellow
            self.backgroundColor = UIColor(red: 0.76001, green: 0.987609, blue: 0.580974, alpha: 1)
        case .shortTravelWinter:
            self.iconImageView.image = UIImage(systemName: "cloud.snow.fill")
            self.iconImageView.tintColor = UIColor(white: 1, alpha: 1)
            self.backgroundColor = UIColor(red: 0.0410826, green: 0.204102, blue: 0.669009, alpha: 1)
            self.suitcaseModelLabel.textColor = .white
        case .longTravelWinter:
            self.iconImageView.image = UIImage(systemName: "cloud.snow.fill")
            self.iconImageView.tintColor = UIColor(white: 1, alpha: 1)
            self.backgroundColor = UIColor(red: 0.0911514, green: 0.112832, blue: 0.472904, alpha: 1)
            self.suitcaseModelLabel.textColor = .white
        }
    }
}
