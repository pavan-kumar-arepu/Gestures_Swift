//
//  ViewController.swift
//  Gestures
//
//  Created by Pavankumar Arepu on 30/08/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func scaleImage(_ sender: UIPinchGestureRecognizer) {
        monkeyImageView.transform = CGAffineTransform(scaleX: sender.scale, y: sender.scale)
    }
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    var tapGesture = UITapGestureRecognizer()
    var leftSwipeGesture = UISwipeGestureRecognizer()
    var rightSwipeGesture = UISwipeGestureRecognizer()
    var upSwipeGesture = UISwipeGestureRecognizer()
    var downSwipeGesture = UISwipeGestureRecognizer()
    
    var pinchGesture = UIPinchGestureRecognizer()
    
    var screenEdgeRecognizer: UIScreenEdgePanGestureRecognizer!
    var currentRadius:CGFloat = 0.0

    var panGesture = UIPanGestureRecognizer()
    var longTapGesture = UILongPressGestureRecognizer()
    var gestureView = UIView()

    @IBOutlet weak var monkeyImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureDetected))
        
        leftSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeGestureDetected(_:)))
        rightSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeGestureDetected(_:)))
        
        upSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeGestureDetected(_:)))
        downSwipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeGestureDetected(_:)))
        
        leftSwipeGesture.direction = .left
        rightSwipeGesture.direction = .right
        
        upSwipeGesture.direction = .up
        downSwipeGesture.direction = .down
        
        createCustomView()

        screenEdgeRecognizer.edges = .left
        
        view.addGestureRecognizer(screenEdgeRecognizer)
        
        
        screenEdgeRecognizer = UIScreenEdgePanGestureRecognizer(target: self,
                                                                action: #selector(rotateBall))
        
    }
}



extension ViewController {
    func createCustomView() {
        // Creating a view
        gestureView = UIView.init(frame: CGRect(x: 100.0, y: 700.0, width: 100.0, height: 100.0))
        gestureView.backgroundColor = .blue
        
        gestureView.layer.cornerRadius = 10.0
        
        // GestureView added to default View
        view.addSubview(gestureView)
        
        gestureView.addGestureRecognizer(tapGesture)
        gestureView.addGestureRecognizer(leftSwipeGesture)
        gestureView.addGestureRecognizer(rightSwipeGesture)
        gestureView.addGestureRecognizer(upSwipeGesture)
        gestureView.addGestureRecognizer(downSwipeGesture)
                
        monkeyImageView.addGestureRecognizer(pinchGesture)
    }
    
    @objc func tapGestureDetected() {
        print("Tap Gesture Detected!")
    }
    
    @objc func swipeGestureDetected(_ recognizer: UISwipeGestureRecognizer) {
        print("Swipe Gesture Detected!")
        
        let gestureX = gestureView.frame.origin.x
        let gestureY = gestureView.frame.origin.y
        
        if recognizer.direction == .left {
            gestureView.frame.origin.x = gestureX - 40.0
        } else if recognizer.direction == .right {
            gestureView.frame.origin.x = gestureX + 40.0
        } else if recognizer.direction == .up {
            gestureView.frame.origin.y = gestureY - 40.0
        } else if recognizer.direction == .down {
            gestureView.frame.origin.y = gestureY + 40.0
        }
    }
    
    @objc func rotateBall(sender: UIScreenEdgePanGestureRecognizer) {
        // 1
        if sender.state == .ended {
            // 2
            if currentRadius==360.0 {
                currentRadius=0.0
            }

            UIView.animate(withDuration: 1.0, animations: {
                self.currentRadius += 90.0
                self.imageView.transform = CGAffineTransform(rotationAngle: self.currentRadius * .pi / 180.0)
            })
        }
    }
        
}
