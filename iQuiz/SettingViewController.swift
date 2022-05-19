//
//  SettingViewController.swift
//  iQuiz
//
//  Created by 李乐思 on 5/18/22.
//


import UIKit
import SwiftUI

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
    
    @AppStorage("historyUrl") private var historyUrl = ""
    
    @IBAction func checkNowBtn(_ sender: Any) {
        
        if inputURL.text == "" {
            let alert = UIAlertController(title: "Invalid URL", message: "You should input a valid URL", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
            }))
            alert.view.tintColor = UIColor.systemPurple
            self.present(alert, animated: true, completion: nil)
        } else {
            self.delegate?.returnURL(inputURL.text!)
            self.delegate?.checkNow(sender)
            historyUrl = inputURL.text!
            self.dismiss(animated: true)
        }   
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        inputURL.text = historyUrl
        inputURL.textColor = UIColor.gray
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


