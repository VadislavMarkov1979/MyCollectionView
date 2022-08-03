//
//  NestedGroupsViewController.swift
//  MyCollectionView
//
//  Created by Владимир on 07.07.2022.
//

import UIKit

class NestedGroupsViewController: UIViewController, UICollectionViewDelegate {
    
    enum Section {
        case main
    }
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Int>?
    var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configureHierarchy()
        configureDataSource()
    }
    
    private func setupView() {
        navigationItem.title = "Nested"
        view.backgroundColor = .white
    }
    
    func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout {
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in

            let leadingItem = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.7),
                                                  heightDimension: .fractionalHeight(1.0)))
            leadingItem.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)

            let trailingItem = NSCollectionLayoutItem(
                layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                  heightDimension: .fractionalHeight(0.3)))
            trailingItem.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
            let trailingGroup = NSCollectionLayoutGroup.vertical(
                layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3),
                                                  heightDimension: .fractionalHeight(1.0)),
                subitem: trailingItem, count: 2)

            let nestedGroup = NSCollectionLayoutGroup.horizontal(
                layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                  heightDimension: .fractionalHeight(0.4)),
                subitems: [leadingItem, trailingGroup])
            let section = NSCollectionLayoutSection(group: nestedGroup)
            return section

        }
        return layout
    }
    
    func configureHierarchy() {
         collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
         collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
         collectionView.backgroundColor = .systemBackground
         view.addSubview(collectionView)
         collectionView.delegate = self
     }
     func configureDataSource() {
         
         let cellRegistration = UICollectionView.CellRegistration<TextCell, Int> { (cell, indexPath, identifier) in
             // Populate the cell with our item description.
             cell.label.text = "\(indexPath.section), \(indexPath.item)"
             cell.contentView.backgroundColor = .systemBlue
             cell.contentView.layer.borderColor = UIColor.black.cgColor
             cell.contentView.layer.borderWidth = 1
             cell.contentView.layer.cornerRadius = 8
             cell.label.textAlignment = .center
             cell.label.font = UIFont.preferredFont(forTextStyle: .title1)
         }
         
         dataSource = UICollectionViewDiffableDataSource<Section, Int>(collectionView: collectionView) {
             (collectionView: UICollectionView, indexPath: IndexPath, identifier: Int) -> UICollectionViewCell? in
             // Return the cell.
             return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: identifier)
         }

         // initial data
         var snapshot = NSDiffableDataSourceSnapshot<Section, Int>()
         snapshot.appendSections([Section.main])
         snapshot.appendItems(Array(0..<100))
         dataSource?.apply(snapshot, animatingDifferences: false)
     }

}
