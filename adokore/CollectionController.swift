import UIKit

class CollectionController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
  
  var cellSize: CGFloat = 0.0
  var imageNum: Int = AdokoreUser.adokoreUser.ads.count
  var images: [String] = AdokoreUser.adokoreUser.ads
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.collectionView?.backgroundColor = UIColor(red: 1, green: 0.7843, blue: 0.5882, alpha: 1.0) /* #ffc896 */
    //表示するセルサイズを設定
    cellSize = self.view.frame.size.width/2-10
    
  }
  
  //セルを表示する
  override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as UICollectionViewCell
    
    let imageView = cell.contentView.viewWithTag(1) as! UIImageView
    let imageCell = UIImage(named: images[indexPath.row])
    imageView.frame = CGRectMake(imageView.frame.origin.x,imageView.frame.origin.y,cellSize,cellSize)
    imageView.image = imageCell
    cell.backgroundColor = UIColor.brownColor()
    
    return cell
  }
  
  //セクションの数を設定（セクションの中にセルがある）
  override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
    return 1
  }
  
  //セルの表示上限
  override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return imageNum
  }
  
  // Screenサイズに応じたセルサイズを返す
  // UICollectionViewDelegateFlowLayoutの設定が必要
  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
    return CGSizeMake(cellSize, cellSize)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
}