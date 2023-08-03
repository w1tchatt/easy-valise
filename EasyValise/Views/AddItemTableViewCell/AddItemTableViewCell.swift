//
//  AddItemTableViewCell.swift
//  EasyValise
//
//  Created by Richard on 27/07/2023.
//

import UIKit

class AddItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var itemTextField: UITextField!
    var addButtonTapped: ((String?) -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    @IBAction func addButtonTapped(_ sender: UIButton) {
        if let text = itemTextField.text, !text.trimmingCharacters(in: .whitespaces).isEmpty {
            addButtonTapped?(text)
        } else {
            print("erreur champ vide")
        }
    }
    
    
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
    
}
