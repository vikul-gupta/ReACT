//
//  SingleIssueTableViewCell.swift
//  ReAct
//
//  Created by Christopher Lu on 5/31/17.
//  Copyright © 2017 Swathi Iyer. All rights reserved.
//

import UIKit

class SingleIssueTableViewCell: UITableViewCell {

    
    
    @IBOutlet var backgroundImage: UIImageView!
    @IBOutlet var billTitle: UILabel!
    @IBOutlet var category: UILabel!
    @IBOutlet var timeLeft: UILabel!
    @IBOutlet var reactButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
