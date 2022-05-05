//
//  CustomButtonView.swift
//  Animation
//
//  Created by Vladislav Miroshnichenko on 15.03.2022.
//

import UIKit

@IBDesignable
class CustomButtonView: UIButton {
    
    @IBInspectable var borderWidth: CGFloat = 0.00
    @IBInspectable var borderColor: UIColor = .white
    @IBInspectable var shadowOpacity: Float = 0.00
    @IBInspectable var shadowRadius: CGFloat = 0.00
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0, height: 0)
    @IBInspectable var shadowColor: UIColor = .black
    @IBInspectable var cornerRadiusSize: CGFloat = 0.0
    

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code

        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
        self.layer.masksToBounds = true
        self.layer.masksToBounds = false
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowColor = shadowColor.cgColor
        
        let backgroundGradientColor = CAGradientLayer()
        backgroundGradientColor.startPoint = CGPoint(x: 0, y: 0)
        backgroundGradientColor.endPoint = CGPoint(x: 1, y: 1)
        let endColor = #colorLiteral(red: 0, green: 0, blue: 0.4754529595, alpha: 1)
        let startColor = #colorLiteral(red: 0, green: 0.004940802937, blue: 1, alpha: 1)
        backgroundGradientColor.colors = [
            startColor.cgColor, endColor.cgColor
        ]
        backgroundGradientColor.cornerRadius = cornerRadiusSize
        backgroundGradientColor.frame = CGRect(x: 0, y: 0,
                                               width: self.bounds.size.width, height: self.bounds.size.height)
        self.layer.insertSublayer(backgroundGradientColor, at: 0)
    }
    

}
