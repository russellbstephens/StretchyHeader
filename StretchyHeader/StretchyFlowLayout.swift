//  Copyright © 2016 Russell Stephens. All rights reserved.
//

import UIKit

class StretchyFlowLayout: UICollectionViewFlowLayout {
    
    override func shouldInvalidateLayoutForBoundsChange(newBounds: CGRect) -> Bool {
        return true
    }

    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let collectionView = self.collectionView
        let insets = collectionView?.contentInset
        let offset = collectionView?.contentOffset
        guard let topInset = insets?.top,
              let yOffset = offset?.y,
              let attributes = super.layoutAttributesForElementsInRect(rect) else {
            return nil
        }
        let minY = -topInset
        if yOffset >= minY {
            return attributes
        }
        let deltaY = fabs(yOffset - minY)
        let headerSize = self.headerReferenceSize
        let sectionHeaderAttributes = attributes.filter{ $0.representedElementKind == UICollectionElementKindSectionHeader }
        for header in sectionHeaderAttributes {
            var headerRect = header.frame
            headerRect.size.height = max(minY, headerSize.height + deltaY)
            headerRect.origin.y = headerRect.origin.y - deltaY
            header.frame = headerRect
        }
        return attributes
    }
}
