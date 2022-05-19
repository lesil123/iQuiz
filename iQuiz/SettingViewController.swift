//
//  SettingViewController.swift
//  iQuiz
//
//  Created by 李乐思 on 5/18/22.
//


import UIKit

protocol SettingViewControllerProtocol {
   //func checkNowBtn()
    func returnURL(_ url: String)
    func checkNow(_ sender: Any)
}

class SettingViewController: UIViewController {

    
    @IBOutlet weak var inputURL: UITextField!
//    @IBOutlet weak var checkURLbtn: UIButton!
    
    
    var getURL = ""
    
    var delegate: SettingViewControllerProtocol?
    
//    @IBAction func getInputURL(_ sender: Any) {
//
//    }
    
    
    @IBAction func checkNowBtn(_ sender: Any) {
        self.delegate?.returnURL(inputURL.text!)
        self.delegate?.checkNow(sender)
//        getURL = String(inputURL.text)!
//        if let mainVC = storyboard?.instantiateViewController(withIdentifier: "MainVC") as? ViewController {
//            //questionVC.questiontype = subjectTitle[indexPath.row]
//            mainVC.externalURL = getURL
//            //mainVC.rowIndex = indexPath.row
//            self.navigationController?.pushViewController(mainVC, animated: true)
//        }
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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


