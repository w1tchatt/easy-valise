//
//  HomeTableViewCell.swift
//  EasyValise
//
//  Created by Richard Sourianarayanane on 21/06/2023.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var travelNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(travelName: String, date: String) {
        self.travelNameLabel.text = travelName.uppercased()
        self.dateLabel.text = date
        
    }
    
}
