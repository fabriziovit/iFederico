//
//  QuestionView.swift
//  iFederico
//
//  Created by Aurora Cepparulo on 12/12/22.
//


import SwiftUI

struct QuestionView: View {
    @State var question: Question
    @ObservedObject var myData = sharedData
    @State var newAnswer : String = ""
    
    var body: some View {
        VStack{
            ScrollView {
                ZStack(alignment: .center){
                    
                    Rectangle()
                        .fill(.white)
                    //.opacity(0.10)
                        .frame(height: 200)
                        .cornerRadius(20)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        HStack {
                            Image(question.profile.nameImage)
                                .resizable()
                                .frame(width: 20, height: 20)
                                .clipShape(Circle())
                                .shadow(radius: 10)
                            
                            Text(question.profile.username)
                                .font(.system(size: 17, weight: .bold, design: .default))
                            Spacer()
                            Text(question.status)
                            Text("-")
                            Text(question.date.formatted(.dateTime.day().month().year()) )
                        }
                        
                        Text(question.title)
                            .font(.system(size: 24, weight: .bold, design: .default))
                        
                        Text(question.body)
                            .font(.system(size: 17,design: .default))
                        Divider()
                        
                        HStack {
                            Spacer()
                            Image(systemName: "message")
                                .font(.custom("SFPro", size: 18))
                            Text("\(question.answers.count)" + "  ")
                                .foregroundColor(.black)
                            
                            Image(systemName: "square.and.arrow.down")
                                .font(.custom("SFPro", size: 18))
                            Text("Save")
                                .foregroundColor(.black)
                        }
                        .foregroundColor(Color("AppBlu"))
                        
                        
                    } // vstack
                    
                    
                    .padding(EdgeInsets(top: 10, leading: 30, bottom: 10, trailing: 28))
                    
                    
                }
                
                Text("")
                Text("")
                
                //Risposte
                
                ForEach(question.answers) { answer in
                    VStack(alignment: .leading) {
                        HStack {
                            Image(answer.profile.nameImage)
                                .resizable()
                                .frame(width: 20, height: 20)
                                .clipShape(Circle())
                            Text(answer.profile.username)
                                .font(.system(size: 17, weight: .bold, design: .default))
                                .foregroundColor(Color("AppBlu"))
                            Spacer()
                            
                        } // Hstack
                        Text("")
                        Text(answer.body)
                            .bold()
                        
                        Divider()
                        
                        HStack {
                            
                            Text(answer.date.formatted(.dateTime.day().month().year()) )
                                .font(.custom("SFPro", size: 15))
                                .foregroundColor(.black)
                            
                            Spacer()
                            Image(systemName: "arrowshape.turn.up.left")
                            Text ("Reply" + "   ")
                                .foregroundColor(.black)
                            
                            Image(systemName: "arrowshape.backward")
                                .rotationEffect(.degrees(90))
                            
                            Text("\(answer.like)" + " ")
                                .foregroundColor(.black)
                            Image(systemName: "arrowshape.backward")
                                .rotationEffect(.degrees(270))
                            Text("\(answer.dislike)")
                                .foregroundColor(.black)
                            
                        } //Hstack
                        
                        .foregroundColor(Color("AppBlu"))
                        
                    } // vstack
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 15, trailing: 10))//
                    .background(.white)
                    .cornerRadius(30)
                    .frame(width: 362)
                    
                } //foreach
            } // scrollview
            
            Section {
                
                TextField("Write your answer...", text: $newAnswer)
                    .padding()
                
            } //section
            .frame(width: 362)
            .background(.white)
            .cornerRadius(80)
            
            
        } //vstack
        .frame(width: 400)
        .background(Color("ScreenColor"))
        
    }//body
}//view

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(question: sharedData.questions[0])
    }
}

