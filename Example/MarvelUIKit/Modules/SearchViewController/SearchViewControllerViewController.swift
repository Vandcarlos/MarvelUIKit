//

import MarvelUIKit

class SearchViewControllerViewController: MUISearchViewController, ModuleItem {

    var name: String = "SearchViewController"

    lazy var currentView: SearchViewControllerView = {
        let view = SearchViewControllerView()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = name
        contentView = currentView
    }

}
