//
//  MyRealViewController.swift
//  CollectionView-CompositionalLayout-DiffableDataSource
//
//  Created by minsson on 2022/08/16.
//

import Foundation
import UIKit

final class MyRealViewController: UIViewController {
    
    private enum Section: CaseIterable {
        case main
    }
    
    lazy var collectionView: UICollectionView = {
        var collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: generateLayout()
        )
        return collectionView
    }()
    
    private var stringData = ["1", "2", "3", "4", "5"]
    private var dataSource: UICollectionViewDiffableDataSource<Section, String>!
    
    func implementCellProviderToConfigureCells() { // setupDataSource
        self.collectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "myCell")
        
        self.dataSource = UICollectionViewDiffableDataSource<Section, String>(collectionView: self.collectionView)
        { collectionView, indexPath, itemIdentifier in

                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as? MyCollectionViewCell else {
                    return MyCollectionViewCell()
                }
                
                cell.configure(text: itemIdentifier)
                return cell
        }
    }
    
    func generateTheCurrentStateOfTheData() { // snapshot 만들기 (실질적으로 데이터 자체를 넘겨주는 작업)
        var snapshot = NSDiffableDataSourceSnapshot<Section, String>()
        snapshot.appendSections([.main])
        snapshot.appendItems(stringData)
        self.dataSource.apply(snapshot, animatingDifferences: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        implementCellProviderToConfigureCells()
        generateTheCurrentStateOfTheData()
        
        setupUILayouts()
    }
    
    func setupUILayouts() {
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
    
    private func generateLayout() -> UICollectionViewLayout {
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .fractionalHeight(1.0)
            )
            
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1.0),
                heightDimension: .absolute(70.0)
            )
            
            let group = NSCollectionLayoutGroup.horizontal(
                layoutSize: groupSize,
                subitem: item,
                count: 1
            )
            
            let section = NSCollectionLayoutSection(group: group)
            let layout = UICollectionViewCompositionalLayout(section: section)
            
            return layout
        }
}

class MyCollectionViewCell: UICollectionViewCell {
    
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
        label.frame = self.contentView.frame // 일종의 레이아웃 잡는 거나 마찬가지
        self.contentView.addSubview(label)
        self.label = label
    }
    
    func configure(text: String) {
        self.label?.text = text
    }
}

