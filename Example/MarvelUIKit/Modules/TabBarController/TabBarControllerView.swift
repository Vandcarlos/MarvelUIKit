//
//  TabBarControllerView.swift
//  MarvelUIKit_Example
//
//  Created by Vandcarlos Mouzinho Sandes Junior on 07/18/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import MarvelUIKit

protocol TabBarControllerViewDelegate: AnyObject {

    func didShowTabBarTapped()
    func didShowTabBarInsideNavigationTapped()

}

class TabBarControllerView: UIView {

    weak var delegate: TabBarControllerViewDelegate?

    convenience init() {
        self.init(frame: .zero)
        configUI()
    }

    public var showTabBarButton: UIButton = {
        let button = UIButton()
        button.setTitle("Show tab bar", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(MUIColorManager.primary.color, for: .normal)
        return button
    }()

    public var showTabBarInsideNavigtionButton: UIButton = {
        let button = UIButton()
        button.setTitle("Show tab bar inside navigation", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(MUIColorManager.primary.color, for: .normal)
        return button
    }()

    private func configUI() {
        backgroundColor = MUIColorManager.background.color

        addSubview(showTabBarButton)
        addSubview(showTabBarInsideNavigtionButton)

        NSLayoutConstraint.activate([
            showTabBarButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            showTabBarButton.centerXAnchor.constraint(equalTo: centerXAnchor),

            showTabBarInsideNavigtionButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            showTabBarInsideNavigtionButton.topAnchor.constraint(equalTo: showTabBarButton.bottomAnchor)

        ])

        showTabBarButton.addTarget(self, action: #selector(didTouchUpInsideShowTabBar), for: .touchUpInside)
        showTabBarInsideNavigtionButton.addTarget(
            self,
            action: #selector(didTouchUpInsideShowTabBarInsideNavigation),
            for: .touchUpInside
        )
    }

    @objc private func didTouchUpInsideShowTabBar() {
        delegate?.didShowTabBarTapped()
    }

    @objc private func didTouchUpInsideShowTabBarInsideNavigation() {
        delegate?.didShowTabBarInsideNavigationTapped()
    }

}
