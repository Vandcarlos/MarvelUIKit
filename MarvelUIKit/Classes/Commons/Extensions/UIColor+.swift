//

import UIKit

extension UIColor {

    public convenience init?(key: MUIColorManager) {
        self.init(named: key.colorName, in: MarvelUIKit.bundle, compatibleWith: nil)
    }

}
