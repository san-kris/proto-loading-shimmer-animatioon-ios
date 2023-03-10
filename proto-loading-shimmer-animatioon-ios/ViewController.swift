//
//  ViewController.swift
//  proto-loading-shimmer-animatioon-ios
//
//  Created by Santosh Krishnamurthy on 3/9/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // change bg color of view to black
        view.backgroundColor = UIColor(white: 1, alpha: 0.1)
        
        // create a label with text and font
        let darkTextLabel = UILabel()
        darkTextLabel.text = "Shimmer"
        darkTextLabel.textColor = UIColor(white: 1, alpha: 0.2)
        darkTextLabel.font = UIFont.systemFont(ofSize: 80)
        // lavel will not be displayed until frame is set. Default frame is X=0,Y=0,Width=0 and Height=0
        darkTextLabel.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 400)
        // set text alignemnt
        darkTextLabel.textAlignment = NSTextAlignment.center
        
        view.addSubview(darkTextLabel)
        
        // create a second label with white text and font
        let shinyTextLabel = UILabel()
        shinyTextLabel.text = "Shimmer"
        shinyTextLabel.textColor = .white
        shinyTextLabel.font = UIFont.systemFont(ofSize: 80)
        // lavel will not be displayed until frame is set. Default frame is X=0,Y=0,Width=0 and Height=0
        shinyTextLabel.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 400)
        // set text alignemnt
        shinyTextLabel.textAlignment = NSTextAlignment.center
        
        view.addSubview(shinyTextLabel)
        
        // Dray a diagonal gradiant in code
        let gradiantLayer = CAGradientLayer()
        // specify the order in which colors need to apper in gradiant
        gradiantLayer.colors = [UIColor.clear.cgColor, UIColor.white.cgColor, UIColor.clear.cgColor]
        // lcatioon specifies the points on screen where the colors change
        gradiantLayer.locations = [0.3, 0.5,0.8]
        // need to set the frame to display on screen
        gradiantLayer.frame = shinyTextLabel.frame
    
        // Add rotation to the gradiant
        gradiantLayer.transform = CATransform3DMakeRotation(-60 * .pi/180, 0, 0, 1)
        
        view.layer.addSublayer(gradiantLayer)

        
        // cannot animate CALayer using uiview.animate. we should use CABasicAnimation
        /*
        gradiantLayer.frame.origin = CGPoint(x: -view.frame.width, y: gradiantLayer.frame.origin.y)
        
        UIView.animate(withDuration: 2, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5) {
            print("animating")
            gradiantLayer.frame.origin = CGPoint(x: self.view.frame.width, y: gradiantLayer.frame.origin.y)
        }
         */
        
        // Add gradiant as a layer mask on the shiny text
        shinyTextLabel.layer.mask = gradiantLayer

        // animating the movement of gradiant layer
        let animation = CABasicAnimation(keyPath: "transform.translation.x")
        animation.fromValue = -view.frame.width
        animation.toValue = view.frame.width
        animation.repeatCount = Float.infinity
//        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animation.duration = 2

        gradiantLayer.add(animation, forKey: "not-important-key")
    }


}

