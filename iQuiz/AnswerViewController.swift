//
//  AnswerViewController.swift
//  iQuiz
//
//  Created by 李乐思 on 5/15/22.
//

import UIKit

class AnswerViewController: UIViewController {

    
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var correctAns: UILabel!
    @IBOutlet weak var information: UILabel!
    
    //var questionArray : [Question] = []
    var questionArray : [ChooseCategory] = []
    var questionProgess = 0
    var getScore = 0
    var choiceMsg = ""
    var indexRow = -1
    //var questionCategory = ""
    //var questionCategory : [ChooseCategory] = []
    var correctAnswerIndex = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        
        questionText.text = questionArray[indexRow].questions[questionProgess - 1].text
        correctAnswerIndex = Int(questionArray[indexRow].questions[questionProgess - 1].answer)!
        
        correctAns.text = "The correct answer is \n \(questionArray[indexRow].questions[questionProgess - 1].answers[correctAnswerIndex])"
        
//        if questionArray[indexRow].questions[questionProgess - 1].answer == 1 {
//            correctAns.text = "The correct answer is \n \(questionArray[questionProgess - 1].optionA)"
//        } else if questionArray[questionProgess - 1].correctAnswer == 2 {
//            correctAns.text = "The correct answer is \n \(questionArray[questionProgess - 1].optionB)"
//        } else if questionArray[questionProgess - 1].correctAnswer == 3 {
//            correctAns.text = "The correct answer is \n \(questionArray[questionProgess - 1].optionC)"
//        } else if questionArray[questionProgess - 1].correctAnswer == 4 {
//            correctAns.text = "The correct answer is \n \(questionArray[questionProgess - 1].optionD)"
//        }
        
        correctAns.textColor = UIColor.systemPurple
        information.text = choiceMsg
        
    }

    @IBAction func pressNext(_ sender: Any) {
/*
        if questionProgess == questionArray.count - 1 {
            if let finishVC = storyboard?.instantiateViewController(withIdentifier: "FinishVC") as? FinishViewController {
                finishVC.gainScore = getScore
                finishVC.totalScore = questionArray.count
                self.navigationController?.pushViewController(finishVC, animated: true)
            }
        } else if questionProgess == questionArray.count {
            if let questionVC = storyboard?.instantiateViewController(withIdentifier: "QuestionVC") as? QuestionViewController {
                questionVC.questiontype = questionArray
                questionVC.questionProgress = questionProgess
                questionVC.scores = getScore
                questionVC.rowIndex = indexRow
                self.navigationController?.pushViewController(questionVC, animated: true)
            }
            
        }
 
*/
        if questionProgess < questionArray[indexRow].questions.count {
            if let questionVC = storyboard?.instantiateViewController(withIdentifier: "QuestionVC") as? QuestionViewController {
              questionVC.questiontype = questionArray
              questionVC.questionProgress = questionProgess
              questionVC.scores = getScore
              questionVC.rowIndex = indexRow
              self.navigationController?.pushViewController(questionVC, animated: true)
            }
        } else {
            if let finishVC = storyboard?.instantiateViewController(withIdentifier: "FinishVC") as? FinishViewController {
            finishVC.gainScore = getScore
            finishVC.totalScore = questionArray.count
            self.navigationController?.pushViewController(finishVC, animated: true)
            }
        }
    }
  
    
    
    @IBAction func pressBack(_ sender: Any) {
        if let mainVC = storyboard?.instantiateViewController(withIdentifier: "MainVC") as? ViewController {
            self.navigationController?.pushViewController(mainVC, animated: true)
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
