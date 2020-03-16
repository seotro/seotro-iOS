import UIKit

class GuDetailVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    
    @IBOutlet weak var storeCollection: UICollectionView!
    var storeList = [Store]() // Store구조체 리스트
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStoreData()
        
        storeCollection.dataSource = self
        storeCollection.delegate = self
        
 
        let layout : UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
    }
    
    func setStoreData(){
        let store1 = Store(image: "find", name: "", description: "")
        let store2 = Store(image: "독수리다방", name: "독수리다방", description: "신촌")
        let store3 = Store(image: "미도파꽃집", name: "미도파꽃집", description: "장미")
        let store4 = Store(image: "미림분식", name: "미림분식", description: "떡볶이")
        let store5 = Store(image: "학림다방", name: "학림다방", description: "비엔나 커피")
        let store6 = Store(image: "학림다방", name: "학림다방", description: "비엔나 커피")
        
        storeList = [store1, store2, store3, store4, store5, store6]
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storeList.count
    }// 프로토콜 준수
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoreCell", for: indexPath) as! StoreCollectionViewCell
        let store = storeList[indexPath.row]
        
        if(indexPath.row == 0){
            cell.storeImage.backgroundColor = .lightGray
        }
        cell.storeImage.image = store.storeImage
        cell.storeName.text = store.storeName
        cell.storeDescription.text = store.storeDescription
        
        return cell
    }// 프로토콜 준수
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // 첫번째 셀 선택 -> 검색창
        if(indexPath.row == 0){
            let dvc = UIStoryboard(name: "SearchStore", bundle: nil).instantiateViewController(withIdentifier: "SearchStore") as! SearchStoreVC
            let navi = UINavigationController(rootViewController: dvc)
            
            self.present(navi, animated: true, completion: nil)
            
            
        }else{
             let storyboard = UIStoryboard.init(name: "SearchStore", bundle: nil)
             let StoreDetailVC = storyboard.instantiateViewController(withIdentifier: "StoreDetail")
            
             self.present(StoreDetailVC, animated: false, completion: nil)
        }
    }// 셀 선택시 가게 디테일 뷰로 넘어가도록
    
}

