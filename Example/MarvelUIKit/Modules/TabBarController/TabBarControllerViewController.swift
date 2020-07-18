//
//  TabBarControllerViewController.swift
//  MarvelUIKit_Example
//
//  Created by Vandcarlos Mouzinho Sandes Junior on 07/18/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import MarvelUIKit

class TabBarControllerViewController: UIViewController, ModuleItem {

    var name: String = "TabBarController"

    lazy var mainView: TabBarControllerView = {
        let view = TabBarControllerView()
        view.delegate = self
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        title = name
    }

    lazy var dummyViewControllerOne: UIViewController = {
        let viewController = UIViewController()
        viewController.view.backgroundColor = MUIColorManager.secondary.color
        viewController.tabBarItem.title = MUIColorManager.secondary.rawValue
        viewController.tabBarItem.image = MUIImageManager.heart.icon
        return viewController
    }()

    lazy var dummyViewControllerTwo: UIViewController = {
        let viewController = UIViewController()
        viewController.view.backgroundColor = MUIColorManager.tertiary.color
        viewController.tabBarItem.title = MUIColorManager.tertiary.rawValue
        viewController.tabBarItem.image = MUIImageManager.heart.icon
        return viewController
    }()

    lazy var dummyTabBarController: MUITabBarController = {
        let tabBarController = MUITabBarController()
        tabBarController.viewControllers = [dummyViewControllerOne, dummyViewControllerTwo]
        return tabBarController
    }()

    lazy var dummyNavigationController: MUINavigationController = {
        let navigationController = MUINavigationController()
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
        dummyNavigationController.viewControllers = []
    }

}

extension TabBarControllerViewController: TabBarControllerViewDelegate {

    func didShowTabBarTapped() {
        present(dummyTabBarController, animated: true)
    }

    func didShowTabBarInsideNavigationTapped() {
        dummyNavigationController.viewControllers = [dummyTabBarController]
        dummyNavigationController.navigationBar.topItem?.leftBarButtonItems = [dismissBarButtonItem]
        present(dummyNavigationController, animated: true)
    }

}
