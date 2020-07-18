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
