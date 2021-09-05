//
//  FoodCell.swift
//  FoodFest
//
//  Created by Takasur Azeem on 03/09/2021.
//

import UIKit

class FoodCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(food: Food?) {
        textLabel?.text = food?.name
        detailTextLabel?.text = food?.restaurant
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
