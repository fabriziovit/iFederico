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
    @State var isLoginAnimationRunning = true
    var body: some Scene {
        WindowGroup {
            ZStack{
                LoginView( isAnimationRunning: $isLoginAnimationRunning)
                if isLoginAnimationRunning{
                    LaunchScreenView()
                }
            }.environmentObject(launchScreenManager)
        }
    }
}
