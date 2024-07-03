//
//  DessertsTableViewCell.swift
//  MealMaster
//
//  Created by Varshith Chilamkurthi on 02/07/24.
//

import UIKit

class DessertsTableViewCell: UITableViewCell {

    @IBOutlet var dessertImageView: UIImageView!
    @IBOutlet var dessertTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setUp(setter: Dessert) async {
        //decoding image data
        if let imageUrl = setter.strMealThumb {
            do {
                let imageData = try await APIManager.sharedInstance.getApiData(url: imageUrl)
                if let imageData = imageData {
                    dessertImageView.image = UIImage(data: imageData)
                }
            } catch {
                print("error getting image data")
            }
        } else {
            dessertImageView.image = UIImage(systemName: "photo")
        }
        dessertTitleLabel.text = setter.strMeal
    }
    
    func setUI() {
        dessertImageView.layer.cornerRadius = 10
    }
}
