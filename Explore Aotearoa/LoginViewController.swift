//
//  LoginViewController.swift
//  Explore Aotearoa
//
//  Created by Jeel Khadsaliya on 12/10/22.
//

import UIKit




class LoginViewController: UIViewController {

    //cod to display placeholder
    @IBOutlet weak var usernameTextField: UITextField!{
        didSet {
            let plText = NSAttributedString(string: "Please enter your Nemw",
                                                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
            
            usernameTextField.attributedPlaceholder = plText
        }
    }
    @IBOutlet weak var passwordTextField: UITextField!{
        didSet {
            let plText = NSAttributedString(string: "Please enter your Password",
                                                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
            
            passwordTextField.attributedPlaceholder = plText
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func loginButton(_ sender: UIButton) {
        let username = usernameTextField.text!
        let password = passwordTextField.text!
        
        let data = UserDefaults.standard.value(forKey: "user") as! Data
        let user = try! NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as! User
        
        do{
            if (username == user.username && password == user.password){
                
                print(user.name)
                performSegue(withIdentifier: "home", sender: self)
                usernameTextField.text = ""
                passwordTextField.text = ""

        }
            else{
            throw User.listOfErrors.loginFailed
        }
        }catch let error as User.listOfErrors{
            showMessage(title: "Authentication Failed", msg: error.rawValue, self)
        }catch{}

        
    }
    
    
   
    
    
    

}


