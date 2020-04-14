import UIKit

class GuDetailVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    
    @IBOutlet weak var storeCollection: UICollectionView!
    var storeList = [Store]() // Store구조체 리스트
    
    @IBOutlet weak var courseMakeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStoreData()
        
        storeCollection.dataSource = self
        storeCollection.delegate = self
        
 
        let layout : UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
    }
    
    func setStoreData(){
        let store1 = Store(imageList: ["find"], name: "", description: "")
        let store2 = Store(imageList: ["독수리다방"], name: "독수리다방", description: "신촌")
        let store3 = Store(imageList: ["미도파꽃집"], name: "미도파꽃집", description: "장미")
        let store4 = Store(imageList: ["미림분식"], name: "미림분식", description: "떡볶이")
        let store5 = Store(imageList: ["학림다방"], name: "학림다방", description: "비엔나 커피")
        let store6 = Store(imageList: ["학림다방"], name: "학림다방", description: "비엔나 커피")
        
        storeList = [store1, store2, store3, store4, store5, store6]
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storeList.count
    }// 프로토콜 준수
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoreCell", for: indexPath) as! GuDetailStoreCollectionViewCell
        let store = storeList[indexPath.row]
        
        if(indexPath.row == 0){
            cell.storeImage.backgroundColor = .lightGray
        }
        cell.storeImage.image = store.storeImageList[0] 
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
            let dvc = UIStoryboard(name: "SearchStore", bundle: nil).instantiateViewController(withIdentifier: "StoreDetail") as! StoreDetailVC
            let navi = UINavigationController(rootViewController: dvc)
            let store: Store
            store = storeList[indexPath.row]
            dvc.store = store
            self.present(navi, animated: true, completion: nil)
            // e1. GuDetail->Store detail로 넘어가면 back버튼 안나온다
        }
    }// 셀 선택시 가게 디테일 뷰로 넘어가도록
    

    @IBAction func courseMake(_ sender: Any) {
        //코스짜기 버튼에 연결된 액션으로 버튼 누르면 코스짜는 vc로 넘어가도록 한다.
        let storyboard = UIStoryboard.init(name: "CourseMaking", bundle: nil)
        let courseMakeVC = storyboard.instantiateViewController(withIdentifier: "courseMakeVC")
        //기존 VC에 새로운 VC덮어씌워 참조
        let navi = UINavigationController(rootViewController: courseMakeVC)
        self.present(navi, animated: false, completion: nil)
    }
}

