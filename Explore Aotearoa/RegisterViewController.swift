//
//  RegisterViewController.swift
//  Explore Aotearoa
//
//  Created by Jeel Khadsaliya on 12/10/22.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!{
        didSet {
            let plText = NSAttributedString(string: "Please enter your name",
                                                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
            
            nameTextField.attributedPlaceholder = plText
        }
    }
    
    @IBOutlet weak var addressTextField: UITextField!
    {
        didSet {
            let plText = NSAttributedString(string: "Please enter your address",
                                                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
            
            addressTextField.attributedPlaceholder = plText
        }
    }
    
    @IBOutlet weak var phoneTextField: UITextField!{
        didSet {
            let plText = NSAttributedString(string: "Please enter your phone",
                                                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
            
            phoneTextField.attributedPlaceholder = plText
        }
    }
    
    @IBOutlet weak var emailTextField: UITextField!{
        didSet {
            let plText = NSAttributedString(string: "Please enter your email",
                                                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
            
            emailTextField.attributedPlaceholder = plText
        }
    }
    
    @IBOutlet weak var usernameTextField: UITextField!{
        didSet {
            let plText = NSAttributedString(string: "Please enter your username",
                                                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
            
            usernameTextField.attributedPlaceholder = plText
        }
    }
    
    @IBOutlet weak var passwordTextField: UITextField!{
        didSet {
        let redPlaceholderText = NSAttributedString(string: "Please enter your Password",
                                                    attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        
        passwordTextField.attributedPlaceholder = redPlaceholderText
    }
}


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func registerButton(_ sender: UIButton) {
        let name = nameTextField.text!
        let address = addressTextField.text!
        let email = emailTextField.text!
        let phone = Int(phoneTextField.text!) ?? 0
        let username = usernameTextField.text!
        let password = passwordTextField.text!
        
        
        
        let user = User(name: name, address: address, email: email, phone: phone, username: username, password: password)
        let data = try! NSKeyedArchiver.archivedData(withRootObject: user, requiringSecureCoding: false)
        
        UserDefaults.standard.set(data, forKey: "user")
        //print("Stage 1 User added successfully")
        
        
        
        
        var validation = false
        do {
           validation = try inputValidation(user: user)
            nameTextField.text = ""
            addressTextField.text = ""
            emailTextField.text = ""
            phoneTextField.text = ""
            usernameTextField.text = ""
            passwordTextField.text = ""
            showMessage(title: "Success", msg: "User Added Succesfully")


        }
        catch let error as User.listOfErrors  {
            
            showMessage(title: "Input Error", msg: error.rawValue)
            print(error.rawValue)
            return
        }
        catch{
            
        }

    }
    
    func showMessage(title:String ,msg: String){
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
    func inputValidation(user : User) throws -> Bool{
        let nameSyntax = "[a-zA-z ]*"
        let addressSyntax = "^[#.0-9a-zA-Z\\s,-]+$"
        let emailSyntax = "[A-Z0-9a-z._%\\+-]+@[A-Za-z0-9.-]+.[A-Za-z]{2,64}"
        let passwordSyntax = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
        
        if(user.name.isEmpty || user.phone.isMultiple(of: 0) || user.address.isEmpty || user.email.isEmpty || user.username.isEmpty || user.password.isEmpty){
            throw User.listOfErrors.emptyField
        }
        if(NSPredicate(format: "Self Matches %@", nameSyntax).evaluate(with: user.name) == false){
            throw User.listOfErrors.invalidNameInput
        }
        if(NSPredicate(format: "Self Matches %@", emailSyntax).evaluate(with: user.email) == false){
            throw User.listOfErrors.invalidEmailInput
        }
        if(NSPredicate(format: "Self Matches %@", addressSyntax).evaluate(with: user.address) == false){
            throw User.listOfErrors.invalidAddressInput
        }
        if(NSPredicate(format: "Self Matches %@", passwordSyntax).evaluate(with: user.password) == false){
            throw User.listOfErrors.invalidPasswordInput
        }
        
        return true
    }
   
    
    


}

