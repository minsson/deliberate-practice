//
//  ViewController.swift
//  UIImagePickerController
//
//  Created by minsson on 2022/08/14.
//

// MARK: 할 일
/*
 1) 빈 회색 이미지 뷰를 만들고 화면 중앙에 배치한다 (containerImageView)
 2) 이미지 고르기 버튼을 빈 회색 이미지 뷰 아래에 배치한다 (openPhotoButton)
 3) 이미지 고르기 버튼을 누르면 Image Picker가 열리고, 이미지를 선택하면 빈 회색 이미지 뷰에 이미지를 넣어주도록 구현한다
 */

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - Properties
    
    // 이미지를 담을 컨테이너 이미지 뷰
    private let containerImageView: UIImageView = {
        let grayImageView = UIImageView()
        grayImageView.backgroundColor = .gray
        grayImageView.layer.cornerRadius = 10
        grayImageView.clipsToBounds = true
        return grayImageView
    }()
    
    // 이미지 고르기 버튼
    private let ImagePickerPresentingButton: UIButton = {
       let openPhotoButton = UIButton()
        openPhotoButton.backgroundColor = .gray
        openPhotoButton.layer.cornerRadius = 10
        openPhotoButton.setTitle("이미지 고르기", for: .normal)
        return openPhotoButton
    }()
    
    // 사진첩을 열어 이미지를 선택할 수 있게 해주는 객체
    private let imagePicker: UIImagePickerController = {
        let imagePicker = UIImagePickerController()
        return imagePicker
    }()
    
    // 컨테이너 이미지뷰에 추가할 UITapGestureRecognizer 객체로, UIGestureRecognizer를 상속한다
    private lazy var tapGesture: UITapGestureRecognizer = {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(openImagePicker))
        
        return tapGesture
    }()
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupContainerImageView()
        setupOpenPhotoButton()
        setupImagePicker()
    }
}

private extension ViewController {
    
    // MARK: - Private Actions
    
    @objc func openImagePicker() {
        present(imagePicker, animated: true)
    }
    
    func setupImagePicker() {
        // 델리게이트 채택
        imagePicker.delegate = self
        // 어디서 이미지를 가져올지 선택. 이 경우 사진첩에서 가지고 오는 것으로 설정함
        imagePicker.sourceType = .photoLibrary
    }
    
    func setupContainerImageView() {
        view.addSubview(containerImageView)

        containerImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerImageView.widthAnchor.constraint(equalToConstant: 300),
            containerImageView.heightAnchor.constraint(equalToConstant: 300),
            
            containerImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        // 속성 정의에서 구현해놓은 tapGesture라는 UITapGestureRecognizer 타입 객체를 이 이미지뷰의 gesture recognizer로 추가한다
        containerImageView.addGestureRecognizer(tapGesture)
        // 인터렉션이 되도록 허용해준다 (이걸 설정하지 않으면 탭 해도 반응이 없다)
        containerImageView.isUserInteractionEnabled = true
    }
    
    func setupOpenPhotoButton() {
        view.addSubview(ImagePickerPresentingButton)
        ImagePickerPresentingButton.addTarget(self, action: #selector(openImagePicker), for: .touchUpInside)
        
        ImagePickerPresentingButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ImagePickerPresentingButton.widthAnchor.constraint(equalToConstant: 120),
            ImagePickerPresentingButton.heightAnchor.constraint(equalToConstant: 40),
            
            ImagePickerPresentingButton.topAnchor.constraint(equalTo: containerImageView.bottomAnchor, constant: 16),
            ImagePickerPresentingButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // MARK: - Delegate Actions
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            self.containerImageView.image = image
        }
        
        dismiss(animated: true)
    }
}
