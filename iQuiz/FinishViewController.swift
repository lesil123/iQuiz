//
//  FinishViewController.swift
//  iQuiz
//
//  Created by 李乐思 on 5/15/22.
//

import UIKit

class FinishViewController: UIViewController {

    
    @IBOutlet weak var finalScore: UILabel!
    @IBOutlet weak var descriptiveText: UILabel!
    
    var totalScore = 0
    var gainScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        
        if gainScore == 0 {
            descriptiveText.text = "You should do more practices. \n 🫣"
            descriptiveText.textColor = UIColor.red
        } else if gainScore == totalScore {
            descriptiveText.text = "Awesomeee!! You got all correct!! \n 🥳🎊"
            descriptiveText.textColor = UIColor.systemGreen
        } else if gainScore > totalScore * Int(0.5) {
            descriptiveText.text = "You are almost there! \n 👏🏻👏🏻"
            descriptiveText.textColor = UIColor.systemPink
        } else {
            descriptiveText.text = "Give yourself one more chance. \n 💪🏻💪🏻"
            descriptiveText.textColor = UIColor.orange
        }
        
        //else if  1 <= gainScore <= totalScore * Int(0.5) {
//            descriptiveText.text = "Give yourself one more chance. 💪🏻💪🏻"
//        } else if gainScore == 0 {
//            descriptiveText.text = "You should do more practices. 🫣"
//        }
        
        finalScore.text = "You got \(gainScore) out of \(totalScore)"
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func backToMain(_ sender: Any) {

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
