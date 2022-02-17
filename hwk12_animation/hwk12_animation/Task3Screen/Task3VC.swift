//
//  Task3VC.swift
//  hwk12_animation
//
//  Created by Kyzu on 16.02.22.
//

import UIKit

class Task3VC: UIViewController {
    
    private let images = ["pict1", "pict2", "pict3", "pict4", "pict5", "pict6"]
    private var i = 0
    private var arrayOfImageViews: [UIImageView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "LIFECYCLE"
        workWithImage(imageName: images[i])
        view.subviews.first!.center = CGPoint(x: self.view.bounds.midX, y: self.view.bounds.midY)
        arrayOfImageViews = view.subviews.map{ $0 as! UIImageView}
    }
    
    private func workWithImage(imageName: String) {
        let image = UIImage(named: imageName)
        let imageView = UIImageView()
        let toLeftGest = UISwipeGestureRecognizer(target: self, action: #selector(swipeToLeft))
        let toRightGest = UISwipeGestureRecognizer(target: self, action: #selector(swipeToRight))
        imageView.frame.size = (image?.size) ?? CGSize(width: 200, height: 400)
        imageView.image = image
        imageView.isUserInteractionEnabled = true
        toLeftGest.direction = .left
        toRightGest.direction = .right
        imageView.addGestureRecognizer(toLeftGest)
        imageView.addGestureRecognizer(toRightGest)
        self.view.addSubview(imageView)
        arrayOfImageViews.append(imageView)
    }
    
    @objc private func swipeToLeft() {
        if i < images.count - 1 {
            i += 1
            workWithImage(imageName: images[i])
            arrayOfImageViews.last!.center = CGPoint(x: self.view.frame.maxX + self.arrayOfImageViews.last!.frame.width / 2, y: self.view.bounds.midY)
            animation(picCurrent:arrayOfImageViews.first!, picNew:  arrayOfImageViews.last! )
            arrayOfImageViews.removeFirst()
        }
    }
    
    @objc private func swipeToRight() {
        if i > 0 {
            i -= 1
            workWithImage(imageName: images[i])
            arrayOfImageViews.last!.center = CGPoint(x: self.view.frame.minX - self.arrayOfImageViews.last!.frame.width / 2, y: self.view.bounds.midY)
            animation(picCurrent:arrayOfImageViews.first!, picNew:  arrayOfImageViews.last! )
            arrayOfImageViews.removeFirst()
        }
    }
    
    private func animation(picCurrent: UIImageView, picNew: UIImageView) {
        UIView.animate(withDuration: 0.5, animations: {
            if (picNew.center.x > picCurrent.center.x) {
                picCurrent.center = CGPoint(x: self.view.frame.minX - self.arrayOfImageViews.first!.frame.width / 2, y: self.view.bounds.midY)
            } else {
                picCurrent.center = CGPoint(x: self.view.frame.maxX + self.arrayOfImageViews.first!.frame.width / 2, y: self.view.bounds.midY)
            }
            picNew.center = CGPoint(x: self.view.bounds.midX, y: self.view.bounds.midY)
        }, completion: {_ in
            picCurrent.removeFromSuperview()
        })
    }
    
}
    

