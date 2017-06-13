//
//  ProfileTableViewCell.swift
//  ReAct
//
//  Created by Swathi Iyer on 6/5/17.
//  Copyright © 2017 Swathi Iyer. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var issueImage: UIImageView!
    @IBOutlet weak var timeLeftIcon: UIImageView!
    @IBOutlet weak var timeLeft: UILabel!
    @IBOutlet weak var billTitle: UILabel!
    @IBOutlet weak var billCategory: UILabel!
    @IBOutlet weak var reactButton: UIButton!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
