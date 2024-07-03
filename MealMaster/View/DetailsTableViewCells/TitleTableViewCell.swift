//
//  TitleTableViewCell.swift
//  MealMaster
//
//  Created by Varshith Chilamkurthi on 03/07/24.
//

import UIKit

class TitleTableViewCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    
    let detailsViewModelObj = DetailsViewModel()
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//    }

    func setup(setter: Details) {
        titleLabel.text = setter.strMeal
    }
}
