//
//  Verb.swift
//  IrregularVerbs
//
//  Created by Азалия Халилова on 14.04.2023.
//

import Foundation

struct Verb {
    let infinitive: String
    let pastSimple: String
    let participle: String
    var translation: String {
        NSLocalizedString(self.infinitive, comment: "")
    }
}
