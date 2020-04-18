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
    var userKeywords: [String] = DataBase.getLoggedUserKeywords()
    @IBOutlet var rootView: UIView!
    @IBOutlet weak var keywords: UILabel!
    
    
    @IBAction func firstKeywordDelete(_ sender: UIButton) {
        DataBase.removeLoggedUserKeyword(at: 0)
        rootView.layoutIfNeeded()
    }
    
    @IBAction func secondKeywordDelete(_ sender: UIButton) {
        DataBase.removeLoggedUserKeyword(at: 1)
    }
    @IBAction func thirdKeywordDelete(_ sender: UIButton) {
        DataBase.removeLoggedUserKeyword(at: 2)
    }
    
    @IBAction func fourthKeywordDelete(_ sender: UIButton) {
        DataBase.removeLoggedUserKeyword(at: 3)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        for i in 0..<min(userKeywords.count, keywordLabels.count) {
            keywordLabels[i].text = userKeywords[i]
        }
        
        for i in userKeywords.count..<keywordLabels.count {
            keywordLabels[i].isHidden = true
            deleteKeyword[i].isHidden = true
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
