//  Copyright © 2016 Russell Stephens. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    let kImageHeaderNib = "ImageHeader"
    let kImageHeaderViewIdentifier = "kImageHeaderViewIdentifier"
    static let headerImage = UIImage(named: "wilson.png")
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.registerNib(UINib(nibName: kImageHeaderNib, bundle: NSBundle(forClass: self.dynamicType)), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: kImageHeaderViewIdentifier)
        flowLayout.headerReferenceSize = CGSizeMake(0, 20)
    }
    // MARK: Private
    
    private func colorForIndex(index: Int) -> UIColor {
        return index % 2 == 0 ? UIColor.whiteColor(): UIColor.blueColor()
    }
    
    // MARK: CollectionView Stuff
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath)
        cell.backgroundColor = colorForIndex(indexPath.row)
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }

    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: kImageHeaderViewIdentifier, forIndexPath: indexPath) as! ImageHeader
        headerView.imageView.image = ViewController.headerImage
        return headerView
    }
}

