//
//  ViewController.swift
//  Gradient
//
//  Created by viktor.grigoryev on 01.07.2023.
//

import UIKit

class ViewController: UIViewController {

    lazy var gradientView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.makeCornerRadius(to: 10)
        view.addShadow()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradientView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientView.addGradient()
    }
    
    private func setupGradientView() {
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(gradientView)
        NSLayoutConstraint.activate([
            gradientView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 100),
            gradientView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            gradientView.heightAnchor.constraint(equalToConstant: 100),
            gradientView.widthAnchor.constraint(equalToConstant: 100),
        ])
    }
}
