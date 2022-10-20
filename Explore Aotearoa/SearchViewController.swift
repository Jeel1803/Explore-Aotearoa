//
//  SearchViewController.swift
//  Explore Aotearoa
//
//  Created by Jeel Khadsaliya on 20/10/22.
//

import UIKit

class SearchViewController: UIViewController , UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate  {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var sites = readData()
    var searching  = false
    var finalSites = [Site]()
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print (finalSites.count)
        return finalSites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SiteTableViewCell
        
        cell.nameLabe.text = finalSites[indexPath.row].name
        cell.picView.image = finalSites[indexPath.row].image
        cell.locationLabel.text = finalSites[indexPath.row].location
        
        //print(finalSites[indexPath.row].location)

        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        
       finalSites = sites


        // Do any additional setup after loading the view.
    }
    
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


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
