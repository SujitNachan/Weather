//
//  CityCell.swift
//  Ansh
//
//  Created by Sujit Nachan on 13/03/19.
//  Copyright © 2019 Sujit Nachan. All rights reserved.
//

import UIKit

class CityCell: UITableViewCell {
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        cityLabel.text = nil
        tempLabel.text = nil
    }
    
    func setupCell(name: String?, temp: String?) {
        
        cityLabel.text = name
        if let temp = temp {
            let tempAtt = AttributedTextComponent(text: temp, font: UIFont.systemFont(ofSize: 14), color: UIColor.darkGray)
            let tempPlaceholder = AttributedTextComponent(text: "°C", font: UIFont.systemFont(ofSize: 11), color: UIColor.darkGray)
            
            tempLabel.attributedText = AttributedText(components: [tempAtt,tempPlaceholder], separator: " ").attributedString()
        }
    }

}
