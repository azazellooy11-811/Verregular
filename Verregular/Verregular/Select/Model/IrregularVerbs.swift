//
//  IrregularVerbs.swift
//  IrregularVerbs
//
//  Created by Азалия Халилова on 14.04.2023.
//

import Foundation

class IrregularVerbs {
    private(set) var verbs: [Verb] = []
    var selectedVerbs: [Verb] = []
    
    func configureVerbs() {
        verbs = [
            Verb(infinitive: "blow", pastSimple: "blew", participle: "blown"),
            Verb(infinitive: "blow", pastSimple: "blew", participle: "blown"),
            Verb(infinitive: "blow", pastSimple: "blew", participle: "blown"),
            Verb(infinitive: "blow", pastSimple: "blew", participle: "blown"),
            Verb(infinitive: "blow", pastSimple: "blew", participle: "blown"),
            Verb(infinitive: "blow", pastSimple: "blew", participle: "blown"),
            Verb(infinitive: "blow", pastSimple: "blew", participle: "blown"),
            Verb(infinitive: "blow", pastSimple: "blew", participle: "blown"),
            Verb(infinitive: "blow", pastSimple: "blew", participle: "blown")
        ]
    }
}
