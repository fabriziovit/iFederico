//
//  Data.swift
//  iFederico
//
//  Created by Alessandro Esposito Vulgo Gigante on 12/12/22.
//
/*
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
*/

import SwiftUI

class SharedData: ObservableObject {
    @Published var questions = [Question(title: "Could someone share old exam tests of Prof. Green?", profile: Student(name: "Jack", surname: "Corey", username: "JCorey", nameImage: "Profile 1"), body: "Hi guys, by chance does anyone know where I can find some old exams from Professor Green?", tag: Subject(name: "Analisi I", department: ""), answers: [Answer (profile: Student(name: "Mike", surname: "Gray", username: "MGray12", nameImage: "Profile 3"), body: "Check on the professor website or in the old questions",like: 8, dislike: 1, ACounter: 0, date: Date(timeIntervalSinceReferenceDate: 691900000), index: 0), Answer(profile: Student(name: "Kyle", surname: "Thompson", username: "KTom90", nameImage: "Profile 2"), body: "The professor changes the type of exams every semester. I can't tell you if it's useful or not to go and check the old ones in this case. I hope I was helpful", like: 3, dislike: 1, ACounter: 0, date: Date(timeIntervalSinceReferenceDate: 691900000), index: 1), Answer(profile: Student(name: "Roby", surname: "Rodriguez", username: "Roby15R", nameImage: "Profile 2"), body: "I'm crying for the same reason as you", like: 4, dislike: 1, ACounter: 0, date: Date(timeIntervalSinceReferenceDate: 691900000), index: 2)], ACounter: 1, date: Date(timeIntervalSinceReferenceDate: 691700000), index: 0), Question(title: "Do you know how to solve 5x^2 + 5x = 10?", profile: Student(name: "Mike", surname: "Gray", username: "MGray12", nameImage: "Profile 3"), body: "Hi guys, do you know ho to solve this equation 5x^2 + 5x = 10? I suck at math.", tag: Subject(name: "Analisi I", department: ""), answers: [Answer (profile: Student(name: "Mike", surname: "Gray", username: "MGray12", nameImage: "Profile 3"), body: "Check on the professor website or in the old questions",like: 8, dislike: 1, ACounter: 0, date: Date(timeIntervalSinceReferenceDate: 691900000), index: 0), Answer(profile: Student(name: "Kyle", surname: "Thompson", username: "KTom90", nameImage: "Profile 2"), body: "The professor changes the type of exams every semester. I can't tell you if it's useful or not to go and check the old ones in this case. I hope I was helpful", like: 3, dislike: 1, ACounter: 0, date: Date(timeIntervalSinceReferenceDate: 691900000), index: 1), Answer(profile: Student(name: "Roby", surname: "Rodriguez", username: "Roby15R", nameImage: "Profile 2"), body: "I'm crying for the same reason as you", like: 4, dislike: 1, ACounter: 0, date: Date(timeIntervalSinceReferenceDate: 691900000), index: 2)], ACounter: 0, date: Date(timeIntervalSinceReferenceDate: 691700000), index: 1), Question(title: "Do you know if this exercise is correct?", profile: Student(name: "Kyle", surname: "Thompson", username: "KTom90", nameImage: "Profile 2"), body: "Guys i am dumb, i don't know how to solve this exercise, i tried online but i think...", tag: Subject(name: "Analisi I", department: ""), answers: [Answer (profile: Student(name: "Jason", surname: "Momoa", username: "Aquaman", nameImage: "Profile 1"), body: "Check on the professor website or in the old questions",like: 8, dislike: 1, ACounter: 0, date: Date(timeIntervalSinceReferenceDate: 691900000), index: 0), Answer(profile: Student(name: "Kyle", surname: "Thompson", username: "KTom90", nameImage: "Profile 2"), body: "The professor changes the type of exams every semester. I can't tell you if it's useful or not to go and check the old ones in this case. I hope I was helpful", like: 3, dislike: 1, ACounter: 0, date: Date(timeIntervalSinceReferenceDate: 691900000), index: 1)], ACounter: 0, date: Date(timeIntervalSinceReferenceDate: 691700000), index: 2)]
    
    
    @Published var subjects = [
        Subject (name: "Analisi I", department: "Ingegneria Informatica" ),
        Subject (name: "Fisica II",department: "Ingegneria Informatica" ),
        Subject (name: "Geometria ed Algebra",department: "Ingegneria Informatica"),
        Subject (name: "Analisi II",department: "Ingegneria Informatica" )
    ]
}

var sharedData = SharedData()
