//
//  Task1VC.swift
//  hwk12_animation
//
//  Created by Kyzu on 16.02.22.
//

import UIKit

class Task1VC: UIViewController {
    
    private var circle: UIView!
    private let circleRadius: CGFloat = 50
    
    override func loadView() {
        let customView = UIView.init(frame: UIScreen.main.bounds)
        view = customView
        view.backgroundColor = .systemMint
        addCircle()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        circle.center = CGPoint(x: view.bounds.midX - circleRadius * 2, y: view.bounds.midY - circleRadius * 3)
    }
    
    override func viewWillLayoutSubviews() {
        if self.circle.center == CGPoint(x: self.view.bounds.midX - self.circleRadius * 2, y: self.view.bounds.midY - self.circleRadius * 3) {
            self.addAnimation(to: CGPoint(x: self.view.bounds.midX + self.circleRadius * 2, y: self.view.bounds.midY - self.circleRadius * 3))
        } else if self.circle.center == CGPoint(x: self.view.bounds.midX + self.circleRadius * 2, y: self.view.bounds.midY - self.circleRadius * 3) {
            self.addAnimation(to: CGPoint(x: self.view.bounds.midX + self.circleRadius * 2, y: self.view.bounds.midY + self.circleRadius * 3))
        } else if self.circle.center == CGPoint(x: self.view.bounds.midX + self.circleRadius * 2, y: self.view.bounds.midY + self.circleRadius * 3) {
            self.addAnimation(to: CGPoint(x: self.view.bounds.midX - self.circleRadius * 2, y: self.view.bounds.midY + self.circleRadius * 3))
        } else if self.circle.center == CGPoint(x: self.view.bounds.midX - self.circleRadius * 2, y: self.view.bounds.midY + self.circleRadius * 3) {
            self.addAnimation(to: CGPoint(x: self.view.bounds.midX - self.circleRadius * 2, y: self.view.bounds.midY - self.circleRadius * 3))
        }
    }
    
    private func addCircle() {
        circle = UIButton()
        circle.frame.size = CGSize(width: circleRadius * 2, height: circleRadius * 2)
        circle.backgroundColor = .red
        circle.layer.cornerRadius = circleRadius
        circle.layer.masksToBounds = true
        view.addSubview(circle)
    }
    
    private func addAnimation(to point: CGPoint) {
        UIView.animate(withDuration: 1, animations: {
            self.circle.center = point
        }, completion: {_ in
            self.viewWillLayoutSubviews()
        })
    }
    
}
