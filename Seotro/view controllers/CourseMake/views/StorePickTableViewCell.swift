//
//  StorePickTableViewCell.swift
//  Seotro
//
//  Created by suna ji on 2020/04/03.
//  Copyright © 2020 박지수. All rights reserved.
//

import UIKit

class StorePickTableViewCell: UITableViewCell {
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var storeImage: UIImageView!
    @IBOutlet weak var storeName: UILabel!
    @IBOutlet weak var storeDescription: UILabel!
    @IBAction func pickButton(_ sender: Any) {
    }
    @IBOutlet weak var pickButton: UIButton!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
