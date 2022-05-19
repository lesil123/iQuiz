//
//  QuestionViewController.swift
//  iQuiz
//
//  Created by 李乐思 on 5/14/22.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var optionA: UIButton!
    @IBOutlet weak var optionB: UIButton!
    @IBOutlet weak var optionC: UIButton!
    @IBOutlet weak var optionD: UIButton!
    @IBOutlet weak var submitBtn: UIButton!
    
    var scores = 0
    var rightAns = 0
    var questionProgress = 0
    var tagSelected = 0
    var btnIndex = 0
    var rowIndex = -1 //new
    var choiceMsg = ""
    //var questiontype = "" // iQuiz2
    
    var questiontype : [ChooseCategory] = []
    
    var colorBtn: [UIButton] = [UIButton]()

     
    
    @IBAction func selectAnswer(_ sender: UIButton) {
        tagSelected = sender.tag
        if tagSelected == rightAns {
            choiceMsg = "You made the right choice! 🌞"
            //scores += 1
        } else {
            choiceMsg = "Unfortunately, the answer is incorrect. 🥀"
        }
        
        colorBtn = [optionA, optionB, optionC, optionD]
        let btn = sender
            for b in colorBtn {
                if b == btn {
                    b.isSelected = true
                } else {
                    b.isSelected = false
                }
        }
        
        submitBtn.isEnabled = true
        
    }
    
    func showQuestion() {
        print(questionProgress)
//        print(rowIndex)
        question.text = questiontype[rowIndex].questions[questionProgress].text
        optionA.setTitle(questiontype[rowIndex].questions[questionProgress].answers[0], for: UIControl.State.normal)
        optionB.setTitle(questiontype[rowIndex].questions[questionProgress].answers[1], for: UIControl.State.normal)
        optionC.setTitle(questiontype[rowIndex].questions[questionProgress].answers[2], for: UIControl.State.normal)
        optionD.setTitle(questiontype[rowIndex].questions[questionProgress].answers[3], for: UIControl.State.normal)
        rightAns = Int(questiontype[rowIndex].questions[questionProgress].answer)!

        //unwarpped 不管是不是nil都给他弄出来
        
        questionProgress += 1
    }
     
    
    @IBAction func submitAns(_ sender: Any) {
        
        if tagSelected == rightAns {
            scores += 1
        }
        
       if let answerVC = storyboard?.instantiateViewController(withIdentifier: "AnswerVC") as? AnswerViewController {
           answerVC.questionArray = questiontype
           answerVC.questionProgess = questionProgress
           answerVC.choiceMsg = choiceMsg
           answerVC.getScore = scores
           //answerVC.questionCategory = questiontype
           answerVC.indexRow = rowIndex
        self.navigationController?.pushViewController(answerVC, animated: true)
        }
    }
    
    @IBAction func backHome(_ sender: Any) {

        if let mainVC = storyboard?.instantiateViewController(withIdentifier: "MainVC") as? ViewController {
            self.navigationController?.pushViewController(mainVC, animated: true)
        }
        scores = 0
    }
    
    override func viewDidLoad() {
        self.navigationItem.hidesBackButton = true
        super.viewDidLoad()
        showQuestion()
        submitBtn.isEnabled = false
        
        

        // Do any additional setup after loading the view.
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
