//
//  MUITabBarController.swift
//  MarvelUIKit
//
//  Created by Vandcarlos Mouzinho Sandes Junior on 07/18/2020.
//

import UIKit

open class MUITabBarController: UITabBarController {

    open override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
    }

    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configTabBar()
    }

    private func configTabBar() {
        tabBar.barTintColor = MUIColorManager.secondaryLight.color
        tabBar.isTranslucent = false
        tabBar.tintColor = MUIColorManager.primary.color
        tabBar.unselectedItemTintColor = MUIColorManager.neutralLight.color

        let appearance = UITabBarItem.appearance()

        appearance.setTitleTextAttributes([
            .font: MUIFontManager.body.load(withSize: .sm),
            .foregroundColor: MUIColorManager.primary.color
        ], for: .normal)
    }
}

extension MUITabBarController: UITabBarControllerDelegate {

    public func tabBarController(
        _ tabBarController: UITabBarController,
        didSelect viewController: UIViewController
    ) {
        title = viewController.title
    }
}
