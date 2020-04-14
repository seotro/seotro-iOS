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
    var storeName: String
    var storeDescription: String
    var storeImageList :[UIImage]
    var isPicked: Bool
    
    init(imageList:[String], name:String, description: String){
        self.storeImageList = [UIImage]()
        for image in imageList{
            self.storeImageList.append(UIImage(named: image)!)
        }
        self.storeName = name
        self.storeDescription = description
        self.isPicked = false
    }
}
