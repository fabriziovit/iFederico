//
//  SubjectModel.swift
//  OurApp
//
//  Created by Giuseppe Arena on 09/12/22.
//

import Foundation
import SwiftUI

struct Subject: Identifiable {
    var id = UUID() //identifica univocamente i teams
    var name: String
    var department: String
    //var year: String
}
