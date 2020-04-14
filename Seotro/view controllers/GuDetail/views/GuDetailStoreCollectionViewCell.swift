//
//  GuDetailStoreCollectionViewCell.swift
//  Seotro
//
//  Created by suna ji on 2020/03/18.
//  Copyright © 2020 박지수. All rights reserved.
//

import UIKit

class GuDetailStoreCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var storeImage: UIImageView!
    @IBOutlet weak var storeName: UILabel!
    @IBOutlet weak var storeDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        storeImage.layer.cornerRadius = storeImage.bounds.width / 2
        storeImage.layer.masksToBounds = true
    }
    
}
