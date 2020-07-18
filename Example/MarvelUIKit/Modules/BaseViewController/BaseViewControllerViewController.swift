//

import MarvelUIKit

class BaseViewControllerViewController: MUIBaseViewController, ModuleItem {

    var name: String = "BaseViewControllerView"

    lazy var mainView: BaseViewControllerView = {
        let view = BaseViewControllerView()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        title = name
    }

}
