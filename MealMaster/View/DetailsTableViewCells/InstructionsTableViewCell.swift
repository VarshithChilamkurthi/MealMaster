//
//  InstructionsTableViewCell.swift
//  MealMaster
//
//  Created by Varshith Chilamkurthi on 03/07/24.
//

import UIKit

class InstructionsTableViewCell: UITableViewCell {

    @IBOutlet var instructionsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(setter: Details) {
        instructionsLabel.text = setter.strInstructions
    }

}
