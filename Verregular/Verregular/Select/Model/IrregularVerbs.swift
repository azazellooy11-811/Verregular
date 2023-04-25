//
//  IrregularVerbs.swift
//  IrregularVerbs
//
//  Created by Азалия Халилова on 14.04.2023.
//

import Foundation

final class IrregularVerbs {
    
    // Singleton
    static var shared = IrregularVerbs()
    private init() {
        configureVerbs()
    }
    
    // MARK: - Properties
    var selectedVerbs: [Verb] = []
    private(set) var verbs: [Verb] = []
    
    // MARK: - Methods
    private func configureVerbs() {
        verbs = [
            Verb(infinitive: "blow", pastSimple: "blew", participle: "blown"),
            Verb(infinitive: "can", pastSimple: "could", participle: "could"),
            Verb(infinitive: "do", pastSimple: "did", participle: "done")
        ]
    }
}
