//
//  LastStepTableViewCell.swift
//  ReAct
//
//  Created by Swathi Iyer on 5/15/17.
//  Copyright © 2017 Swathi Iyer. All rights reserved.
//

import UIKit

class LastStepTableViewCell: UITableViewCell {

    @IBOutlet weak var selector: UIImageView!
    @IBOutlet weak var issue: UILabel!
    @IBOutlet weak var background: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
