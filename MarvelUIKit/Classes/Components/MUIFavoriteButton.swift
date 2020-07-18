//

import UIKit

public protocol MUIFavoriteButtonDelegate: AnyObject {

    func didTouchUpInside()

}

open class MUIFavoriteButton: UIButton {

    public weak var delegate: MUIFavoriteButtonDelegate?

    convenience init() {
        self.init(frame: .zero)
        configUI()
    }

    public var isFavorite = false {
        didSet {
            refreshColor()
        }
    }

    private func configUI() {
        translatesAutoresizingMaskIntoConstraints = false
        setImage(MUIImageManager.heart.icon, for: .normal)
        refreshColor()

        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 36),
            widthAnchor.constraint(equalToConstant: 36)
        ])

        addTarget(self, action: #selector(touchUpInside), for: .touchUpInside)
    }

    private func refreshColor() {
        tintColor = isFavorite ? MUIColorManager.primaryLight.color : MUIColorManager.neutralLight.color
    }

    @objc func touchUpInside() {
        isFavorite = !isFavorite
        delegate?.didTouchUpInside()
    }

}
