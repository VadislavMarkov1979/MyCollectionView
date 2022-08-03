//
//  ListViewController.swift
//  MyCollectionView
//
//  Created by Владимир on 01.07.2022.
//

import UIKit

class ListViewController: UIViewController {
    
    enum Section {
        case main
    }
    
    // Создаем объект, который используется для управления данными и предоставления ячеек для представления коллекции.
    var dataSourse: UICollectionViewDiffableDataSource<Section, Int>?
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Устанавливаем Вью
        setupView()
        // Конфигурируем структуру коллекшнвью
        configureStructure()
        // Конфигугрируем DataSource
        configureDataSource()
    }
    
    private func setupView() {
        // Устанвливаем заголовок навишейшн
        navigationItem.title = "List"
        // Устанавливаем фоновый цвет вью
        view.backgroundColor = .white
    }
    // Создаем и конфигугрируем лайоут
    private func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
//            heightDimension: .fractionalHeight(0.2))
            heightDimension: .absolute(44.0))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = .flexible(10)
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 10
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    private func configureStructure() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
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

