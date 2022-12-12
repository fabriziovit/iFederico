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
        Student (nome: "Walter", cognome: "White", department: "Mechatronic Engineering",descrizione: "This is my Bio, welcome to my profile. I’m a mechatronic engineering student of Federico II- Say my Name!", imagename: "Profilo")
    ]
}
var sharableData = SharableData()
