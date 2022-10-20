//
//  AddLandmarkViewController.swift
//  Explore Aotearoa
//
//  Created by Jeel Khadsaliya on 12/10/22.
//

import UIKit
var sites = [Site]()

func showMessage(msg : String, controller : UIViewController)
{
    let alert = UIAlertController(title: "", message: msg, preferredStyle: .alert)
    let action = UIAlertAction(title: "OK", style: .default, handler: {
        action in
        controller.dismiss(animated: true, completion: nil)
    })
    alert.addAction(action)
    controller.present(alert, animated: true, completion: nil)
}
func readData() -> [Site]
{
    if UserDefaults.standard.value(forKey: "sites") != nil
    {
        let data = UserDefaults.standard.value(forKey: "sites") as! Data
        let sites = try! NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as! [Site]
        return sites
    }else
    {
        return [Site]()
    }
}

class AddLandmarkViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var nameTextField: UITextField!{
        didSet {
            let plText = NSAttributedString(string: "Name",
                                                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
            
            nameTextField.attributedPlaceholder = plText
        }
    }
    
    @IBOutlet weak var picView: UIImageView!
    
    @IBOutlet weak var locationTextField: UITextField!{
        didSet {
            let plText = NSAttributedString(string: "Location",
                                                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
            
            locationTextField.attributedPlaceholder = plText
        }
    }
    @IBOutlet weak var decriptionTextView: UITextField!{
        didSet {
            let plText = NSAttributedString(string: "Description",
                                                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
            
            decriptionTextView.attributedPlaceholder = plText
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
   
    @IBAction func uploadImage(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true, completion: nil)
    }
    @IBAction func addSite(_ sender: UIButton) {
        let date = Date()
        let formatter = DateFormatter()
        formatter.timeZone = .current
        formatter.locale = .current
        formatter.dateFormat = "dd/MM/yyyy"
       // site.date = formatter.string(from: date)

        let site = Site(name: nameTextField.text!, location: locationTextField.text!, des: decriptionTextView.text!, date : formatter.string(from: date), pic: picView.image!)
        var sites = readData()
        sites.append(site)
        print("Append Succesfully")
        let data = try! NSKeyedArchiver.archivedData(withRootObject: sites, requiringSecureCoding: false)
        UserDefaults.standard.set(data, forKey: "sites")
        
        print(sites)
        showMessage(msg: "New Site Added Successfully", controller: self)
        nameTextField.text = ""
        locationTextField.text = ""
        decriptionTextView.text = ""
        picView.image = UIImage(named: "uploadImage")
      
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let pic = info[.originalImage] as! UIImage
        picView.image = pic
        dismiss(animated: true, completion: nil)
    }
    
}
