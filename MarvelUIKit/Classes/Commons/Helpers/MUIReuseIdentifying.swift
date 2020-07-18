//

public protocol MUIReuseIdentifying: AnyObject {

    static var reuseIdentifier: String { get }

}

extension MUIReuseIdentifying {

    public static var reuseIdentifier: String {
        return String(describing: Self.self)
    }

}
