//

import MarvelUIKit
import SkeletonView

class CharacterTableCellViewController: UIViewController, ModuleItem {

    var name: String = "CharacterTableCell"

    lazy var mainView: CharacterTableCellView = {
        let mainView = CharacterTableCellView()
        mainView.tableView.dataSource = self
        return mainView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        title = name
    }

}

extension CharacterTableCellViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: MUICharacterTableCell.reuseIdentifier,
            for: indexPath
        )

        guard let mCharacterTableCell = cell as? MUICharacterTableCell else { return UITableViewCell() }

        if indexPath.row == 0 {
            mCharacterTableCell.hideSkeleton()
            mCharacterTableCell.nameLabel.text = "Capita"
        } else {
            mCharacterTableCell.showAnimatedGradientSkeleton()
        }

        return cell
    }

}
