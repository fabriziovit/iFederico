//
//  ContentView.swift
//  iFederico
//
//  Created by Fabrizio Vitale on 07/12/22.
//

import SwiftUI

struct ContainerView: View {
    @State var profile: Student
    
    var body: some View {
        TabView{
            GeneralView()
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("General")
                }
            MessagesView()
                .tabItem {
                    Image(systemName: "ellipsis.message")
                    Text("Messages")
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Profile")
                }
        }
        .navigationBarBackButtonHidden()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContainerView( profile: sharableData.students[0])
    }
}
