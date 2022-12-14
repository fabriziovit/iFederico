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
    var name: String
    var surname: String
    var username: String
    var department: String = "No department"
    var description: String = "No Description"
    var nameImage: String = "No imageName"
}
