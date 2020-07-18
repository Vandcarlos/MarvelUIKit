//

import MarvelUIKit

class CharacterCollectionCellView: UIView {

    convenience init() {
        self.init(frame: .zero)
        configUI()
    }

    var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(
            MUICharacterCollectionCell.self,
            forCellWithReuseIdentifier: MUICharacterCollectionCell.reuseIdentifier
        )
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor.clear
        return collectionView
    }()

    func configUI() {
        backgroundColor = UIColor.white
        addSubview(collectionView)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }

}
