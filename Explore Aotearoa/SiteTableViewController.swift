//
//  SiteTableViewController.swift
//  Explore Aotearoa
//
//  Created by Jeel Khadsaliya on 12/10/22.
//

var site : Site!
import UIKit

class SiteTableViewController: UITableViewController {
    let sites = readData()

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source

    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print(sites.count)
        return sites.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SiteTableViewCell
        
        cell.nameLabe.text = sites[indexPath.row].name
        cell.picView.image = sites[indexPath.row].image
        cell.locationLabel.text = sites[indexPath.row].location

        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        site = sites[indexPath.row]
        performSegue(withIdentifier: "show", sender: self)
    }

}
