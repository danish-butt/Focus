//
//  HistoryTableViewCell.swift
//  Focus
//
//  Created by Jaydeep Singh on 3/15/17.
//  Copyright © 2017 Group. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {

    @IBOutlet var timeSpent: UILabel!
    @IBOutlet var taskName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
