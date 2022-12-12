//
//  Data.swift
//  iFederico
//
//  Created by Alessandro Esposito Vulgo Gigante on 12/12/22.
//

import Foundation

import SwiftUI

class SharedData: ObservableObject {
    @Published var questions = [
        Question(title:"Could someone share old exam tests of Prof. Green?", tag:"Analisi1",userName: "Jack",body:"Hi guys, by chance does anyone know where I can find some old exams from Professor Green?"),
        Question(title:"Do you know how to solve 5x^2 + 5x = 10?", tag:"Analisi1",userName: "Mike",body:"Hi guys, do you know ho to solve this equation 5x^2 + 5x = 10? I suck at math."),
        Question(title:"Do you know if this exercise is correct?", tag:"Analisi1",userName: "Kyle",body:"Guys i am dumb, i don't know how to solve this exercise, i tried online but i think...")
    ]
    
}

var sharedData = SharedData()
