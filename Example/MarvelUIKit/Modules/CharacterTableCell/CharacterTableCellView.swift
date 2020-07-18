//

import MarvelUIKit

class CharacterTableCellView: UIView {

    convenience init() {
        self.init(frame: .zero)
        configUI()
    }

    var tableView: UITableView = {
        let tableView = UITableView()

        tableView.register(
            MUICharacterTableCell.self,
            forCellReuseIdentifier: MUICharacterTableCell.reuseIdentifier
        )
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 150
        return tableView
    }()

    func configUI() {
        addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])

    }

}
