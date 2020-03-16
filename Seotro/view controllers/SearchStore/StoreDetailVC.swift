//
//  StoreDetailVCViewController.swift
//  seotro_sa
//
//  Created by 선아 on 2020/03/09.
//  Copyright © 2020 선아. All rights reserved.
//

import UIKit

class StoreDetailVC: UIViewController {
    
    var detailData: Store? {
      didSet {
        configureView()
      }
    }
    
    @IBOutlet weak var storeImage: UIImageView!
    @IBOutlet weak var storeName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    func configureView(){
        storeImage.image = detailData?.storeImage
        storeName.text = detailData?.storeName
        
    }

}

