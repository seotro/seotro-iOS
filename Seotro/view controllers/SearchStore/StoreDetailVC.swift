//
//  StoreDetailVCViewController.swift
//  seotro_sa
//
//  Created by 선아 on 2020/03/09.
//  Copyright © 2020 선아. All rights reserved.
//

import UIKit

class StoreDetailVC: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var StoreDetailCollectionView: UICollectionView!
    var store: Store?// 처음엔 없으니까 옵셔널 타입으로 설정
     
        
    override func viewDidLoad() {
        super.viewDidLoad()
        StoreDetailCollectionView.dataSource = self
        StoreDetailCollectionView.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        if store != nil{
            return store!.storeImageList.count
        }else{
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoreDetailCell", for: indexPath) as! StoreDetailStoreImageCollectionViewCell
        for image in store!.storeImageList{
            
            cell.storeImage.image = image
            cell.storeName.text = store!.storeName
        }
        return cell
    }
    
    
    
}

