//
//  MainViewController.swift
//  MarvelUIKit_Example
//
//  Created by Vandcarlos Mouzinho Sandes Junior on 07/17/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {

    var modules: [ModuleItem] = [
        BaseViewControllerViewController()
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.reuseIdentifier)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modules.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: MainTableViewCell.reuseIdentifier,
            for: indexPath
        )

        guard let mainTableViewCell = cell as? MainTableViewCell else { return cell }

        mainTableViewCell.nameLabel.text = modules[indexPath.row].name

        return mainTableViewCell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = modules[indexPath.row]

        self.navigationController?.pushViewController(viewController, animated: true)
    }

}
