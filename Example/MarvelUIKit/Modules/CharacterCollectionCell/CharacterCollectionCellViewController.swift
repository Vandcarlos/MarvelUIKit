//

import MarvelUIKit

class CharacterCollectionCellViewController: UIViewController, ModuleItem {

    var name: String = "CharacterCollectionCell"

    lazy var mainView: CharacterCollectionCellView = {
        let view = CharacterCollectionCellView()
        view.collectionView.delegate = self
        view.collectionView.dataSource = self
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = mainView
        mainView.collectionView.layoutIfNeeded()
        title = name
    }

}

extension CharacterCollectionCellViewController:
UICollectionViewDelegateFlowLayout,
UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MUICharacterCollectionCell.reuseIdentifier,
            for: indexPath
        )

        guard let mUICharacterCollectionCell = cell as? MUICharacterCollectionCell
            else { return UICollectionViewCell() }

        if indexPath.row == 0 {
            mUICharacterCollectionCell.hideSkeleton()
            mUICharacterCollectionCell.nameLabel.text = "Capita"
        } else {
            mUICharacterCollectionCell.showAnimatedGradientSkeleton()
        }

        return cell
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(width: 200, height: 200)
    }

}
