//
//  Nested.swift
//  MyCollectionView
//
//  Created by Владимир on 08.07.2022.
//

import Foundation
import UIKit

class Nested: UICollectionViewCell, SelfConfiguringCell {
    
    static var reuseId: String = "Nested"
    
    let friendImageView = UIImageView()
    let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.systemCyan
        
        self.layer.cornerRadius = 8
        self.clipsToBounds = true
    }
    
    func configure(with intValue: Int) {
        label.text = String(intValue)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
