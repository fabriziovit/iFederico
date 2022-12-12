//
//  SubjectData.swift
//  OurApp
//
//  Created by Giuseppe Arena on 09/12/22.
//

import Foundation
import SwiftUI


class sharedDataSubject: ObservableObject {        //this class is available in other views
    
    @Published var subjects = [
        Subject (name: "Analisi I", department: "Ingegneria Informatica" ),
        Subject (name: "Fisica II",department: "Ingegneria Informatica" ),
        Subject (name: "Geometria ed Algebra",department: "Ingegneria Informatica"),
        Subject (name: "Analisi II",department: "Ingegneria Informatica" )
    ]
}

var sharedSubject = sharedDataSubject()

//L'array di subjects è composto da sole materie di ingegneria informatica per l'esempio da fare in fase di presentazione dove homepage e forum mostreranno stessi risultati per uno user di ingegneria informatica. Tramite una funzione si aggiungono se vogliamo altre materie di altri department come fatto per learners.
