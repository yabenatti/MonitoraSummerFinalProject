//
//  Workshop.swift
//  MonitoraSummerStarter
//
//  Created by Yasmin Benatti on 2018-02-17.
//  Copyright © 2018 Yasmin Benatti. All rights reserved.
//

import Foundation

class Workshop {
    
    var id :Int
    var name :String
    var tutor :String
    var description :String
    
    init(id :Int, name :String, tutor: String, description :String) {
        self.id = id
        self.name = name
        self.tutor = tutor
        self.description = description
    }
}
