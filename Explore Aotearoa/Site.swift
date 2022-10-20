//
//  Site.swift
//  Explore Aotearoa
//
//  Created by Jeel Khadsaliya on 12/10/22.
//
import UIKit
import Foundation

class Site: NSObject, NSCoding
{
    var name : String
    var date : String
    var location : String
    var des : String
    var image : UIImage
    
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(date, forKey: "date")
        coder.encode(location, forKey: "location")
        coder.encode(des, forKey: "description")
        coder.encode(image, forKey: "image")
    }
    
    required  init?(coder: NSCoder) {
        self.name = coder.decodeObject(forKey: "name") as! String
        self.date = coder.decodeObject(forKey: "date") as! String
        self.location = coder.decodeObject(forKey: "location") as! String
        self.des = coder.decodeObject(forKey: "description") as! String
        self.image = coder.decodeObject(forKey: "image") as! UIImage
    }
    init(name:String,location:String,des:String,date:String,pic :UIImage)
   {
       self.name = name; self.location = location;
       self.date = date; self.des = des
       self.image = pic
   }
   
    //function to search the stored data from userdefault
    public static func searchEventByName(searchString : String) -> [Site]
    {
        let sites = readData()
        var resultSite = [Site]()
        for s in sites {
            if (s.name.uppercased().contains(searchString.uppercased()) || s.date.contains(searchString.uppercased())){
                resultSite.append(s)
            }
        }
        
        return resultSite
    }
    
   
}
