//
//  MUIImageManager.swift
//  MarvelUIKit
//
//  Created by Vandcarlos Mouzinho Sandes Junior on 07/18/2020.
//

import UIKit

public enum MUIImageManager: String {

    case defaultThumbnail = "default_thumbnail"

    case heart
    case heartTwo = "heart_2"
    case menu

    public var image: UIImage {
        return UIImage(key: self) ?? UIImage()
    }

    public var icon: UIImage {
        return (UIImage(key: self) ?? UIImage()).withRenderingMode(.alwaysTemplate)
    }

}
