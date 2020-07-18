//
//  UIImage+.swift
//  MarvelUIKit
//
//  Created by Vandcarlos Mouzinho Sandes Junior on 07/18/2020.
//

import UIKit

extension UIImage {

    public convenience init?(key: MUIImageManager) {
        self.init(named: key.rawValue, in: MarvelUIKit.bundle, compatibleWith: nil)
    }

}
