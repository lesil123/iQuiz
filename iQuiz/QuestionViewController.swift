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
    
    /*
    let mathList : [Question] = [
        Question(questionText: "What is the smallest one from the below number?", choiceA: "A: 5", choiceB: "B: 10", choiceC: "C: 45", choiceD: "D: 78", answer: 1),
        Question(questionText: "What is the answer to 3*5？", choiceA: "A: 9", choiceB: "B: 15" , choiceC: "C: 28", choiceD: "D: 40", answer: 2),
        Question(questionText: "Which is greater than 4?", choiceA: "A: 5", choiceB: "B: -5", choiceC: "C: -0.5", choiceD: "D: 1", answer: 1),
        Question(questionText: "What is the answer of 12a + 26b -5b -16a?", choiceA: "A: 4a + 22b", choiceB: "B: -28a + 30b", choiceC: "C: -4a + 21b", choiceD: "D: 28a + 30b", answer: 3),
        Question(questionText: "What is the |-26|", choiceA: "A: 26", choiceB: "B: -26", choiceC: "C: 0", choiceD: "D: 1", answer: 1)
    ]

    let marvelList : [Question] = [
        Question(questionText:"What year was the first Iron Man movie released, kicking off the Marvel Cinematic Universe?" , choiceA: "A: 2005", choiceB: "B: 2008", choiceC: "C: 2010", choiceD: "D: 2012", answer: 2),
        Question(questionText: "What fake name does Natasha use when she first meets Tony in Iron Man 2?", choiceA: "A: Natalie Rushman", choiceB: "B: Norma Robinson", choiceC: "C: Naomi Roberts", choiceD: "D: Nicole Ryan", answer: 1),
        Question(questionText: "What is the name of the little boy Tony befriends while stranded in the Iron Man 3?", choiceA: "A: Harry", choiceB: "B: Henry", choiceC: "C: Harley", choiceD: "D: Holden", answer: 3),
        Question(questionText: "What animal does Darren Cross unsuccessfully shrink in the Ant-Man?", choiceA: "A: Mouse", choiceB: "B: Sheep", choiceC: "C: Duck", choiceD: "D: Hamster", answer: 2),
        Question(questionText: "What is the name of Thor’s hammer?", choiceA: "A: 28 Vanir", choiceB: "B: Mjolnir", choiceC: "C: Aesir", choiceD: "D: Norn", answer: 2)
      ]
                                          
  let scienceList : [Question] = [
    Question(questionText: "Which of the following is in liquid form at room temperature?", choiceA: "A: Lithium", choiceB: "B: Sodium", choiceC: "C: Francium", choiceD: "D: Cerium", answer: 3),
    Question(questionText: "The filament of an electric bulb is made of?", choiceA: "A: Tungsten", choiceB: "B: Nichrome", choiceC: "C: Graphite", choiceD: "D: Iron", answer: 1),
    Question(questionText: "Marsh gas is?", choiceA: "A: Nitrogen", choiceB: "B: Ethane", choiceC: "C: Methane", choiceD: "D: Hydrogen", answer: 3),
    Question(questionText: "Air is a/an?", choiceA: "A: Compound", choiceB: "B: Element", choiceC: "C: Electrolyte", choiceD: "D: Mixture", answer: 4),
    Question(questionText: "Balloons are filled with?", choiceA: "A: Nitrogen", choiceB: "B: Helium", choiceC: "C: Oxygen", choiceD: "D: Argon", answer: 2)
  ]
    
    var fillinList : [Question] = [Question(questionText: "", choiceA: "", choiceB: "", choiceC: "", choiceD: "", answer: 0)]
   */
    
    var scores = 0
    var rightAns = 0
    var questionProgress = 0
    var tagSelected = 0
    var btnIndex = 0
    var rowIndex = -1 //new
    var choiceMsg = ""
    //var questiontype = "" // iQuiz2
    
    var questiontype : [ChooseCategory] = []
    //var fillinQuestionType : [ChooseCategory] = []
    
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
        
//        if questiontype == "Mathematics" {
//            fillinList = mathList
//        } else if questiontype == "Marvel Super Heros" {
//            fillinList = marvelList
//        } else if questiontype == "Science" {
//            fillinList = scienceList
//        }
        
       // if questiontype[rowIndex].title == "Science!" {
//            fillinList = mathList
            // questiontype.title[0]
            //question.text = questiontype[rowIndex].questions[0].text
            
       //     fillinQuestionType = questiontype
            
      //  } else if questiontype[rowIndex].title == "Marvel Super Heroes" {
//                        fillinList = marvelList
//            question.text = questiontype[rowIndex].questions[1].text
        //} else if questiontype[rowIndex].title == "Mathematics" {
//            question.text = questiontype[rowIndex].questions[2].text
//                        fillinList = scienceList
       // }
         
//        if questiontype[rowIndex].title == "Science!" {
//            // fillinQuestionType = questiontype[0].questions.text[0]
//            questiontype = questiontype[0].questions.text[0]
//        } else if questiontype[rowIndex].title == "Marvel Super Heroes" {
//            fillinQuestionType = questiontype[1].questions.text[1]
//        } else if questiontype[rowIndex].title == "Mathematics" {
//            fillinQuestionType = questiontype[2].questions.text[2]
//        }
            
       // if questionProgress <= fillinList.count - 1 {

        question.text = questiontype[rowIndex].questions[questionProgress].text
        optionA.setTitle(questiontype[rowIndex].questions[questionProgress].answers[0], for: UIControl.State.normal)
        optionB.setTitle(questiontype[rowIndex].questions[questionProgress].answers[1], for: UIControl.State.normal)
        optionC.setTitle(questiontype[rowIndex].questions[questionProgress].answers[2], for: UIControl.State.normal)
        optionD.setTitle(questiontype[rowIndex].questions[questionProgress].answers[3], for: UIControl.State.normal)
        rightAns = questiontype[rowIndex].questions[questionProgress].answer

     // }
        
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
           answerVC.questionCategory = questiontype
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
