//
//  ChooseQuestions.swift
//  iQuiz
//
//  Created by 李乐思 on 5/17/22.
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
