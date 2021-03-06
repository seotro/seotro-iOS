import UIKit

class CourseMakeVC: UIViewController,UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchBar.text!)
    }
    var storeList = [Store]()
    var pickedStoreList = [Store]()
    // 검색기능
    var filteredStore = [Store]()
    let searchController = UISearchController(searchResultsController: nil)
    var isFiltering: Bool{
        return searchController.isActive && !isSearchBarEmpty
    }
    
    @IBOutlet weak var storePickTableView: UITableView!{
        didSet{
            storePickTableView.delegate = self
            storePickTableView.dataSource = self
            storePickTableView.separatorStyle = .none
        }
    }// 테이블뷰 아울렛
    @IBOutlet weak var pickedStoreCollectionView: UICollectionView!{
        didSet{
            pickedStoreCollectionView.delegate = self
            pickedStoreCollectionView.dataSource = self
            
        }
    }
    @IBAction func CompleteButton(_ sender: Any) {
        let storyboard = UIStoryboard.init(name: "CourseArranging", bundle: nil)
        let courseArrangeVC = storyboard.instantiateViewController(withIdentifier: "CourseArrangeVC") as! CourseArrangeVC
        
        courseArrangeVC.modalPresentationStyle = .overCurrentContext
        self.present(courseArrangeVC, animated: false, completion: nil)
        
    }// 코스화면으로 넘어가야함
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setStoreData()
        //스토어픽 테이블셀 xib파일 불러오기
        let nibName = UINib(nibName: "StorePickTableViewCell", bundle: nil)
        storePickTableView.register(nibName, forCellReuseIdentifier: "StorePickTableViewCell")
        // pickedStore콜렉션뷰 셀 xib파일 가져오기
        let pickednibName = UINib(nibName: "PickedStoreCollectionViewCell", bundle:nil)
        pickedStoreCollectionView.register(pickednibName, forCellWithReuseIdentifier: "pickedCell")
        setupFlowLayout()
        // 검색기능
        searchController.searchResultsUpdater = self // search result를 업데이트 하는 개체
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "원하는 가게를 검색해보세요!"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    func filterContentForSearchText(_ searchText: String){
        filteredStore = storeList.filter{(store: Store) -> Bool in
            return store.storeName.lowercased().contains(searchText.lowercased())
        }
        storePickTableView.reloadData()
    }
    
    var isSearchBarEmpty:Bool{
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    
    private func setupFlowLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets.zero //reflect the spacing at the outer edges of the section.
        flowLayout.minimumInteritemSpacing = 10 //set the spacing between items in the same line
        flowLayout.minimumLineSpacing = 10 //between lines of items in the grid.
        flowLayout.scrollDirection = .horizontal
        
        let halfWidth = UIScreen.main.bounds.width / 5
        flowLayout.itemSize = CGSize(width: halfWidth * 0.9 , height: halfWidth)
        pickedStoreCollectionView.collectionViewLayout = flowLayout
        
    }
    
    
    @objc func addToCollection(sender: UIButton) {
        let index = sender.tag
        let pickedStore = storeList[index]
        let indexToFill = pickedStoreList.count
        
        pickedStoreCollectionView.performBatchUpdates({
            pickedStoreList.append(pickedStore)
            pickedStoreCollectionView.insertItems(at: [(NSIndexPath(item: indexToFill, section: 0) as IndexPath)])
        }, completion: nil)
    }
    
    @objc func deleteFromCollection(sender:UIButton){
        let index = sender.tag
        pickedStoreList.remove(at: index)
        pickedStoreCollectionView.reloadData()
        print("index:", index, "\n")
    }
    
    
    
    
    
    
    func setStoreData(){
        let store1 = Store(imageList: ["독수리다방"], name: "독수리다방", description: "신촌")
        let store2 = Store(imageList: ["독수리다방"], name: "독수리다방", description: "신촌")
        let store3 = Store(imageList: ["미도파꽃집"], name: "미도파꽃집", description: "장미")
        let store4 = Store(imageList: ["미림분식"], name: "미림분식", description: "떡볶이")
        let store5 = Store(imageList: ["학림다방"], name: "학림다방", description: "비엔나 커피")
        let store6 = Store(imageList: ["학림다방"], name: "학림다방", description: "비엔나 커피")
        storeList = [store1, store2, store3, store4, store5, store6]
    }
    
}

extension CourseMakeVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering{
            return filteredStore.count
       }else{
            return storeList.count
       }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StorePickTableViewCell", for: indexPath) as! StorePickTableViewCell
        
        let store:Store
        if isFiltering{
            store = filteredStore[indexPath.row]
        }else{
            store = storeList[indexPath.row]
        }
        cell.storeName.text = store.storeName
        cell.storeDescription.text = store.storeDescription
        cell.storeImage.image = store.storeImageList[0]
        cell.pickButton.tag = indexPath.row
        cell.pickButton.addTarget(self, action: #selector(addToCollection(sender:)), for: .touchUpInside)
        
        return cell
    }
}



extension CourseMakeVC: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pickedStoreList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pickedCell", for: indexPath) as! PickedStoreCollectionViewCell
        let store:Store?
        store = pickedStoreList[indexPath.row]
        if store != nil{
            cell.storeImage.image = store!.storeImageList[0]
            cell.storeName.text = store?.storeName
            cell.cancelButton.tag = indexPath.row
            cell.cancelButton.addTarget(self, action: #selector(deleteFromCollection(sender:)), for: .touchUpInside)
        }
       
        return cell
    }



}
