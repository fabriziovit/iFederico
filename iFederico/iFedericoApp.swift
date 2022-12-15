//
//  iFedericoApp.swift
//  iFederico
//
//  Created by Fabrizio Vitale on 07/12/22.
//

import SwiftUI

@main
struct iFedericoApp: App {
    @StateObject var launchScreenManager = LaunchScreenManager()
    
    var body: some Scene {
        WindowGroup {
            ZStack{
                LoginView()
                
                if launchScreenManager.state != .completed{
                    LaunchScreenView()
                }
            }.environmentObject(launchScreenManager)
        }
    }
}
