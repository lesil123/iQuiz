//
//  ChooseQuestions.swift
//  iQuiz
//
//  Created by ζδΉζ on 5/17/22.
//

import Foundation

class ChooseQuestions : Decodable {
    let text : String
    let answer: String
    let answers: [String]

    init(textInit: String, answerInit: String, answersInit: [String]) {
        text = textInit
        answer = answerInit
        answers = answersInit

    }
}
