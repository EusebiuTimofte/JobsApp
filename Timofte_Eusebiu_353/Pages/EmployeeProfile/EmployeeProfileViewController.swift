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
        for i in 0..<min(userKeywords.count, keywordLabels.count) {
            keywordLabels[i].text = userKeywords[i]
        }
        
        for i in userKeywords.count..<keywordLabels.count {
            keywordLabels[i].isHidden = true
            deleteKeyword[i].isHidden = true
        }
    }

}
