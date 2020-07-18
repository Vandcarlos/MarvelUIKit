//

import UIKit

open class MUISearchViewController: MUIBaseViewController {

    private (set) public var currentQuery = ""

    public lazy var mainView: MUISearchView = {
        let view = MUISearchView()
        view.delegate = self
        return view
    }()

    open var contentView: UIView = UIView() {
        didSet {
            mainView.replaceContentView(contentView)
        }
    }

    open override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
    }

    open func didCurrentQueryChanged() {}

}

extension MUISearchViewController: MUISearchViewDelegate {

    func didSearchButtonTapped(with query: String) {
        currentQuery = query
        didCurrentQueryChanged()
    }

    func didCancelButtonTapped() {
        mainView.searchBar.searchField?.text = currentQuery
    }

}
