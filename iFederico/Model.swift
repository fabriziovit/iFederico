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
    var nickname : String
    var body : String
    var date : Date = Date()
    var like : Int
    var dislike : Int
    var ACounter : Int //counter allegati
}

struct Question : Identifiable {
    
    var id = UUID()
    var title: String
    var userName : String
    var body : String
    var tag : String
    var date : Date = Date()
    var status: String = "Open"
    var answers : [Answer]
    var ACounter : Int
    var AnswerCounter : Int
}

