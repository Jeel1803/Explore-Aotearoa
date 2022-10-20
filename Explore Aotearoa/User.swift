//
//  User.swift
//  Explore Aotearoa
//
//  Created by Jeel Khadsaliya on 12/10/22.
//

import Foundation
class User: NSObject, NSCoding{
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(address, forKey: "address")
        coder.encode(email, forKey: "email")
        coder.encode(phone, forKey: "phone")
        coder.encode(username, forKey: "username")
        coder.encode(password, forKey: "password")
    }
    
    required init?(coder: NSCoder) {
        self.name = coder.decodeObject(forKey: "name") as! String
        self.address = coder.decodeObject(forKey: "address") as! String
        self.email = coder.decodeObject(forKey: "email") as! String
        self.phone = coder.decodeInteger(forKey: "phone")
        self.username = coder.decodeObject(forKey: "username") as! String
        self.password = coder.decodeObject(forKey: "password") as! String
        
    }
    
    var name : String
    var address : String
    var email : String
    var phone : Int
    var username : String
    var password : String
    
    init (name : String, address : String, email : String, phone : Int, username : String, password : String){
        self.name = name
        self.address = address
        self.email = email
        self.phone = phone
        self.username = username
        self.password = password
        
    }
    
    func getDetail() -> String
    {
        return "Name: \(name) , Address: \(address), Email: \(email),Phone: \(phone), Username: \(username), Password: \(password) "
    }
    
    //list of error to display when validation function is called
    
    enum listOfErrors : String, Error {
        case emptyField = "Please Fill all the Details"
        case invalidNameInput = "Please Enter Valid Name"
        case invalidAddressInput = "Please Enter Valid Home Address"
        case invalidEmailInput = "Please Enter Valid Email Address"
        case invalidPhoneInput = "Please Enter Valid Phone Number"
        case invalidPasswordInput = "Password Must Contains 8 character"
        case confirmPasswordInput = "Confirm password doesnt match Password"
        case usernameNotAvailablr = "User with this username already exist"
        case loginFailed = "Username or Password doesn't match"
    }
    
}
