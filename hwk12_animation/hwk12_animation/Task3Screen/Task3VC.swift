//
//  Task3VC.swift
//  hwk12_animation
//
//  Created by Kyzu on 16.02.22.
//

import UIKit

class Task3VC: UIViewController {
    
    private var imageView = UIImageView()
    
    let images = ["pict1", "pict2", "pict3", "pict4", "pict5", "pict6"]

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "LIFECYCLE"
        
        workWithImage(imageName: images[0])
        

    }
    
    private func workWithImage(imageName: String) {
        let image = UIImage(named: imageName)
        imageView.frame.size = (image?.size) ?? CGSize(width: 200, height: 400)
        print(imageView.frame.size)
        imageView.image = image
        imageView.center = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
        
        imageView.isUserInteractionEnabled = true
        let toLeftGest = UISwipeGestureRecognizer(target: self, action: #selector(swipeToLeft))
        toLeftGest.direction = .left
        let toRightGest = UISwipeGestureRecognizer(target: self, action: #selector(swipeToRight))
        toRightGest.direction = .right
        imageView.addGestureRecognizer(toLeftGest)
        imageView.addGestureRecognizer(toRightGest)
        
     
        view.addSubview(imageView)
    }
    
    @objc private func swipeToLeft() {
        print("goToLeft")
        UIView.animate(withDuration: 1, animations: {
            imageView.center = CGPoint(x: <#T##CGFloat#>, y: <#T##CGFloat#>)
        })
    }
    
    @objc private func swipeToRight() {
        print("goToRight")
    }
    
    
        

    }
    

