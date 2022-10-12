//
//  RegisterViewController.swift
//  Explore Aotearoa
//
//  Created by Jeel Khadsaliya on 12/10/22.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!


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
        print("Stage 1 User added successfully")
        
        
        
        
        var validation = false
        do {
           validation = try inputValidation(user: user)
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
        //if(NSPredicate(format: "Self Matches %@", phoneSyntax).evaluate(with: user.phone) == false){
          //  throw User.listOfErrors.invalidPhoneInput
        //}
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

