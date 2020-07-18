//

import UIKit

public enum MUIColorManager: String {

    case primary
    case primaryLight = "primary_light"
    case primaryDark = "primary_dark"

    case secondary
    case secondaryLight = "secondary_light"
    case secondaryDark = "secondary_dark"

    case tertiary
    case tertiaryLight = "tertiary_light"
    case tertiaryDark = "tertiary_dark"

    case neutral
    case neutralLight = "neutral_light"
    case neutralDark = "neutral_dark"

    case success
    case alert
    case error

    case background

    var colorName: String {
        "\(rawValue)_color"
    }

    public var color: UIColor {
        return UIColor(key: self) ?? UIColor()
    }

}
