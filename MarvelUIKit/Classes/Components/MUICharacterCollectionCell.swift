//

import UIKit
import SkeletonView

public protocol MUICharacterCollectionCellDelegate: AnyObject {

    func didToggleFavorite(tag: Int)

}

open class MUICharacterCollectionCell: UICollectionViewCell {

    public weak var delegate: MUICharacterCollectionCellDelegate?

    public override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }

    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        configUI()
    }

    public var isFavorite: Bool {
        favoriteButton.isFavorite
    }

    public var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        stackView.alignment = .center
        return stackView
    }()

    public var thumbnailImageView: MUIThumbnailImageView = {
        let thumbnailImageView = MUIThumbnailImageView(size: .smHeight)
        thumbnailImageView.layer.masksToBounds = true
        return thumbnailImageView
    }()

    public var nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .center
        label.textColor = MUIColorManager.neutral.color
        label.font = MUIFontManager.title.load(withSize: .md)
        return label
    }()

    public lazy var favoriteButton: MUIFavoriteButton = {
        let button = MUIFavoriteButton()
        button.delegate = self
        return button
    }()

    private func configUI() {
        backgroundColor = MUIColorManager.background.color
        layer.borderWidth = 1
        layer.borderColor = MUIColorManager.neutralLight.color.cgColor
        layer.cornerRadius = 8
        layer.masksToBounds = true
        isSkeletonable = true

        addSubview(stackView)
        stackView.addArrangedSubview(thumbnailImageView)
        stackView.addArrangedSubview(nameLabel)
        addSubview(favoriteButton)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            favoriteButton.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            favoriteButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4)
        ])
    }

    open override func layoutSubviews() {
        super.layoutSubviews()
        layoutSkeletonIfNeeded()
        layer.masksToBounds = true
    }

}

extension MUICharacterCollectionCell: MUIFavoriteButtonDelegate {

    public func didTouchUpInside() {
        delegate?.didToggleFavorite(tag: tag)
    }

}
