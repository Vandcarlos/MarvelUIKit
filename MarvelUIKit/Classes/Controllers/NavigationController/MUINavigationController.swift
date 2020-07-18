//

import UIKit

open class MUINavigationController: UINavigationController {

    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configNavigationBar()
    }

    private func configNavigationBar() {
        navigationBar.barTintColor = MUIColorManager.primaryLight.color
        navigationBar.isTranslucent = false
        navigationBar.titleTextAttributes = [
            .foregroundColor: MUIColorManager.secondary.color,
            .font: MUIFontManager.title.load(withSize: .md)
        ]
        navigationBar.tintColor = MUIColorManager.secondary.color
    }

}
