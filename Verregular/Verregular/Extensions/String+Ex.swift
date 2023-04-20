//
//  String+Ex.swift
//  Verregular
//
//  Created by Азалия Халилова on 19.04.2023.
//

import Foundation

extension String {
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
}
