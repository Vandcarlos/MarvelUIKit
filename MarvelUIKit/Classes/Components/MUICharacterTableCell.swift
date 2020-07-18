//

import UIKit
import SkeletonView

open class MUICharacterTableCell: UITableViewCell {

    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configUI()
    }

    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        configUI()
    }

    private let cellInsets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)

    public var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .top
        stackView.spacing = 10
        return stackView
    }()

    public var thumbnailImageView: MUIThumbnailImageView = {
        let thumbnailImageView = MUIThumbnailImageView(size: .smWidth)
        return thumbnailImageView
    }()

    public var nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = MUIColorManager.neutral.color
        label.font = MUIFontManager.title.load(withSize: .md)
        return label
    }()

    private func configUI() {
        backgroundColor = MUIColorManager.background.color
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = MUIColorManager.neutralLight.color.cgColor
        contentView.layer.cornerRadius = 8
        isSkeletonable = true

        contentView.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])

        stackView.addArrangedSubview(thumbnailImageView)
        stackView.addArrangedSubview(nameLabel)
    }

    open override func layoutSubviews() {
        super.layoutSubviews()
        layoutSkeletonIfNeeded()
        contentView.layer.masksToBounds = true

        contentView.frame = contentView.frame.inset(by: cellInsets)
    }

}
