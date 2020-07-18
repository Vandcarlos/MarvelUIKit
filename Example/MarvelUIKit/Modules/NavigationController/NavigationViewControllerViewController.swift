//
//  NavigationControllerViewController.swift
//  MarvelUIKit_Example
//
//  Created by Vandcarlos Mouzinho Sandes Junior on 07/18/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import MarvelUIKit

class NavigationControllerViewController: UIViewController, ModuleItem {

    var name: String = "NavigationViewController"

    lazy var mainView: NavigationControllerView = {
        let view = NavigationControllerView()
        view.delegate = self
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        title = name
    }

    lazy var dummyViewController: UIViewController = {
        let viewController = UIViewController()
        viewController.view.backgroundColor = MUIColorManager.background.color
        return viewController
    }()

    lazy var dummyNavigationController: MUINavigationController = {
        let navigationController = MUINavigationController(rootViewController: dummyViewController)
        navigationController.modalPresentationStyle = .fullScreen
        return navigationController
    }()

    lazy var dismissBarButtonItem: UIBarButtonItem = {
        let barButtonItem = UIBarButtonItem()
        barButtonItem.title = "Close"
        barButtonItem.target = self
        barButtonItem.action = #selector(dismissDummyNavigationController)
        return barButtonItem
    }()

    @objc func dismissDummyNavigationController() {
        dummyNavigationController.dismiss(animated: true)
    }
}

extension NavigationControllerViewController: NavigationControllerViewDelegate {

    func didShowNavigationTapped() {
        dummyNavigationController.navigationBar.topItem?.leftBarButtonItems = [dismissBarButtonItem]
        present(dummyNavigationController, animated: true)
    }

}
