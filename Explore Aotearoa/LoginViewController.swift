//
//  LoginViewController.swift
//  Explore Aotearoa
//
//  Created by Jeel Khadsaliya on 12/10/22.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var usernameTextField: UITextField!
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
                usernameTextField.placeholder = "Please Enter your Username"
                passwordTextField.placeholder = "Please Enter your Password"

        }
            else{
            throw User.listOfErrors.loginFailed
        }
        }catch let error as User.listOfErrors{
            showMessage(title: "Authentication Failed", msg: error.rawValue)
        }catch{}

        
    }
    
    
    func showMessage(title:String ,msg: String){
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
    

}


