import UIKit

class StoreCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var storeImage: UIImageView!
    @IBOutlet weak var storeName: UILabel!
    @IBOutlet weak var storeDescription: UILabel!
    
  
    // 객체 초기화
    override func awakeFromNib() {
        super.awakeFromNib()
        
        super.awakeFromNib()
        storeImage.layer.cornerRadius = storeImage.bounds.width / 2
        storeImage.layer.masksToBounds = true
    }
    
}
