//
//  ViewController.swift
//  Explore Aotearoa
//
//  Created by Jeel Khadsaliya on 11/10/22.
//

import UIKit
//var sites: [Site]!


//Global function to show message 
func showMessage(title:String ,msg: String, _ controller: UIViewController){
    let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
    let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
    alert.addAction(action)
    controller.present(alert, animated: true, completion: nil)
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }


}

