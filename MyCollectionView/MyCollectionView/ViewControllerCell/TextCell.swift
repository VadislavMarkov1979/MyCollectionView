//
//  TextCell.swift
//  MyCollectionView
//
//  Created by Владимир on 04.07.2022.
//

import UIKit

// MARK: - Класс ячейки
class TextCell: UICollectionViewCell {
    
    // Инициализируем лайбл в ячеке
    let label = UILabel()
    // Индентификатор ячейки
    static let reuseIdentifier = "Сell"

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("not implemnted")
    }
}
// MARK: Конфигурируем ячейку
extension TextCell {
    func configure() {
        // Устанавливаем автоматическое изменение размеров ячейки в зависимости от размеров экрана
        label.translatesAutoresizingMaskIntoConstraints = false
        // Автоматическое изменение размера шрифта при изменении размеров экрана
        label.adjustsFontForContentSizeCategory = true
        // Добавляем лайбл в ячейку
        contentView.addSubview(label)
        // Утсанавливаем шрифт лайбла
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        let inset = CGFloat(10)
        // Устанавливаем констрейнты для лайблп
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: inset),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset)
            ])
    }
}
