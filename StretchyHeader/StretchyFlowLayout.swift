//  Copyright © 2016 Russell Stephens. All rights reserved.
//

import UIKit

class StetchyFlowLayout: UICollectionViewFlowLayout {
    
    override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
        return true
    }

    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let collectionView = self.collectionView
        let insets = collectionView?.contentInset
        let offset = collectionView?.contentOffset
        
        guard let topInset = insets?.top else {
            return nil
        }
        let minY = -topInset
        
        guard let yOffset = offset?.y else {
            return nil
        }
        
        guard let attributes = super.layoutAttributesForElementsInRect(rect) else {
            return nil
        }
        
        if yOffset >= minY {
            return attributes
        }
        
        let deltaY = fabs(yOffset - minY)
        for each in attributes {
            let kind = each.representedElementKind
            if kind == UICollectionElementKindSectionHeader {
                let headerSize = self.headerReferenceSize
                var headerRect = each.frame
                headerRect.size.height = max(minY, headerSize.height + deltaY)
                headerRect.origin.y = headerRect.origin.y - deltaY
                each.frame = headerRect
            }
        }
        return attributes
    }
}
