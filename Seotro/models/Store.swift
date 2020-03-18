//
//  Store.swift
//  Seotro
//
//  Created by suna ji on 2020/03/18.
//  Copyright © 2020 박지수. All rights reserved.
//

import Foundation
import UIKit

struct Store{
    var storeImage: UIImage?
    var storeName: String
    var storeDescription: String
    
    init(image: String, name:String, description: String){
        self.storeImage = UIImage(named: image)
        self.storeName = name
        self.storeDescription = description
    }
}
