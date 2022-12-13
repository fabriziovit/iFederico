//
//  AddQuestionView.swift
//  iFede
//
//  Created by Carmine Franzese on 11/12/22.
//

import SwiftUI

struct AddQuestionView: View {
    
    @State var titolo: String = ""
    //@State var domanda: String = ""
    @State private var domanda: String = "Write your question..."
    
    
    var body: some View {
        NavigationStack{
            ScrollView{
                Divider()
                Text("Title")
                    .position(x: 33, y: 15)
                    .bold()
                    .font(.custom("SFPro", size: 20))
                    .padding(.vertical, 5)
                ZStack(alignment: .leading) {
                    Rectangle()
                        .fill(.white)
                        .frame(height: 50)
                        .cornerRadius(10)
                        .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
                        .shadow(radius: 1)
                    VStack(alignment: .leading){
                        TextField("Title...", text: $titolo)
                            .padding(.horizontal, 30)
                    }
                }
                .padding(.bottom, 10)
                Text("Question")
                    .position(x: 58, y: 15)
                    .bold()
                    .font(.custom("SFPro", size: 20))
                    .padding(.vertical, 5)
                
                ZStack(alignment: .leading) {
                    Rectangle()
                        .fill(.white)
                        .frame(height: 480)
                        .cornerRadius(10)
                        .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
                        .shadow(radius: 1)
                    VStack(alignment: .leading){
                        TextEditor(text: $domanda).padding(.all).opacity(domanda == "Write your question..." ? 0.25 : 1).onTapGesture {
                            if domanda == "Write your question..."{
                                domanda = ""
                            }
                        }.padding(.horizontal, 12)
                        //TextField("Write a Question...", text: $domanda)
                        //.position(x: 196, y: 25)
                        //.padding()
                    }
                }
            }
            .background(Color(UIColor(named: "ScreenColor")!))
            .navigationTitle("New Question")
            .toolbar{
                ToolbarItem{
                    Button{
                        //bottone per chiudere tastiera
                    } label: {
                        Text("Post")
                    }
                }
            }
        }
    }
}

struct AddQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        AddQuestionView()
    }
}
