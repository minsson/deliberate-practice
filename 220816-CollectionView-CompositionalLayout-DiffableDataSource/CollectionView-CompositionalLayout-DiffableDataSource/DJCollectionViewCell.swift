//
//  DJCollectionViewCell.swift
//  CollectionView-CompositionalLayout-DiffableDataSource
//
//  Created by minsson on 2022/08/16.
//

import UIKit

class DJCollectionViewCell: UICollectionViewCell {
    
    weak var label: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        self.contentView.backgroundColor = .lightGray
        self.contentView.layer.borderWidth = 0.5
        self.contentView.layer.borderColor = UIColor.black.cgColor
        
        let label = UILabel()
        label.textAlignment = .center
        label.frame = self.contentView.frame
        self.contentView.addSubview(label)
        self.label = label
    }
    
    func configure(text: String) {
        self.label?.text = text
    }
}
