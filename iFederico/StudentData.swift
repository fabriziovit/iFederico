//
//  StudentData.swift
//  OurApp
//
//  Created by Giuseppe Arena on 12/12/22.
//

import Foundation
import SwiftUI


class SharableData: ObservableObject {
    
    @Published var students = [
        Student (name: "Walter", surname: "White", username: "WWhite", department: "Mechatronic Engineering",description: "This is my Bio, welcome to my profile. I’m a mechatronic engineering student of Federico II- Say my Name!", nameImage: "Profilo")
    ]
}
var sharableData = SharableData()
