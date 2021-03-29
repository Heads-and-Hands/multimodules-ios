//
//  File.swift
//  
//
//  Created by Eugene Sorokin on 28.02.2021.
//

import CommonAssets
import UIKit

class CatalogCell: UICollectionViewCell {
    // MARK: Internal

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @discardableResult
    func update(with data: CatalogCellData) -> CatalogCell {
        titleLabel.text = data.title
        descriptionLabel.text = data.description
        priceButton.setTitle(data.price, for: .normal)
        onAdd = data.onAdd
        return self
    }

    // MARK: Private

    private var onAdd: (() -> Void)?

    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var descriptionLabel: UILabel!
    @IBOutlet private var priceButton: UIButton!

    @IBAction private func onPressAdd() {
        onAdd?()
    }
}

// MARK: Static

extension CatalogCell {
    static var nib: UINib {
        UINib(nibName: String(describing: self), bundle: Bundle.module)
    }

    static var reuseIdentifire: String {
        String(describing: self)
    }

    static var defaultLayoutSection: NSCollectionLayoutSection {
        let sectionInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10)
        let itemInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)

        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1 / 2),
            heightDimension: .fractionalWidth(1)
        )

        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalWidth(1)
        )

        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = itemInsets
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = sectionInsets
        return section
    }
}
