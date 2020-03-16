//
//  StoreTableViewCell.swift
//  seotro_sa
//
//  Created by 선아 on 2020/03/10.
//  Copyright © 2020 선아. All rights reserved.
//

import UIKit

class SearchBarStoreTableViewCell: UITableViewCell {

    @IBOutlet weak var storeImage: UIImageView!
    @IBOutlet weak var storeName: UILabel!
    @IBOutlet weak var storeDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
