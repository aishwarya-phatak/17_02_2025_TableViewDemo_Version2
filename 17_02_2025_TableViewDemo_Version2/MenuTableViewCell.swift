//
//  MenuTableViewCell.swift
//  17_02_2025_TableViewDemo_Version2
//
//  Created by Vishal Jagtap on 17/03/25.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    
    @IBOutlet weak var menuImageView: UIImageView!
    @IBOutlet weak var menuItemLabel: UILabel!
    @IBOutlet weak var menuItemDescriptionLabel: UILabel!
    @IBOutlet weak var menuItemPriceLabel: UILabel!
    @IBOutlet weak var btnDeleteMenuItem: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
    
    
}
