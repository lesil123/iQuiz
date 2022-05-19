//
//  ViewController.swift
//  iQuiz
//
//  Created by 李乐思 on 5/9/22.
//
import Foundation
import UIKit
import Network

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, SettingViewControllerProtocol {
    func returnURL(_ url: String) {
        externalURL = url
    }
    
    func checkNow(_ sender: Any) {
        fetchData(externalURL)
    }
    
  
    //let subjectTitle : [String] = ["Mathematics", "Marvel Super Heros", "Science"]
    // JSON subjectTitle
    //let subjectTitle : [ChooseCategory] = []
    
    // let descriptions : [String] = ["Click and start the math quizzes!", "Click and start the Marvel Super Heros quizzes!", "Click and start the Science quizzes!"]
    let iconImage : [String] = ["Science", "Marvel", "Math"]
    
    let Originurl = "https://tednewardsandbox.site44.com/questions.json"
    var externalURL = ""
    var data: [ChooseCategory] = []
    //var index = 0
    
//    print(data)
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var settingBtn: UIToolbar!
    
    
//    @IBAction func clickSetting(_ sender: Any) {
//        let alert = UIAlertController(title: "Settings", message: "Settings go here", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
//        NSLog("The \"OK\" alert occured.")
//        }))
//        alert.view.tintColor = UIColor.systemPurple
//        self.present(alert, animated: true, completion: nil)
//
//    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return subjectTitle.count
        return data.count
    }
    
//    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
//        return nil
//    }
    
    func fetchData(_ inputurl: String) {
       let url = URL (string: inputurl)
        //❗️initURL记得replace❗️
        //let initURL = "https://tednewardsandbox.site44.com/questions.json")
        
        //download json
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
                
//                guard errorMsg == nil else {
//                    print("error = \(errorMsg!)")
//                    return
//                }
                
                guard let data = data else {
                    print("Fail to catch data")
                    return
                }
                
            print(data)
            
//                if response != nil {
//                    if (response! as! HTTPURLResponse).statusCode != 200 {
//                        print("Something went wrong! \(error!)")
//                    }
//                }
            
                print("try")
            
                if let questiontype = try? JSONDecoder().decode([ChooseCategory].self, from: data) {
                    DispatchQueue.main.async {
                        self.data = questiontype
                        print("Print questionType \(questiontype)")
                        self.tableView.reloadData()
                    }
                } else {
                    print("fail to decode data")
                }
            
            }.resume()
        }
    
    
    /*
    func fetchData(_ theurl: String) {
          let url = URL (string: theurl)
          
          URLSession.shared.dataTask(with: url!) {
              data, response, error in
              guard let data = data else { return }
              
              if response != nil {
                  if (response! as! HTTPURLResponse).statusCode != 200 {
                      print("Something went wrong! \(error!)")
                  }
              }

              if let questiontype = try? JSONDecoder().decode([ChooseCategory].self, from: data) {
                  DispatchQueue.main.async {
                      self.data = questiontype
                      self.tableView.reloadData()
                  }
              }
          }.resume()
      }
    */
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        //cell.subjectTitle.text = subjectTitle[indexPath.row]
        cell.subjectTitle.text = data[indexPath.row].title
        //cell.subjectDescriptions.text = descriptions[indexPath.row]
        cell.subjectDescriptions.text = data[indexPath.row].desc
        cell.subjectImage.image = UIImage(named:iconImage[indexPath.row])
        cell.subjectImage.layer.cornerRadius = 5.0
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110.0
    }
    
    // let subjectSelected = indexPath.row
    // 0 1 2
    //qie huan dao bie de VC
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let questionVC = storyboard?.instantiateViewController(withIdentifier: "QuestionVC") as? QuestionViewController {
            //questionVC.questiontype = subjectTitle[indexPath.row]
            questionVC.questiontype = data
            questionVC.rowIndex = indexPath.row
            
            self.navigationController?.pushViewController(questionVC, animated: true)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let setting = segue.destination as? SettingViewController {
            //把setting的delegate设成main vc的东西之后才可以call从setting vc protocol传过来的function
            setting.delegate = self
        }
    }
        
    override func viewDidLoad() {
        
        super.viewDidLoad()
        fetchData(Originurl)
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        self.navigationItem.hidesBackButton = true
        
        //monitor
        //if network satisfied
        // 163
        // else fetch local json
    }
}


