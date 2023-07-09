//
//  Tasks.swift
//  DesafioChatgpt
//
//  Created by Sergio Silva Macedo on 03/07/23.
//

import Foundation


class Tasks {

    var title: String?
    var year: String?
    var month: String?
    var day: String?
    var time: String?
    var description: String?
    var level : Int?
    var key : String?
    
    init(data: [String:Any]) {
        
        self.key = data["Key"] as? String
        self.day = data["Day"] as? String
        self.month = data["Month"] as? String
        self.year = data["Year"] as? String
        self.description = data["Description"] as? String
        self.level = data["Level"] as? Int
        self.time = data["Time"] as? String
        self.title = data["Title"] as? String
    }
}
