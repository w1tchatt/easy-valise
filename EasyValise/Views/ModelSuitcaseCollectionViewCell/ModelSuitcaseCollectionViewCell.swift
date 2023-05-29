//
//  ModelSuitcaseCollectionViewCell.swift
//  EasyValise
//
//  Created by Richard Sourianarayanane on 27/05/2023.
//

import UIKit

class ModelSuitcaseCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var suitcaseModelLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func configCell(suitCaseName:String) {
        self.suitcaseModelLabel.text = suitCaseName
        self.backgroundColor = .green
    }

}
