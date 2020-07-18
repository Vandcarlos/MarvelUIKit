//

import UIKit

extension UIImage {

    public convenience init?(key: MUIImageManager) {
        self.init(named: key.rawValue, in: MarvelUIKit.bundle, compatibleWith: nil)
    }

}
