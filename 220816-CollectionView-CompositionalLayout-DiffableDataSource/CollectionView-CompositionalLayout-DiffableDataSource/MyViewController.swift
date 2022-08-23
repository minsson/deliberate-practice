////
////  MyViewController.swift
////  CollectionView-CompositionalLayout-DiffableDataSource
////
////  Created by minsson on 2022/08/16.
////
//
//import Foundation
//import UIKit
//
//class MyViewController: UIViewController {
//    
//    
//    // MARK: - 1. Connect a diffable data source to your collection view.
//    
//    // MARK: 1.1 컬렉션 뷰 인스턴스 생성
//    var collectionView = UICollectionView()
//    
//    // MARK: 1.2 SectionIdentifierType 만들기
//    enum Section: CaseIterable {
//        case main
//    }
//    
//    // MARK: 1.3 ItemIdentifierType 만들기
//    // 예시를 위해 String 타입을 사용하므로 생략
//    // 참고: String의 경우 같은 Value가 발생하면 Crash가 발생하므로 별도 처리 필요 (여기서는 생략)
//    
//    
//    // MARK: 1.4 diffable data source 객체 생성
//    var dataSource: UICollectionViewDiffableDataSource<Section, String>!
//    // 전역변수로 만들어서 관리하는 이유: 다른 곳에서도 사용해야 하기 때문
//    
//    
//    
//    
//    // MARK: - 2. Implement a cell provider to configure your collection view's cells.
//    
//    func connectCellProviderToVC() {
//        // MARK: Way 1
//        // 컬렉션뷰에 cell을 등록하는 과정
//        self.collectionView.register(DJCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
//        
//
//        // 셀에 데이터를 넣어주는 작업 UICollectionViewDataSource와 유사하다
//        self.dataSource =
//        UICollectionViewDiffableDataSource<Section, String>(
//            collectionView: self.collectionView
//        ) { collectionView, indexPath, dj -> UICollectionViewCell? in // 이 클로저가 cellProvider
//            // escaping closure가 있어서 여기서 정해진 값들이 다른 곳에서도 쓰일 수 있는 건가???
//            // dj는 identifier임
//    
//            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? DJCollectionViewCell else { preconditionFailure() } // cell을 configure하기 위해 가져옴
//            cell.configure(text: dj)
//            
//            return cell
//        }
//        //
//        // MARK: Way 2
//        // register를 따로 안 하고, diffable datasource 만들 때 register와 configure 작업을 동시 진행
//        //
//        //        let cellRegistration = UICollectionView.CellRegistration
//        //        <DJCollectionViewCell, String> { (cell, indexPath, dj) in
//        //            cell.configure(text: dj)
//        //        }
//        //
//        //        self.dataSource = UICollectionViewDiffableDataSource<Section, String>(collectionView: self.collectionView) {
//        //            (collectionView, indexPath, dj) -> UICollectionViewCell? in
//        //            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: dj)
//        //        }
//        //
//    }
//    
//    // MARK: - 3. Generate the current state of the data
//    func generateSnapShot() {
//        var snapshot = NSDiffableDataSourceSnapshot<Section, String>()
//        snapshot.appendSections([.main]) // 섹션의 identifier가 .main인 섹션들을 업데이트 할 거야
//        snapshot.appendItems(<#T##identifiers: [String]##[String]#>) // item들을 판별하기 위한 identifier들이 들어있는 어레이.. 이 identifier들과 연결된 아이템들을 집어넣어줘
//        
//    }
//    
//    
//    
//    
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        collectionView.register(DJCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
//    }
//}
