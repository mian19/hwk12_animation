//
//  ViewController.swift
//  hwk12_animation
//
//  Created by Kyzu on 16.02.22.
//

import UIKit

class ViewController: UIViewController {
    
    private var task1Button: UIButton!
    private var task2Button: UIButton!
    
    override func loadView() {
        let customView = UIView(frame: UIScreen.main.bounds)
        view = customView
        view.backgroundColor = .systemGray
        
        addElements()
        
        view.addSubview(task1Button)
        view.addSubview(task2Button)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setElements()
        
        
    }
    
    private func addElements() {
        task1Button = UIButton.makeNew(withLabel: "Task1")
        task2Button = UIButton.makeNew(withLabel: "Task3")
        task1Button.addTarget(self, action: #selector(on1Button), for: .touchUpInside)
        task2Button.addTarget(self, action: #selector(on2Button), for: .touchUpInside)
    }
    
    private func setElements() {
        NSLayoutConstraint.activate([
        
            task1Button.widthAnchor.constraint(equalToConstant: 200),
            task1Button.heightAnchor.constraint(equalToConstant: 100),
            task1Button.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            task1Button.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: -60),
            
            task2Button.widthAnchor.constraint(equalToConstant: 200),
            task2Button.heightAnchor.constraint(equalToConstant: 100),
            task2Button.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            task2Button.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: 60),
        ])
    }
    
    private func transitionTo<T: UIViewController>(vc: T.Type) {
        let storyboard = UIStoryboard.init(name: "\(vc)", bundle: Bundle.main)
        let vc = storyboard.instantiateInitialViewController() as! T
        navigationController?.pushViewController(vc, animated: true)
    }

    @objc private func on1Button() {
        transitionTo(vc: Task1VC.self)
    }
    
    @objc private func on2Button() {
        transitionTo(vc: Task3VC.self)
    }

}

