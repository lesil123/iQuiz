//
//  ChooseQuestions.swift
//  iQuiz
//
//  Created by 李乐思 on 5/17/22.
//

import Foundation

class ChooseQuestions : Decodable {
    let text : String
    let answer: Int
    let answers: [String]
    let questions: [ChooseQuestions]
    
    init(textInit: String, answerInit: Int, answersInit: [String], questionsInit: [ChooseQuestions]) {
        text = textInit
        answer = answerInit
        answers = answersInit
        questions = questionsInit
    }
}
