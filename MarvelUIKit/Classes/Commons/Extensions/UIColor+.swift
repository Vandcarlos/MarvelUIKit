//
//  UIColor+.swift
//  MarvelUIKit
//
//  Created by Vandcarlos Mouzinho Sandes Junior on 07/07/20.
//

import UIKit

extension UIColor {

    public convenience init?(key: MUIColorManager) {
        self.init(named: key.colorName, in: MarvelUIKit.bundle, compatibleWith: nil)
    }

}
