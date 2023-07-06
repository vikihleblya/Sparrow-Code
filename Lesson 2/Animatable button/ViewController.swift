//
//  ViewController.swift
//  Animatable button
//
//  Created by viktor.grigoryev on 04.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var topButton: UIButton = {
        AnimatableButton(title: "Top button", image: .init(systemName: "heart") ?? UIImage(), background: .blue, cornerRadius: 10)
    }()
    
    lazy var middleButton: UIButton = {
        AnimatableButton(title: "Middle-middle button", image: .init(systemName: "heart") ?? UIImage(), background: .blue, cornerRadius: 10)
    }()
    
    lazy var bottomButton: UIButton = {
        AnimatableButton(title: "Bottom-bottom-bottom button", image: .init(systemName: "heart") ?? UIImage(), background: .blue, cornerRadius: 10)
    }()
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addToView(button: topButton, topAnchorConstant: 100)
        addToView(button: middleButton, topAnchorConstant: 200)
        addToView(button: bottomButton, topAnchorConstant: 300)
        bottomButton.addTarget(self, action: #selector(onBottomButtonPressed), for: .touchUpInside)
    }
    
    @objc private func onBottomButtonPressed() {
        let vc = UIViewController()
        vc.view.backgroundColor = .cyan
        present(vc, animated: true)
    }
    
    private func addToView(button: UIButton, topAnchorConstant: CGFloat) {
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: view.topAnchor, constant: topAnchorConstant),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
}

