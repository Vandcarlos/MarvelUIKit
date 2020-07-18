//

import MarvelUIKit

protocol NavigationControllerViewDelegate: AnyObject {

    func didShowNavigationTapped()

}

class NavigationControllerView: UIView {

    weak var delegate: NavigationControllerViewDelegate?

    convenience init() {
        self.init(frame: .zero)
        configUI()
    }

    public var showNavigationButton: UIButton = {
        let button = UIButton()
        button.setTitle("Show navigation", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(MUIColorManager.primary.color, for: .normal)
        return button
    }()

    private func configUI() {
        backgroundColor = MUIColorManager.background.color

        addSubview(showNavigationButton)

        NSLayoutConstraint.activate([
            showNavigationButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            showNavigationButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])

        showNavigationButton.addTarget(self, action: #selector(didTouchUpInside), for: .touchUpInside)
    }

    @objc private func didTouchUpInside() {
        delegate?.didShowNavigationTapped()
    }

}
