//
//  MainFeedTableViewCell.swift
//  ReAct
//
//  Created by Swathi Iyer on 5/21/17.
//  Copyright © 2017 Swathi Iyer. All rights reserved.
//

import UIKit

class MainFeedTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var billTitle: UILabel!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var timeLeft: UILabel!
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
