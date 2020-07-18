//

import UIKit

protocol MUISearchViewDelegate: AnyObject {

    func didSearchButtonTapped(with query: String)
    func didCancelButtonTapped()

}

open class MUISearchView: UIView {

    weak var delegate: MUISearchViewDelegate?

    convenience init() {
        self.init(frame: .zero)
        configUI()
    }

    public lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.searchField?.font = MUIFontManager.body.load(withSize: .lg)
        searchBar.searchField?.textColor = MUIColorManager.neutralDark.color
        searchBar.showsCancelButton = true
        searchBar.enablesReturnKeyAutomatically = false
        searchBar.delegate = self
        return searchBar
    }()

    private (set) var contentView: UIView = UIView()

    func replaceContentView(_ view: UIView) {
        if contentView.superview != nil {
            contentView.removeFromSuperview()
        }

        contentView = view
        configContentView()
    }

    private func configUI() {
        addSubview(searchBar)

        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        ])

        configContentView()
    }

    private func configContentView() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(contentView)

        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension MUISearchView: UISearchBarDelegate {

    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
        let query = searchBar.searchField?.text ?? ""
        delegate?.didSearchButtonTapped(with: query)
    }

    public func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
        delegate?.didCancelButtonTapped()
    }

}
