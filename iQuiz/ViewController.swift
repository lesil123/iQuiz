//
//  ViewController.swift
//  iQuiz
//
//  Created by 李乐思 on 5/9/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    let subjectTitle : [String] = ["Mathematics", "Marvel Super Heros", "Science"]
    let descriptions : [String] = ["Click and start the math quizzes!", "Click and start the Marvel Super Heros quizzes!", "Click and start the Science quizzes"]
    let iconImage : [String] = ["Math", "Marvel", "Science"]
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var settingBtn: UIToolbar!
    
    
    @IBAction func clickSetting(_ sender: Any) {
        let alert = UIAlertController(title: "Settings", message: "Settings go here", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
        NSLog("The \"OK\" alert occured.")
        }))
        
        self.present(alert, animated: true, completion: nil)
 
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subjectTitle.count
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.subjectTitle.text = subjectTitle[indexPath.row]
        cell.subjectDescriptions.text = descriptions[indexPath.row]
        cell.subjectImage.image = UIImage(named:iconImage[indexPath.row])
        cell.subjectImage.layer.cornerRadius = 5.0
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110.0
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }

}
