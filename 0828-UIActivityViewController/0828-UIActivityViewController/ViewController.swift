//
//  ViewController.swift
//  0828-UIActivityViewController
//
//  Created by minsson on 2022/08/28.
//

import UIKit

final class ViewController: UIViewController {
    
    private let shareButton: UIButton = {
        let shareButton = UIButton()
        shareButton.setTitle("Share Button", for: .normal)
        shareButton.setTitleColor(UIColor.systemBlue, for: .normal)
        
        return shareButton
    }()
    
    private let textToShare = "Test"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupShareButton()
    }
    
    private func setupShareButton() {
        view.addSubview(shareButton)
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            shareButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            shareButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        shareButton.addTarget(self, action: #selector(presentActivityView), for: .touchUpInside)
    }
    
    @objc private func presentActivityView() {
        var shareObject: [Any] = []
        shareObject.append(textToShare)
        
        let activityViewController = UIActivityViewController(
            activityItems: shareObject,
            applicationActivities: nil
        )
        
        self.present(activityViewController, animated: true)
    }
}
