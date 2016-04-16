//
//  DetailCell.swift
//  marvel_heroes
//
//  Created by Thomas Binu on 4/16/16.
//  Copyright © 2016 TMS. All rights reserved.
//

import UIKit

class DetailCell: UITableViewCell {

    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var itemLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
