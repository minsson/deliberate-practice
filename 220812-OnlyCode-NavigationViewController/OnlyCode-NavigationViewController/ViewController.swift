//
//  ViewController.swift
//  OnlyCode-NavigationViewController
//
//  Created by minsson on 2022/08/12.
//

import UIKit

final class ViewController: UIViewController {
    
    private let button = UIButton() // 버튼 생성
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // MARK: - 네비게이션 뷰로 이동할 버튼 구현
        
        // MARK: 1) UI 관련
        
        view.addSubview(button)
        
        button.setTitle("네비게이션 생성 버튼", for: .normal)
        button.backgroundColor = .darkGray
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 300),
            button.heightAnchor.constraint(equalToConstant: 50),
            
            button.centerXAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.centerXAnchor
            ),
            button.centerYAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.centerYAnchor
            )
        ])
        
        // MARK: 2) 버튼과 실행할 메서드 연결
        
        button.addTarget(
            self,
            action: #selector(buttonDidTap),
            for: .touchUpInside
        )
    }
    
    // MARK: - 네비게이션 컨트롤러 뷰를 띄우는 메서드
    @objc private func buttonDidTap() {
        
        // 네비게이션 뷰 컨트롤러의 루트 뷰 컨트롤러 역할을 할 인스턴스 생성
        let rootVC = MySecondVC()
        rootVC.title = "타이틀"
        
        // 네비게이션 뷰 컨트롤러 생성
        let navigationVC = UINavigationController(rootViewController: rootVC)
        navigationVC.modalPresentationStyle = .fullScreen
        
        // 이 메서드의 최종 목적은 네비게이션 컨트롤러 뷰를 띄우는 것
        present(navigationVC, animated: true)
    }
}

// MARK: - 네비게이션 뷰로 이동할 버튼 구현

final class MySecondVC: UIViewController {
    
    private let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        
        // MARK: - 다음 뷰로 이동하기 위한 버튼 구현 (위와 동일)
        
        // MARK: 1) UI 관련
        
        view.addSubview(button)
        
        button.setTitle("push 방식으로 다음 뷰를 띄웁니다", for: .normal)
        button.backgroundColor = .darkGray
        
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalToConstant: 300),
            button.heightAnchor.constraint(equalToConstant: 50),
            
            button.centerXAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.centerXAnchor
            ),
            button.centerYAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.centerYAnchor
            )
        ])
        
        // MARK: 2) 버튼과 실행할 메서드 연결
        
        button.addTarget(
            self,
            action: #selector(buttonDidTap),
            for: .touchUpInside
        )
    }
    
    // MARK: - 버튼이 탭 되면 다음 뷰로 이동
    
    @objc private func buttonDidTap() {
        let nextVC = UIViewController()
        
        nextVC.view.backgroundColor = .white
        navigationController?.pushViewController(nextVC, animated: true)
    }
}

