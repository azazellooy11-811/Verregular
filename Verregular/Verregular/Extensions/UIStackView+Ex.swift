//
//  UIStackView+Ex.swift
//  Verregular
//
//  Created by Азалия Халилова on 20.04.2023.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach { view in
            addArrangedSubview(view)
        }
    }
}
