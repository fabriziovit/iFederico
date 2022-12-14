//
//  Model.swift
//  iFederico
//
//  Created by Alessandro Esposito Vulgo Gigante on 12/12/22.
//
/*
import Foundation

import Foundation
import SwiftUI

struct Question : Identifiable {
    var id = UUID()
    var title: String
    var tag: String
    var userName: String
    var date: Date = Date()
    var body: String
    var status: String = "Open"
}
*/
import SwiftUI


struct Answer : Identifiable {
    var id = UUID()
    var profile : Student
    var body : String
    var like : Int
    var dislike : Int
    var ACounter : Int //counter allegati
    var date: Date
}

struct Question : Identifiable {
    var id = UUID()
    var title: String
    var profile : Student
    var body : String
    var tag : Subject
    var status: String = "Open"
    var answers : [Answer]
    var ACounter : Int
    var date: Date
}

struct Subject: Identifiable {
    var id = UUID() //identifica univocamente i teams
    var name: String
    var department: String
    //var year: String
}

