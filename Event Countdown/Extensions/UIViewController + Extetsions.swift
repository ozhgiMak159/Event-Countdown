//
//  UIViewController + Extetsions.swift
//  Event Countdown
//
//  Created by Maksim  on 07.09.2022.
//

import UIKit

extension UIViewController {
    static func createObject<T>() -> T {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let controller = storyboard.instantiateViewController(withIdentifier: "\(T.self)") as! T
        return controller
    }
}
