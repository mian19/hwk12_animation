//
//  UIButton+makeNew.swift
//  hwk12_animation
//
//  Created by Kyzu on 16.02.22.
//

import Foundation
import UIKit


extension UIButton {
    static func makeNew(withLabel: String) -> UIButton{
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.setTitle(withLabel, for: .normal)
        
        return button
    }
}
