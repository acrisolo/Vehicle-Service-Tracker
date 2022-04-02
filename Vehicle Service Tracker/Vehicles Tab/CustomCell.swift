//
//  CustomCell.swift
//  Vehicle Service Tracker
//
//  Created by Alan Crisologo on 2/12/22.
//

import UIKit

class CustomCell: UITableViewCell {
    
    @IBOutlet weak var carView: UIView!
    @IBOutlet weak var carLabel: UILabel!
    @IBOutlet weak var carYearLabel: UILabel!
    @IBOutlet weak var carImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
