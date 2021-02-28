//
//  File.swift
//  
//
//  Created by Eugene Sorokin on 25.02.2021.
//

import UIKit

public class CatalogViewController: UIViewController {
    // MARK: Internal

    public override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        loadData()
    }

    // MARK: Private

    private let privider = CatalogProvider()

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.frame = view.bounds
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CatalogCell.nib, forCellWithReuseIdentifier: CatalogCell.reuseIdentifire)
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()

    private var collectionLayout: UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { _, _ -> NSCollectionLayoutSection? in
            CatalogCell.defaultLayoutSection
        }
    }

    private var cellsData: [CatalogCellData] = []

    private func loadData() {
        privider.fetchCatalog { [weak self] in
            guard let self = self else {
                return
            }

            switch $0 {
            case let .success(products):
                self.cellsData = products.map {
                    self.makeCellData(model: $0)
                }
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }

    private func makeCellData(model: Product) -> CatalogCellData {
        CatalogCellData(
            title: model.title,
            description: model.description,
            image: model.image,
            price: model.price,
            onSelect: { print("On select product \(model.title)") },
            onAdd: { print("Add to cart product \(model.title)") })
    }
}

// MARK: UICollectionViewDataSource + UICollectionViewDelegate

extension CatalogViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        min(1, cellsData.count)
    }

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cellsData.count
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CatalogCell.reuseIdentifire, for: indexPath)

        if let cell = cell as? CatalogCell, indexPath.item < cellsData.count {
            cell.update(with: cellsData[indexPath.item])
        }

        return cell
    }

    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard indexPath.item < cellsData.count else {
            return
        }

        cellsData[indexPath.item].onSelect?()
    }
}
