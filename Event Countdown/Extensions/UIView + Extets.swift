//
//  UIView + Extets.swift
//  Event Countdown
//
//  Created by Maksim  on 09.09.2022.
//

import UIKit

enum Edge {
    case left
    case top
    case right
    case bottom
}

extension UIView {
    func pinToSuperviewEdges(_ edges: [Edge] = [.top, .left, .right, .bottom], constant: CGFloat) {
        guard let superview = superview else { return }
        edges.forEach { const in
            switch const {
            case .left:
                leftAnchor.constraint(equalTo: superview.leftAnchor, constant: constant).isActive = true
            case .top:
                topAnchor.constraint(equalTo: superview.topAnchor, constant: constant).isActive = true
            case .right:
                rightAnchor.constraint(equalTo: superview.rightAnchor, constant: -constant).isActive = true
            case .bottom:
                bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: -constant).isActive = true
            }
        }
    }
}


