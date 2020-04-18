//
//  EmployeeProfileViewController.swift
//  Timofte_Eusebiu_353
//
//  Created by user169480 on 4/18/20.
//  Copyright © 2020 user169246. All rights reserved.
//

import UIKit

class EmployeeProfileViewController: UIViewController {

    @IBOutlet var deleteKeyword: [UIButton]!
    @IBOutlet var keywordLabels: [UILabel]!
    var userKeywords: [String] = []
    @IBOutlet var rootView: UIView!
    @IBOutlet weak var keywords: UILabel!
    
    
    @IBAction func addNewKeyword(_ sender: UIButton) {
        
        //1. Create the alert controller.
        let alert = UIAlertController(title: "New Keyword", message: "Enter keyword", preferredStyle: .alert)

        //2. Add the text field. You can configure it however you need.
        alert.addTextField { (textField) in
            textField.placeholder = "Keyword"
        }

        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0] // Force unwrapping because we know it exists.
            DataBase.addLoggedUserKeyword(keyword: textField!.text!)
            self.viewWillAppear(true)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        
        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func firstKeywordDelete(_ sender: UIButton) {
        DataBase.removeLoggedUserKeyword(at: 0)
        viewWillAppear(true)
    }
    
    @IBAction func secondKeywordDelete(_ sender: UIButton) {
        DataBase.removeLoggedUserKeyword(at: 1)
        viewWillAppear(true)
    }
    @IBAction func thirdKeywordDelete(_ sender: UIButton) {
        DataBase.removeLoggedUserKeyword(at: 2)
        viewWillAppear(true)
    }
    
    @IBOutlet weak var newKeywordButton: UIButton!
    @IBAction func fourthKeywordDelete(_ sender: UIButton) {
        DataBase.removeLoggedUserKeyword(at: 3)
        viewWillAppear(true)
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
    
    override func viewWillAppear(_ animated: Bool) {
        userKeywords = DataBase.getLoggedUserKeywords()
        
        if userKeywords.count >= 4 {
            newKeywordButton.isEnabled = false
        }else {
            newKeywordButton.isEnabled = true
        }
        
        for i in 0..<min(userKeywords.count, keywordLabels.count) {
            keywordLabels[i].text = userKeywords[i]
            keywordLabels[i].isHidden = false
            deleteKeyword[i].isHidden = false
        }
        
        for i in userKeywords.count..<keywordLabels.count {
            keywordLabels[i].isHidden = true
            deleteKeyword[i].isHidden = true
        }
    }

}
