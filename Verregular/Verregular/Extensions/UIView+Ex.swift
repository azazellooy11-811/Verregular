//
//  UIView+Ex.swift
//  Verregular
//
//  Created by Азалия Халилова on 20.04.2023.
//

import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach { view in
            addSubview(view)
        }
    }
}
