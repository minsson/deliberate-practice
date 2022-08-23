//
//  ViewController.swift
//  CollectionView-CompositionalLayout-DiffableDataSource
//
//  Created by minsson on 2022/08/16.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - 컬렉션뷰 인스턴스 정의
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: createGridLayout() // 컴포지셔널 레이아웃 집어넣어줌
        )
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    // MARK: - 데이터 모델 (원래 네트워킹을 해오겠지만, 이 프로젝트의 초점은 컬렉션뷰이므로 생략)
    private let items: [String] = [
        "Alabama", "Alaska", "Arizona", "Arkansas", "California",
        "Colorado", "Connecticut", "Delaware", "Florida",
        "Georgia", "Hawaii", "Idaho", "Illinois", "Indiana", "Iowa",
        "Kansas", "Kentucky", "Louisiana", "Maine", "Maryland",
        "Massachusetts", "Michigan", "Minnesota", "Mississippi",
        "Missouri", "Montana", "Nebraska", "Nevada", "New Hampshire",
        "New Jersey", "New Mexico", "New York", "North Carolina",
        "North Dakota", "Ohio", "Oklahoma", "Oregon", "Pennsylvania",
        "Rhode Island", "South Carolina", "South Dakota", "Tennessee",
        "Texas", "Utah", "Vermont", "Virginia", "Washington",
        "West Virginia", "Wisconsin", "Wyoming"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        collectionView.setCollectionViewLayout(createGridLayout(), animated: false)
        
        
        view.backgroundColor = .white
        collectionView.dataSource = self
        
        collectionView.register(ItemCollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
    }

    // MARK: - Compositional Layout 정의: 이 레이아웃을 컬렉션 뷰에 대입하는 구조
    func createGridLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        item.contentInsets = .init(
            top: 4,
            leading: 4,
            bottom: 4,
            trailing: 4
        )
        
        let groupsize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalWidth(2/3)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupsize,
            subitem: item,
            count: 2
        )
        
        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! ItemCollectionViewCell
        
        let text = items[indexPath.item]
        cell.recieve(text: text)
        
        
        return cell
    }
    
    
}

extension ViewController: UICollectionViewDelegate {
    
}


class ItemCollectionViewCell: UICollectionViewCell {
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private lazy var itemLabel: UILabel = {
        let itemLabel = UILabel()
        itemLabel.translatesAutoresizingMaskIntoConstraints = false
        return itemLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(itemLabel)
        
        NSLayoutConstraint.activate([
            itemLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            itemLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
        contentView.backgroundColor = .cyan
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func recieve(text: String) {
//        imageView.image = image
        itemLabel.text = text
    }
//    override func prepareForReuse() {
//        super.prepareForReuse()
//
//        if let imageRequest = imageRequest {
//            imageRequest.cancel()
//        }
//
//        imageView.image = UIImage(systemName: "photo.on.rectangle.angled")
//        priceLabel.attributedText = nil
//    }
}


/*
 
 ## 1. Compositional Layout 정의하기 (Layout <- Section <- Group <- Item)
 - 작은 것부터 만들어서 점점 더 큰 개념에 담아가는 방식
 - 우선 가장 작은 단위인 아이템부터 구현
 
 ## 2. 셀 안에 넣을 데이터 가져오기 (Model Data)
 - 레이아웃을 지정했으니, 그 안에 채울 데이터를 가져와보자
 - 주로 네트워킹을 통해 데이터를 가져오겠지만, 이 프로젝트의 초점은 컬렉션뷰 기초이므로 어레이에 하드코딩한 데이터를 담아보자
    - 변수명: items
 
 ## 3. UICollectionViewDataSource 프로토콜 채택과 필수 메서드 (DiffableDataSource는 아직도 이해가 안되므로 패스)
 -
 
 
 */
