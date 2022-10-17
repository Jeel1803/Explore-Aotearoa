//
//  SiteTableViewController.swift
//  Explore Aotearoa
//
//  Created by Jeel Khadsaliya on 12/10/22.
//

var site : Site!
import UIKit

class SiteTableViewController: UITableViewController, UISearchBarDelegate {
    var sites = readData()
    var searching  = false
    var finalSites = [Site]()
    
    // Declare  Second Array For Save Search Result


    @IBOutlet weak var searchBar: UISearchBar!
    
    
    @IBOutlet var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
        //searchSites = sites
       finalSites = sites

        
    }

    // MARK: - Table view data source

    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print (finalSites.count)
        return finalSites.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SiteTableViewCell
        
        cell.nameLabe.text = finalSites[indexPath.row].name
        cell.picView.image = finalSites[indexPath.row].image
        cell.locationLabel.text = finalSites[indexPath.row].location
        
        //print(finalSites[indexPath.row].location)

        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        site = sites[indexPath.row]
        performSegue(withIdentifier: "show", sender: self)
    }
    
    // MARK: - SEARCH BAR DELEGATE METHOD FUNCTION

       

       
       

       func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)

       {
           finalSites = Site.searchEventByName(sitename: searchText)
           searching = true
           if (searchText == ""){
               searching = false
               finalSites = sites
           }
           table.reloadData()


       }

}
