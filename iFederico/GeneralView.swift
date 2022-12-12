//
//  GeneralView.swift
//  iFederico
//
//  Created by Fabrizio Vitale on 08/12/22.
//

import SwiftUI

struct GeneralView: View {
    @State private var searchText = ""
    @ObservedObject var myData = sharedData
    
    var body: some View {
        NavigationStack{
            ScrollView{
                Divider()
                HStack {
                    Text("About your courses")
                        .position(x:100,y:10)
                        .bold()
                    
                }
                
                
                
                
                ForEach(myData.questions) {question in
                    
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .fill(.white)
                        //.opacity(0.2)
                        
                            .frame(height: 200)

                        
                        VStack(alignment: .leading) {
                            HStack {
                                Text (question.userName)
                                    .bold()
                                Text (question.status)
                                Text(" - ")
                                +
                                Text(question.date, style: .date)
                                
                                
                            } .foregroundColor(.black)
                            Text(question.title)
                                .font(.title)
                                .bold()
                            
                            Text(question.body)
                                .lineLimit(2)
                            Divider()
                            
                            HStack {
                                Image(systemName: "paperclip.circle")
                                    .foregroundColor(Color(UIColor(named: "AppBlu")!))
                                    .font(.title)
                                Text("0")
                                +
                                Text("  ")
                                
                                Image(systemName: "message.circle")
                                    .foregroundColor(Color(UIColor(named: "AppBlu")!))
                                    .font(.title)
                                Text("0")
                            }
                            
                            
                        } .foregroundColor(.black)
                            .padding(.horizontal)
                        
                        
                        
                    }
                    .foregroundColor(.white)
                        
                    
                    
                }
                
                
                
                
            }
            .background(Color(UIColor(named: "ScreenColor")!))
            .searchable(text: $searchText)
            .navigationTitle("Study Space")
            
            
            
            
            
            
            
        }
        
        
    }
    
}

struct GeneralView_Previews: PreviewProvider {
    static var previews: some View {
        GeneralView()
    }
}
