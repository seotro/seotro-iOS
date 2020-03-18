import UIKit

class StoreCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var storeImage: UIImageView!
    @IBOutlet weak var storeName: UILabel!
    @IBOutlet weak var storeDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        storeImage.layer.cornerRadius = storeImage.bounds.width / 2
        storeImage.layer.masksToBounds = true
    }
}
