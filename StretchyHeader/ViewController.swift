//  Copyright © 2016 Russell Stephens. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

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


}

