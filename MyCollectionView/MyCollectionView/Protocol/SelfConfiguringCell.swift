//
//  SelfConfiguringCell.swift
//  MyCollectionView
//
//  Created by Владимир on 08.07.2022.
//

import Foundation

protocol SelfConfiguringCell {
    static var reuseId: String { get }
    func configure(with intValue: Int)
}
