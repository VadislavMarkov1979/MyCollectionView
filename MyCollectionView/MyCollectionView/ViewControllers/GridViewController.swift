//
//  GridViewController.swift
//  MyCollectionView
//
//  Created by Владимир on 05.07.2022.
//

import UIKit

class GridViewController: UIViewController, UICollectionViewDelegate {
    
    enum Section {
        case main
    }
    
    var dataSourse: UICollectionViewDiffableDataSource<Section, Int>?
    var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configureStructure()
        configureDataSource()
    }
    
    private func setupView() {
        navigationItem.title = "Grid"
        view.backgroundColor = .white
    }
    
    private func creatlayout() -> UICollectionViewLayout {
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2),
                                                 heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)

            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                  heightDimension: .fractionalWidth(0.2))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                             subitems: [item])

            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .continuous
            let layout = UICollectionViewCompositionalLayout(section: section)
            return layout
    }
    
    private func configureStructure() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: creatlayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .systemBackground
        view.addSubview(collectionView)
    }
    
    private func configureDataSource() {
        
        let cellRegistration = UICollectionView.CellRegistration<TextCell, Int> { (cell, indexPath, identifier) in
           // Конфигурируем и настраиваем ячеку
            cell.label.text = "\(identifier)"
            cell.contentView.backgroundColor = .systemBlue
            cell.layer.borderColor = UIColor.black.cgColor
            cell.contentView.layer.cornerRadius = 10
            cell.label.textAlignment = .center
            cell.label.font = UIFont.preferredFont(forTextStyle: .title1)
        }
        // Инициализация датасорс
        dataSourse = UICollectionViewDiffableDataSource<Section, Int>(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, identifier: Int) -> UICollectionViewCell? in
            let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: identifier)
            return cell
        }

        // инициализация DataSourse
        var snapshot = NSDiffableDataSourceSnapshot<Section, Int>()
        snapshot.appendSections([.main])
        snapshot.appendItems(Array(1...100))
        dataSourse?.apply(snapshot, animatingDifferences: false)
    }
}
