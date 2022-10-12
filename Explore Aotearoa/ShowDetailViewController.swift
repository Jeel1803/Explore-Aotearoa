//
//  ShowDetailViewController.swift
//  Explore Aotearoa
//
//  Created by Jeel Khadsaliya on 12/10/22.
//

import UIKit

class ShowDetailViewController: UIViewController {

    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var desTextView: UITextView!
    @IBOutlet weak var picView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        nameLabel.text! = site.name
        locationLabel.text! = site.location
        desTextView.text! = site.des
        picView.image = site.image
    }
    

    

}
