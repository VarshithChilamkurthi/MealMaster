//
//  CategoryCollectionViewCell.swift
//  MealMaster
//
//  Created by Varshith Chilamkurthi on 02/07/24.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var categoryImageView: UIImageView!
    @IBOutlet var categoryLabel: UILabel!
    
    func setUp(setter: FoodCategory, imageSetter: String) {
        categoryLabel.text = setter.strCategory
        categoryImageView.image = UIImage(named: imageSetter)
    }
}
