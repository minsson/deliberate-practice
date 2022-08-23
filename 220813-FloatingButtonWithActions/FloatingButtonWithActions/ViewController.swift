//
//  ViewController.swift
//  FloatingButtonWithActions
//
//  Created by minsson on 2022/08/13.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - alert를 띄우기 위한 floating Button 정의
    
    private let floatingButtonForAlert: UIButton = {
        let floatingButtonForAlert = UIButton()
        
        floatingButtonForAlert.layer.cornerRadius = 30
        floatingButtonForAlert.layer.shadowOpacity = 0.1
        
        floatingButtonForAlert.backgroundColor = .systemPurple
        floatingButtonForAlert.tintColor = .white
        
        floatingButtonForAlert.setImage(UIImage(systemName: "plus"), for: .normal)

        return floatingButtonForAlert
    }()
    
    // MARK: - action sheet를 띄우기 위한 floating Button 정의 (위와 색만 달라요)
    
    private let floatingButtonForActionSheet: UIButton = {
        let floatingButtonForActionSheet = UIButton()
        
        floatingButtonForActionSheet.layer.cornerRadius = 30
        floatingButtonForActionSheet.layer.shadowOpacity = 0.1
        
        floatingButtonForActionSheet.backgroundColor = .systemPurple
        floatingButtonForActionSheet.tintColor = .white
        
        floatingButtonForActionSheet.setImage(UIImage(systemName: "plus"), for: .normal)
        
        return floatingButtonForActionSheet
    }()
    
    // MARK: - alert 정의 (actionSheet와의 차이는 preferredStyle가 .alert라는 거 하나뿐이에요)
    
    private let alert: UIAlertController = {
        let alert = UIAlertController(
            title: "액션시트의 제목 - 없어도 돼요",
            message: "액션시트의 내용 - 이것도 없어도 돼요",
            preferredStyle: .alert
        )
        
        let firstAction = UIAlertAction(
            title: "default style - (첫번째 선택지 제공)",
            style: .default,
            handler: { action in
                print("유저가 이 액션을 선택했을 때 실행할 코드는 여기에 작성해주세요")
            }
        )
        
        let secondAction = UIAlertAction(
            title: "default style - (두번째 선택지 제공)",
            style: .default,
            handler: { action in
                print("유저가 이 액션을 선택했을 때 실행할 코드는 여기에 작성해주세요")
            }
        )
        
        let cancelAciton = UIAlertAction(
            title: "cancel - 작업취소",
            style: .cancel,
            handler: { action in
                print("유저가 이 액션을 선택했을 때 실행할 코드는 여기에 작성해주세요")
            }
        )
        
        let destructiveAction = UIAlertAction(
            title: "destructive - 데이터 수정 혹은 삭제",
            style: .destructive,
            handler: { action in
                print("유저가 이 액션을 선택했을 때 실행할 코드는 여기에 작성해주세요")
            }
        )
        
        [firstAction, secondAction, cancelAciton, destructiveAction].forEach {
            alert.addAction($0)
        }

        return alert
    }()
    
    // MARK: - actionSheet 정의 (alert와의 차이는 preferredStyle가 .actionSheet라는 거 하나뿐이에요)
    
    private let actionSheet: UIAlertController = {
        let actionSheet = UIAlertController(
            title: "액션시트의 제목 - 없어도 돼요",
            message: "액션시트의 내용 - 이것도 없어도 돼요",
            preferredStyle: .actionSheet
        )
        
        let firstAction = UIAlertAction(
            title: "default style - (첫번째 선택지 제공)",
            style: .default,
            handler: { action in
                print("유저가 이 액션을 선택했을 때 실행할 코드는 여기에 작성해주세요")
            }
        )
        
        let secondAction = UIAlertAction(
            title: "default style - (두번째 선택지 제공)",
            style: .default,
            handler: { action in
                print("유저가 이 액션을 선택했을 때 실행할 코드는 여기에 작성해주세요")
            }
        )
        
        let cancelAciton = UIAlertAction(
            title: "cancel - 작업취소",
            style: .cancel,
            handler: { action in
                print("유저가 이 액션을 선택했을 때 실행할 코드는 여기에 작성해주세요")
            }
        )
        
        let destructiveAction = UIAlertAction(
            title: "destructive - 데이터 수정 혹은 삭제",
            style: .destructive,
            handler: { action in
                print("유저가 이 액션을 선택했을 때 실행할 코드는 여기에 작성해주세요")
            }
        )
        
        [firstAction, secondAction, cancelAciton, destructiveAction].forEach {
            actionSheet.addAction($0)
        }

        return actionSheet
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupFloatingButtonForAlert()
        setupFloatingButtonForActionSheet()
        
        let thirdAction = UIAlertAction(title: "default style - 다른 뷰로 이동", style: .default) { action in
            self.changeView()
        }
        
        actionSheet.addAction(thirdAction)
    }
    
    // MARK: - alert를 띄우기 위한 float button의 세팅
    
    private func setupFloatingButtonForAlert() {
        view.addSubview(floatingButtonForAlert)
        
        floatingButtonForAlert.addTarget(
            self,
            action: #selector(showAlert), // 버튼이 눌렸을 때 어떤 메서드가 실행될 것인지 설정
            for: .touchUpInside
        )
        
        floatingButtonForAlert.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            floatingButtonForAlert.widthAnchor.constraint(equalToConstant: 60),
            floatingButtonForAlert.heightAnchor.constraint(equalToConstant: 60),
            
            floatingButtonForAlert.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24), // 단순히 버튼 위치만 달라요
            
            floatingButtonForAlert.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24)
        ])
    }
    
    // MARK: - action sheet를 띄우기 위한 float button의 세팅
    
    private func setupFloatingButtonForActionSheet() {
        view.addSubview(floatingButtonForActionSheet)
        
        floatingButtonForActionSheet.addTarget(
            self,
            action: #selector(showActionSheet), // 버튼이 눌렸을 때 실행될 메서드가 달라요
            for: .touchUpInside
        )
        
        floatingButtonForActionSheet.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            floatingButtonForActionSheet.widthAnchor.constraint(equalToConstant: 60),
            floatingButtonForActionSheet.heightAnchor.constraint(equalToConstant: 60),
            
            floatingButtonForActionSheet.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24), // 단순히 버튼 위치만 달라요
            
            floatingButtonForActionSheet.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24)
        ])
    }
    
    // MARK: - alert를 띄우기 위한 floating button이 눌렸을 때 실행될 메서드예요
    
    @objc private func showAlert() {
        present(alert, animated: true) // alert를 띄우고 있어요
    }

    // MARK: - action sheet를 띄우기 위한 floating button이 눌렸을 때 실행될 메서드예요
    
    @objc private func showActionSheet() {
        present(actionSheet, animated: true) // action sheet를 띄우고 있어요
    }
    
    // MARK: - 이동할 화면을 만들고, 화면을 설정하고, 그 화면을 보여주는 메서드예요
    private func changeView() {
        let nextVC = UIViewController()
        nextVC.view.backgroundColor = .cyan
        //        nextVC.modalPresentationStyle = .fullScreen // 필요하면 풀스크린으로 표시할 수 있어요
        present(nextVC, animated: true)
    }
}
