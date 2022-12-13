//
//  SubjectCategoryView.swift
//  iFederico
//
//  Created by Alessandro Esposito Vulgo Gigante on 13/12/22.
//

import SwiftUI

struct SubjectCategoryView: View {
    @State private var searchText = ""
    @ObservedObject var myData = sharedData
    
    var body: some View {
        NavigationStack{
            ScrollView{
                
                ForEach(myData.questions) {question in
                    
                    ZStack(alignment: .center) {
                        
                            Rectangle()
                                .fill(.white)
                            //.opacity(0.10)
                            //.frame(height: 200)
                                .frame(width: 362, height: 190)
                                .cornerRadius(20)
                        
                        
                        
                        VStack(alignment: .leading, spacing: 5) {
                            HStack {
                                Text (question.userName)
                                    .font(.system(size: 17, weight: .bold, design: .default))
                                    
                                Text (question.status)
                                    
                                
                                Text(" - ")
                                +
                                Text(question.date.formatted(.dateTime.day().month().year()))
                                    
                                
                                
                            } .foregroundColor(.black)
                            
                            
                            
                            
                            Text(question.title)
                                .font(.system(size: 24, weight: .bold, design: .default))
                                
                                
                                
                                //.font(.title)
                                //.font(.custom("SFPro", size: 25))
                               // .bold()
                            
                            
                            
                            Text(question.body)
                                .lineLimit(2)
                                .font(.system(size: 17,design: .default))
                                
                            
                            Divider()
                              
                            
                            HStack {
                                
                                
                                Image(systemName: "paperclip")
                                    .foregroundColor(Color(UIColor(named: "AppBlu")!))
                                    .font(.custom("SFPro", size: 18))
                                Text("0")
                                +
                                Text("  ")
                                
                                Image(systemName: "message")
                                    .foregroundColor(Color(UIColor(named: "AppBlu")!))
                                    .font(.custom("SFPro", size: 18))
                                Text("0")
                            }
                            
                            
                        } .foregroundColor(.black)
                        
                            .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 20))
//                            .scenePadding(.horizontal)
                            
                        
                    }
                    
                    
                    
                }
                
                
            }
            .background(Color(UIColor(named: "ScreenColor")!))
            .searchable(text: $searchText, prompt: "Search by questions...")
            
            
            .navigationTitle("Questions")
            
            .toolbar {
                ToolbarItem(placement: .principal) {
                                HStack {
                                    Text("Analisi 1").font(.headline)
                                }
                            }
                
                ToolbarItem {
                    Button {
                        //test
                    } label: {
                        
                        
                        Text("New Post")
                    }
                }
            }
            
        }
    }
    
}

struct SubjectCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        SubjectCategoryView()
    }
}


