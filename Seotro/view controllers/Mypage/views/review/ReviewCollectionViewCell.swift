//
//  ReviewCollectionViewCell.swift
//  Seotro
//
//  Created by 박지수 on 2020/03/19.
//  Copyright © 2020 박지수. All rights reserved.
//

import UIKit

class ReviewCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var courseTitle: UILabel!
    
    @IBOutlet weak var rating: UILabel!
    
    @IBOutlet weak var content: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        courseTitle.sizeToFit()
        rating.sizeToFit()
        content.sizeToFit()
    }

}
