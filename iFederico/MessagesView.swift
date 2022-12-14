//
//  MessagesView.swift
//  iFederico
//
//  Created by Fabrizio Vitale on 08/12/22.
//

import SwiftUI

struct MessagesView: View {
    
    @ObservedObject var myData = sharedData
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                
                
                Text("No Message")
                    .font(.custom("SFPro", size: 25) )
                    .foregroundColor(.gray)
                    .position(x: 195, y:250)
                
                    .navigationTitle("Messages")
                    .searchable(text: $searchText)  
            }
        }
    }
}

struct MessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesView()
    }
}
