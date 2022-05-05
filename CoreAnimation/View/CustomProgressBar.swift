//
//  CustomProgressBar.swift
//  Animation
//
//  Created by Vladislav Miroshnichenko on 15.03.2022.
//

import UIKit

@IBDesignable
class CustomProgressBar: UIView, CAAnimationDelegate {

    private var backgroundLayer: CAShapeLayer! {
        didSet {
            backgroundLayer.lineWidth = self.frame.height //Толщина линии обводки
            backgroundLayer.lineCap = .round //Скругленые края
            backgroundLayer.fillColor = nil //Фгура не закрашивается
            backgroundLayer.strokeColor = self.backgroundColor?.cgColor //Цвет
            backgroundLayer.strokeEnd = 1.0 //Конечная точка отрисовки
        }
    }
    
    @IBInspectable var fillColor: UIColor = UIColor.blue
    
    private var strokeEnd: CGFloat = 0.0 {
        didSet {
            fillLayer.strokeEnd = strokeEnd
        }
    }
    
    public var completion: (() -> Void)?
    
    private var fillLayer: CAShapeLayer! {
        didSet {
            fillLayer.lineWidth = self.bounds.height //Ширина линии
            fillLayer.lineCap = .round //Скругленые края
            fillLayer.fillColor = nil
            fillLayer.strokeColor = fillColor.cgColor
            fillLayer.strokeEnd = strokeEnd
        }
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        backgroundLayer = CAShapeLayer()
        fillLayer = CAShapeLayer()
        
        configureLayer(shapeLayer: backgroundLayer)
        configureLayer(shapeLayer: fillLayer)
        
        self.layer.addSublayer(backgroundLayer)
        self.layer.addSublayer(fillLayer)
    }
    
    private func configureLayer(shapeLayer: CAShapeLayer) {
        shapeLayer.frame = self.bounds //Пределы в которых будет рисоваться ShapeLayer
        let path = UIBezierPath() //Траектория в которой будет рисоваться ShapeLayer
        path.move(to: CGPoint(x: self.bounds.minX, y: self.bounds.midY)) //Начальная точка с которой будет рисоваться линия
        path.addLine(to: CGPoint(x: self.bounds.maxX, y: self.bounds.midY)) //Конечная точка до кторой буде рисоваться линия
        shapeLayer.path = path.cgPath //Добавление траектории рисования
    }
    
    public func changeProgress(value: CGFloat) {
        if strokeEnd <= 1 {
            completion?()
        } else {
            strokeEnd += value
        }
    }

    
    public func fillAnimate() {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = 3
        animation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        animation.isRemovedOnCompletion = false
        animation.delegate = self
        animation.fillMode = .forwards
        fillLayer.add(animation, forKey: "fillView")
    }
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        if anim == fillLayer.animation(forKey: "fillView") {
            completion?()
        }
    }
    
    
    

}
