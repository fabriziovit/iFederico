//
//  StudentModel.swift
//  OurApp
//
//  Created by Giuseppe Arena on 12/12/22.
//
import Foundation
import SwiftUI

struct Student: Identifiable {
    var id = UUID() //identifica univocamente i learner
    var nome: String
    var cognome: String
    var department: String = "No department"
    var descrizione: String = "No Description"
    var imagename: String = "No imageName"
}
