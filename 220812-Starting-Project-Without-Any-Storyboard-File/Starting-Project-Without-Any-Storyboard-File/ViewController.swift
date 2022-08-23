//
//  ViewController.swift
//  Starting-Project-Without-Any-Storyboard-File
//
//  Created by minsson on 2022/08/13.
//

import UIKit

class ViewController: UIViewController {

    let testLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(testLabel)
        
        testLabel.text = "짠! 스토리보드 없이도 되는군요!"
        
        testLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            testLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            testLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}


