//
//  InstructionsTableViewCell.swift
//  MealMaster
//
//  Created by Varshith Chilamkurthi on 03/07/24.
//

import UIKit

class InstructionsTableViewCell: UITableViewCell {

    @IBOutlet var instructionsLabel: UILabel!
    @IBOutlet var instructionsSegmentedControl: UISegmentedControl!
    
    private var setter: Details?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        instructionsSegmentedControl.addTarget(self, action: #selector(segmentChanged), for: .valueChanged)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setup(setter: Details) {
        self.setter = setter
        segmentChanged()
    }
    
    @objc func segmentChanged() {
        guard let setter = setter else { return }
        
        if instructionsSegmentedControl.selectedSegmentIndex == 0 {
            instructionsLabel.text = setter.strInstructions
        } else if instructionsSegmentedControl.selectedSegmentIndex == 1 {
            var ingredients = [String]()
            var measurements = [String]()
            var combinedArray = [String]()
            let mirror = Mirror(reflecting: setter)
            
            for i in 1...20{
                let key = "strIngredient\(i)"
                let key2 = "strMeasure\(i)"
                
                if let ingredient = mirror.children.first(where: { $0.label == key })?.value as? String, !ingredient.isEmpty {
                    ingredients.append(ingredient)
                }
                if let measurement = mirror.children.first(where: { $0.label == key2 })?.value as? String, !measurement.isEmpty {
                    measurements.append(measurement)
                }
            }
            
            for i in 0..<ingredients.count {
                combinedArray.append(ingredients[i] + ": \t" + measurements[i])
            }
            
            let ingredientsString = combinedArray.joined(separator: "\n\n")
            instructionsLabel.text = ingredientsString
        } else if instructionsSegmentedControl.selectedSegmentIndex == 2 {
            let attributedText = NSMutableAttributedString()

            let boldAttributes: [NSAttributedString.Key: Any] = [
                .font: UIFont.boldSystemFont(ofSize: 18)
            ]
            
            let foodCategory = NSAttributedString(string: "Food Category: ", attributes: boldAttributes)
            let category = NSAttributedString(string: setter.strCategory ?? "N/A")
            let foodOrigin = NSAttributedString(string: "\n\nFood Origin: ", attributes: boldAttributes)
            let area = NSAttributedString(string: setter.strArea ?? "N/A")
            let youtubeUrl = NSAttributedString(string: "\n\nYoutube Link: ", attributes: boldAttributes)
            let url = NSAttributedString(string: setter.strYoutube ?? "N/A")

            attributedText.append(foodCategory)
            attributedText.append(category)
            attributedText.append(foodOrigin)
            attributedText.append(area)
            attributedText.append(youtubeUrl)
            attributedText.append(url)

            instructionsLabel.attributedText = attributedText
        }
    }
}
