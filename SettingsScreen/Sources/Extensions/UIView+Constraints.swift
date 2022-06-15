//
//  UIView+Constraints.swift
//  SettingsScreen
//
//  Created by mac on 31.05.22.
//

import UIKit

extension UIView {
    
    func addSubviewsForAutoLayout(_ views: [UIView]) {
        for view in views {
            view.translatesAutoresizingMaskIntoConstraints = false
            addSubview(view)
        }
    }
}


