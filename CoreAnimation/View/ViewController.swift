//
//  ViewController.swift
//  Animation
//
//  Created by Vladislav Miroshnichenko on 14.03.2022.
//

import UIKit

class ViewController: UIViewController  {

    
    @IBOutlet weak var progressBar: CustomProgressBar!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: CustomImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        progressBar.fillAnimate()
        imageView.rotateAnimation()
        progressBar.completion = { [unowned self] in
            self.label.text = "Progress bar has been completed"
            self.shakeAnimation(view: self.label)
        }
    }
    
    private func shakeAnimation(view: UIView) {
        let animation = CASpringAnimation(keyPath: "position.x")
        animation.fromValue = view.layer.position.x + 1
        animation.toValue = view.layer.position.x
        animation.duration = 1
        animation.damping = 50.0
        animation.mass = 10.0
        animation.initialVelocity = 100.0
        animation.stiffness = 1500.0
        animation.timingFunction = CAMediaTimingFunction(name: .linear)
        view.layer.add(animation, forKey: nil)
    }

}

