//
//  ImageTableViewCell.swift
//  MealMaster
//
//  Created by Varshith Chilamkurthi on 03/07/24.
//

import UIKit

class ImageTableViewCell: UITableViewCell {

    @IBOutlet var thumbnailImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setup(setter: Details) async {
        if let imageUrl = setter.strMealThumb {
            do {
                let imageData = try await APIManager.sharedInstance.getApiData(url: imageUrl)
                if let imageData = imageData {
                    thumbnailImageView.image = UIImage(data: imageData)
                }
            } catch {
                print("error getting image data")
            }
        } else {
            thumbnailImageView.image = UIImage(systemName: "photo")
        }
    }
}
