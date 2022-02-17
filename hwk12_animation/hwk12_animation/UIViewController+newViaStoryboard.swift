//
//  UIViewController+newViaStoryboard.swift
//  hwk12_animation
//
//  Created by Kyzu on 17.02.22.
//

import Foundation
import UIKit

extension UIViewController {
    static func newVC<T: UIViewController>(customVC: T.Type) -> T {
        let storyboard = UIStoryboard.init(name: "\(customVC)", bundle: Bundle.main)
        let vc = storyboard.instantiateInitialViewController() as! T
        return vc
    }
}
