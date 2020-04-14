//
//  PickedStoreCollectionViewCell.swift
//  Seotro
//
//  Created by suna ji on 2020/04/11.
//  Copyright © 2020 박지수. All rights reserved.
//

import UIKit

class PickedStoreCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var storeImage: UIImageView!
    @IBOutlet weak var storeName: UILabel!
    @IBOutlet weak var cancelButton: UIButton!
    @IBAction func cancel(_ sender: Any) {
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
