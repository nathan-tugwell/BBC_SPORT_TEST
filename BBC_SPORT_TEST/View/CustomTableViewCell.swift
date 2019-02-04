//
//  CustomTableViewCell.swift
//  BBC_SPORT_TEST
//
//  Created by Nathan Tugwell on 04/02/2019.
//  Copyright © 2019 nathantugwell. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var f1Image: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var lastUpdated: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
