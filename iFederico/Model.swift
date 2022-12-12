//
//  Model.swift
//  iFederico
//
//  Created by Alessandro Esposito Vulgo Gigante on 12/12/22.
//

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
