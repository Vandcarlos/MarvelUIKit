//
//  BaseViewControllerView.swift
//  MarvelUIKit_Example
//
//  Created by Vandcarlos Mouzinho Sandes Junior on 07/17/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import MarvelUIKit

class BaseViewControllerView: UIView {

    convenience init() {
        self.init(frame: .zero)
        configUI()
    }

    private func configUI() {
        backgroundColor = MUIColorManager.background.color
    }

}
