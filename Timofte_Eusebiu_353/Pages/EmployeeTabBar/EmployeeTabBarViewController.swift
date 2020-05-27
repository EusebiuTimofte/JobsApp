//
//  EmployeeTabBarViewController.swift
//  Timofte_Eusebiu_353
//
//  Created by user169480 on 4/21/20.
//  Copyright © 2020 user169246. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestoreSwift

class EmployeeTabBarViewController: UITabBarController {
    
    let db = Firestore.firestore()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        db.collection("notifications").whereField("userId", isEqualTo: Auth.auth().currentUser!.uid).whereField("seen", isEqualTo: false).getDocuments(completion: {
            (snapshot, error) in
            if let error = error{
                print(error.localizedDescription)
                self.tabBar.items![3].badgeValue = nil
            }else{
                let nr = snapshot!.documents.count
                if nr > 0 {
                    self.tabBar.items![3].badgeValue = String(nr)
                }else {
                    self.tabBar.items![3].badgeValue = nil
                }
            }
        })
        
    }
    
    func updateBadge() {
        
        db.collection("notifications").whereField("userId", isEqualTo: Auth.auth().currentUser!.uid).whereField("seen", isEqualTo: false).getDocuments(completion: {
            (snapshot, error) in
            if let error = error{
                print(error.localizedDescription)
                self.tabBar.items![3].badgeValue = nil
            }else{
                let nr = snapshot!.documents.count
                if nr > 0 {
                    self.tabBar.items![3].badgeValue = String(nr)
                }else {
                    self.tabBar.items![3].badgeValue = nil
                }
            }
        })
        
        
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
