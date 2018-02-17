//
//  WorkshopFactory.swift
//  MonitoraSummerStarter
//
//  Created by Yasmin Benatti on 2018-02-17.
//  Copyright © 2018 Yasmin Benatti. All rights reserved.
//

import Foundation

class WorkshopFactory {
    
    class func createWorkshops() -> [Workshop]? {
        var workshopsArray :[Workshop] = []
        
        guard let path = Bundle.main.path(forResource: "WorkshopsList", ofType: "plist"),
            let dictRoot = NSDictionary(contentsOfFile: path),
            let arrayOfWorkshops = dictRoot["workshops"] as?  [[String : Any]] else {
                print("Could not open workshopsList plist")
                return nil
        }
        
        for workshopDictionary in arrayOfWorkshops {
            guard let id = workshopDictionary["id"] as? Int,
                let name = workshopDictionary["name"] as? String,
                let tutor = workshopDictionary["tutor"] as? String,
                let description = workshopDictionary["description"] as? String else {
                    print("Could not parse the workshop json")
                    return nil
            }
            
            let workshop = Workshop(id: id, name: name, tutor: tutor, description: description)
            workshopsArray.append(workshop)
        }
        
        return workshopsArray
    }
}


