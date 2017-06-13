//
//  ExploreIssuesTableViewCell.swift
//  ReAct
//
//  Created by Swathi Iyer on 5/27/17.
//  Copyright © 2017 Swathi Iyer. All rights reserved.
//

import UIKit

class ExploreIssuesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var IssueImage: UIImageView!
    @IBOutlet weak var IssueFollowButton: UIButton!
    @IBOutlet weak var IssueText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
