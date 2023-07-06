//
//  AnimatableButton.swift
//  Animatable button
//
//  Created by viktor.grigoryev on 04.07.2023.
//

import UIKit

final class AnimatableButton: UIButton {
    required init(title: String, image: UIImage, background: UIColor, cornerRadius: CGFloat) {
        super.init(frame: .zero)
        backgroundColor = background
        var customConfiguration = UIButton.Configuration.filled()
        customConfiguration.title = title
        customConfiguration.image = image
        customConfiguration.imagePadding = 8
        customConfiguration.imagePlacement = .trailing
        customConfiguration.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 14, bottom: 10, trailing: 14)
        configuration = customConfiguration
        layer.cornerRadius = cornerRadius
        startAnimatingPressActions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func tintColorDidChange() {
        super.tintColorDidChange()
        switch tintAdjustmentMode {
        case .automatic, .normal:
            backgroundColor = .blue
        case .dimmed:
            backgroundColor = .gray
        @unknown default:
            backgroundColor = .blue
        }
    }
}

extension UIButton {
    
    func startAnimatingPressActions() {
        addTarget(self, action: #selector(animateDown), for: [.touchDown, .touchDragEnter])
        addTarget(self, action: #selector(animateUp), for: [.touchDragExit, .touchCancel, .touchUpInside, .touchUpOutside])
    }
    
    @objc private func animateDown(sender: UIButton) {
        animate(sender, transform: CGAffineTransform.identity.scaledBy(x: 0.95, y: 0.95))
    }
    
    @objc private func animateUp(sender: UIButton) {
        animate(sender, transform: .identity)
    }
    
    private func animate(_ button: UIButton, transform: CGAffineTransform) {
        UIView.animate(withDuration: 0.4,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 3,
                       options: [.curveEaseInOut, .allowUserInteraction],
                       animations: {
                        button.transform = transform
            }, completion: nil)
    }
    
}
