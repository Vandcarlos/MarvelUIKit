//

import UIKit

enum MUIFonts: String, CaseIterable {

    case light = "Montserrat-Light"
    case regular = "Montserrat-Regular"
    case medium = "Montserrat-Medium"

    static func loadFonts() {
        for fontName in self.allCases {
            loadFont(withName: fontName.rawValue)
        }
    }

    private static func loadFont(withName fontName: String) {
      guard
        let fontURL = MarvelUIKit.bundle.url(forResource: fontName, withExtension: "ttf"),
        let fontData = try? Data(contentsOf: fontURL) as CFData,
        let provider = CGDataProvider(data: fontData),
        let font = CGFont(provider) else {
          return
      }
      CTFontManagerRegisterGraphicsFont(font, nil)
    }

}

public enum MUIFontSize {

    case sm
    case md
    case lg

}

public enum MUIFontManager {

    case title
    case body

    public func load(withSize size: MUIFontSize) -> UIFont {
        switch self {
        case .title: return loadTitle(withSize: size)
        case .body: return loadBody(withSize: size)
        }
    }

    private func loadTitle(withSize size: MUIFontSize) -> UIFont {
        var font: UIFont?

        switch size {
        case .sm: font = UIFont(name: MUIFonts.medium.rawValue, size: 18)
        case .md: font = UIFont(name: MUIFonts.medium.rawValue, size: 20)
        case .lg: font = UIFont(name: MUIFonts.regular.rawValue, size: 22)
        }

        return font ?? UIFont()
    }

    private func loadBody(withSize size: MUIFontSize) -> UIFont {
        var font: UIFont?

        switch size {
        case .sm: font = UIFont(name: MUIFonts.medium.rawValue, size: 12)
        case .md: font = UIFont(name: MUIFonts.regular.rawValue, size: 14)
        case .lg: font = UIFont(name: MUIFonts.light.rawValue, size: 16)
        }

        return font ?? UIFont()
    }

}
