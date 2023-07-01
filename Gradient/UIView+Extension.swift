//
//  UIView+Extension.swift
//  Gradient
//
//  Created by viktor.grigoryev on 01.07.2023.
//

import UIKit

extension UIView {
    func addShadow(shadowColor: UIColor = UIColor.black,
                   shadowOpacity: Float = 1,
                   shadowOffset: CGSize = .zero,
                   shadowRadius: CGFloat = 10) {
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOpacity = shadowOpacity
        layer.shadowOffset = shadowOffset
        layer.shadowRadius = shadowRadius
    }
    
    func makeCornerRadius(to value: CGFloat) {
        layer.cornerRadius = value
    }
    
    func addGradient() {
        let gradient: CAGradientLayer = CAGradientLayer()

        gradient.colors = [UIColor.blue.cgColor, UIColor.red.cgColor]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: frame.size.width, height: frame.size.height)
        gradient.cornerRadius = layer.cornerRadius
        
        layer.addSublayer(gradient)
    }
}
