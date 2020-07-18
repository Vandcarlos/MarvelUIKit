//

import UIKit

public enum MUIThumbnailImageViewSize: CGFloat {

    case smWidth = 100
    case lgWidth = 200
    case smHeight = 150
    case lgHeight = 300

}

open class MUIThumbnailImageView: UIImageView {

    var size: MUIThumbnailImageViewSize

    public init(size: MUIThumbnailImageViewSize) {
        self.size = size

        super.init(image: MUIImageManager.defaultThumbnail.image)
        configUI()
    }

    required public init?(coder: NSCoder) {
        size = .smWidth
        super.init(coder: coder)
    }

    private func configUI() {

        if size == .smWidth || size == .lgWidth {
            widthAnchor.constraint(equalToConstant: size.rawValue).isActive = true
        } else {
            heightAnchor.constraint(equalToConstant: size.rawValue).isActive = true
        }

    }

}
