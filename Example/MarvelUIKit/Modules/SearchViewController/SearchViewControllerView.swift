//

import MarvelUIKit

class SearchViewControllerView: UIView {

    convenience init() {
        self.init(frame: .zero)
        configUI()
    }

    private func configUI() {
        backgroundColor = MUIColorManager.neutralDark.color
    }

}
