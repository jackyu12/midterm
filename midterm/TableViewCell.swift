//
//  TableViewCell.swift
//  midterm
//
//  Created by Jack Yu on 3/30/21.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var pos: UILabel!
    @IBOutlet weak var tc: UILabel!
    @IBOutlet weak var state: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
