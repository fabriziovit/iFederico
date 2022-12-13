//
//  AddAnswerView.swift
//  iFede
//
//  Created by Carmine Franzese on 11/12/22.
//

import SwiftUI

struct AddAnswerView: View {
    //@State var domanda: String = ""
    @State private var risposta: String = "Write your answer..."
    
    
    var body: some View {
        NavigationStack{
            ScrollView{
                Divider()
                                .padding(.bottom, 10)
                Text("Answer")
                    .position(x: 58, y: 15)
                    .bold()
                    .font(.custom("SFPro", size: 20))
                    .padding(.vertical, 5)
                
                ZStack(alignment: .leading) {
                    Rectangle()
                        .fill(.white)
                        .frame(height: 580)
                        .cornerRadius(10)
                        .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
                        .shadow(radius: 1)
                    VStack(alignment: .leading){
                        TextEditor(text: $risposta).padding(.all).opacity(risposta == "Write your answer..." ? 0.25 : 1).onTapGesture {
                            if risposta == "Write your answer..."{
                                risposta = ""
                            }
                        }.padding(.horizontal, 12)
                        //TextField("Write a Question...", text: $domanda)
                        //.position(x: 196, y: 25)
                        //.padding()
                    }
                }
            }
            .background(Color(UIColor(named: "ScreenColor")!))
            .navigationTitle("New Answer")
            .toolbar{
                ToolbarItem{
                    Button{
                        //bottone per chiudere tastiera
                    } label: {
                        Text("Reply")
                    }
                }
            }
        }
    }
}

struct AddAnswerView_Previews: PreviewProvider {
    static var previews: some View {
        AddAnswerView()
    }
}
