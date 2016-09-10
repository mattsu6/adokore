import UIKit

class CustomCell: UICollectionViewCell {
  @IBOutlet var imgSample:UIImageView!
  @IBOutlet var lblSample:UILabel!
  
  override init(frame: CGRect){
    super.init(frame: frame)
  }
  required init(coder aDecoder: NSCoder){
    super.init(coder: aDecoder)!
  }
}