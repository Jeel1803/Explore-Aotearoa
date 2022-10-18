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
    var date : Date
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
        self.date = coder.decodeObject(forKey: "date") as! Date
        self.location = coder.decodeObject(forKey: "location") as! String
        self.des = coder.decodeObject(forKey: "description") as! String
        self.image = coder.decodeObject(forKey: "image") as! UIImage
    }
    init(name:String,location:String,des:String,date:Date,pic :UIImage)
   {
       self.name = name; self.location = location;
       self.date = date; self.des = des
       self.image = pic
   }
   
    
    public static func searchEventByName(sitename : String ) -> [Site]
    {
        let sites = readData()
        var resultSite = [Site]()
        for e in sites {
            if (e.name.uppercased().contains(sitename.uppercased())){
                resultSite.append(e)
            }
        }
        
        return resultSite
    }
   
}
