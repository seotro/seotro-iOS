//
//  SearchStore.swift
//  seotro_sa
//
//  Created by 선아 on 2020/03/09.
//  Copyright © 2020 선아. All rights reserved.
//

import UIKit

class SearchStoreVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
   
    var storeList = [Store]()
    let searchController = UISearchController(searchResultsController: nil) // initializing
    var filteredStore = [Store]()
    var isFiltering: Bool{
        return searchController.isActive && !isSearchBarEmpty
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setStoreData()
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "원하는 가게를 검색해보세요!"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    func filterContentForSearchText(_ searchText: String){
        filteredStore = storeList.filter{(store:Store) -> Bool in
            return store.storeName.lowercased().contains(searchText.lowercased())
        }
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ShowDetailSegue"{
            (segue.destination as! StoreDetailVC).detailData =
                storeList[tableView.indexPathForSelectedRow!.row]
        }
        
        
    }
    var isSearchBarEmpty: Bool{
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func setStoreData(){
        let store1 = Store(image: "독수리다방", name: "독수리다방", description: "신촌")
        let store2 = Store(image: "독수리다방", name: "독수리다방", description: "신촌")
        let store3 = Store(image: "미도파꽃집", name: "미도파꽃집", description: "장미")
        let store4 = Store(image: "미림분식", name: "미림분식", description: "떡볶이")
        let store5 = Store(image: "학림다방", name: "학림다방", description: "비엔나 커피")
        let store6 = Store(image: "학림다방", name: "학림다방", description: "비엔나 커피")
        
        storeList = [store1, store2, store3, store4, store5, store6]
    }
    
}

extension SearchStoreVC: UITableViewDataSource, UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering{
            return filteredStore.count
        }else{
             return storeList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchBarStoreTableViewCell", for: indexPath) as! SearchBarStoreTableViewCell
        
        let store:Store
        if isFiltering{
            store = filteredStore[indexPath.row]
        }else{
            store = storeList[indexPath.row]
        }
       
        
        cell.storeImage.image = store.storeImage
        cell.storeName.text = store.storeName
        cell.storeDescription.text = store.storeDescription
        
        return cell
    }
}

extension SearchStoreVC:UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        filterContentForSearchText(searchBar.text!)
    }
}

