//
//  CourseCollectionViewCell.swift
//  Seotro
//
//  Created by 박지수 on 2020/03/19.
//  Copyright © 2020 박지수. All rights reserved.
//

import UIKit

class CourseCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var detail: UILabel!
    @IBOutlet weak var startPlace: UILabel!
    @IBOutlet weak var endPlace: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        title.sizeToFit()
        detail.sizeToFit()
        startPlace.sizeToFit()
        endPlace.sizeToFit()
        print("cell loaded");
    }

}
