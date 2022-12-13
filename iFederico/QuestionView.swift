//
//  QuestionView.swift
//  iFederico
//
//  Created by Aurora Cepparulo on 12/12/22.
//

import SwiftUI

struct QuestionView: View {
    
    @ObservedObject var myData = sharedData
    
    @State var newAnswer : String = ""
    
    var body: some View {
        
        VStack{
            
            ScrollView {
                
                VStack(alignment: .leading) {
                    
                    HStack {
                        Text(myData.questions[0].userName)
                            .bold()
                            .foregroundColor(Color("AppBlu"))
                        Spacer()
                        
                        Text(myData.questions[0].status)
                            .italic()
                        
                        Text("- ")
                        Text(myData.questions[0].date.formatted(.dateTime.day().month().year()) )
                            .font(.custom("SFPro", size: 15))
                    }
                    
                    Text("")
                    Text(myData.questions[0].title)
                        .bold()
                        .font(.title)
                    
                    Text(myData.questions[0].body)
                    Divider()
                    
                    HStack {
                        Spacer()
                        Image(systemName: "message")
                        Text("\(myData.questions[0].AnswerCounter)" + "   ")
                        
                        Image(systemName: "square.and.arrow.down")
                        Text("Save")
                    }
                    .foregroundColor(Color("AppBlu"))
                    
                    
                } // vstack
                
                .padding(.horizontal, 40)
                .padding([.top, .bottom], 20)
                .background(.white)
                
                
                Text("")
                Text("")
                
                //Risposte
                
                ForEach(myData.questions[0].answers) { answer in
                    
                    
                    VStack(alignment: .leading) {
                        
                        HStack {
                            Text(answer.nickname)
                                .bold()
                                .foregroundColor(Color("AppBlu"))
                            
                            Spacer()
                            
                        } // Hstack
                        Text("")
                        Text(answer.body)
                            .bold()
                        Text("")
                        Divider()
                        
                        HStack {
                            Text(answer.date.formatted(.dateTime.day().month().year()) )
                                .font(.custom("SFPro", size: 15))
                                .foregroundColor(.black)
                            
                            Spacer()
                            Image(systemName: "arrowshape.turn.up.left")
                            Text ("Reply" + "   ")
                            
                            Image(systemName: "arrowshape.backward")
                                .rotationEffect(.degrees(90))
                             
                            Text("\(answer.like)" + " ")
                            Image(systemName: "arrowshape.backward")
                                .rotationEffect(.degrees(270))
                            Text("\(answer.dislike)")
                            
                        }
                        .foregroundColor(Color("AppBlu"))
                        
                    } // vstack
                    .padding(.horizontal, 40) // distanzia i margini
                    .padding([.top, .bottom],20)
                    .background(.white)
                    
                } //foreach
            }
            Section {
                
                TextField("Write your answer...", text: $newAnswer)
            } //section
            .padding()
            .frame(width: 350)
            .background(.white)
            .cornerRadius(80)
            
            
        } //vstack
        .background(Color("ScreenColor"))
        
    }//body
}//view

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
    }
}

