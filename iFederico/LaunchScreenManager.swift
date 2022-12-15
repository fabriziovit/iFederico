//
//  LaunchScreenManager.swift
//  iFederico
//
//  Created by Fabrizio Vitale on 15/12/22.
//

import SwiftUI
import Foundation

enum LaunchScreenPhase{
    case first
    case second
    case completed
}

final class LaunchScreenManager: ObservableObject{
    @Published private(set) var state: LaunchScreenPhase = .first
    
    func dismiss(){
        self.state = .second
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            self.state = .completed
        }
    }
}
