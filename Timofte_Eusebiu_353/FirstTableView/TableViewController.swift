//
//  ViewController.swift
//  Timofte_Eusebiu_353
//
//  Created by user169246 on 4/6/20.
//  Copyright © 2020 user169246. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.size.height / 6
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "JobOfferCell") as! FirstTableViewCell
        if indexPath.row % 2 == 0 {
            cell.cellTitle.text = "Cell \(indexPath.row) sjfhsd sdkjfsdkjf lsdkjfsdfj lsdfjslkdjf lsfdkj lksjdflk jsdl jksdlkj sdlkfj  jlk jsdfkjsd"
        }else {
            cell.cellTitle.text = "Cell \(indexPath.row) sjfhsd ldjkfgn dfkgj dlfkjg asdasd"
        }
        
        return cell
    }
    
    
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print((tableView.cellForRow(at: indexPath) as! FirstTableViewCell).cellTitle.font)
//    }
    


}

