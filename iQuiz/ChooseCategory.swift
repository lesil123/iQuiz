//
//  ChooseCategory.swift
//  iQuiz
//
//  Created by ζδΉζ on 5/17/22.
//

import Foundation

class ChooseCategory : Decodable {
    let title : String
    let desc: String
    let questions: [ChooseQuestions]
    
    init(titleInit: String, descInit: String, questionsInit: [ChooseQuestions]) {
        title = titleInit
        desc = descInit
        questions = questionsInit
    }
}
