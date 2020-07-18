//
//  BaseViewControllerViewController.swift
//  MarvelUIKit_Example
//
//  Created by Vandcarlos Mouzinho Sandes Junior on 07/17/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import MarvelUIKit

class BaseViewControllerViewController: MUIBaseViewController, ModuleItem {

    var name: String = "BaseViewControllerView"

    lazy var mainView: BaseViewControllerView = {
        let view = BaseViewControllerView()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        title = name
    }

}
