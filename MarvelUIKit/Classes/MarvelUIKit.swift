//

import Foundation

open class MarvelUIKit {

    private init() {}

    let shared = MarvelUIKit()

    static let bundle = Bundle(for: MarvelUIKit.self)

    public static func configure() {
        MUIFonts.loadFonts()
    }

}
