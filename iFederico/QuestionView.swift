//
//  QuestionView.swift
//  iFederico
//
//  Created by Aurora Cepparulo on 12/12/22.
//


import SwiftUI

struct QuestionView: View {
    @State var index: Int
    @ObservedObject var myData = sharedData
    @State var newAnswer : String = ""
    @State var isAnswerViewPresented: Bool = false
    @State var isAnswerReplyPresented: Bool = false
    
    var body: some View {
        VStack{
            ScrollView {
                ZStack(alignment: .center){
                    
                    Rectangle()
                        .fill(.white)
                        .frame(height: 200)
                        .cornerRadius(20)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        HStack {
                            Image(myData.questions[index].profile.nameImage)
                                .resizable()
                                .frame(width: 20, height: 20)
                                .clipShape(Circle())
                                .shadow(radius: 10)
                            
                            Text(myData.questions[index].profile.username)
                                .font(.system(size: 17, weight: .bold, design: .default))
                            Spacer()
                            Text(myData.questions[index].status)
                            Text("-")
                            Text(myData.questions[index].date.formatted(.dateTime.day().month().year()) )
                        }
                        
                        Text(myData.questions[index].title)
                            .font(.system(size: 24, weight: .bold, design: .default))
                        
                        Text(myData.questions[index].body)
                            .font(.system(size: 17,design: .default))
                        Divider()
                        
                        HStack {
                            Spacer()
                            Image(systemName: "message")
                                .font(.custom("SFPro", size: 18))
                            Text("\(myData.questions[index].answers.count)" + "  ")
                                .foregroundColor(.black)
                            
//                            Image(systemName: "square.and.arrow.down")
//                                .font(.custom("SFPro", size: 18)).hidden()
//                            Text("Save")
//                                .foregroundColor(.black).hidden()
                        }
                        .foregroundColor(Color("AppBlu"))
                        
                        
                    } // vstack
                    .padding(EdgeInsets(top: 10, leading: 30, bottom: 10, trailing: 28))
                }
                
                Text("")
                Text("")
                
                //Risposte
                
                ForEach(myData.questions[index].answers) { answer in
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
                            Image(systemName: "arrowshape.turn.up.left").onTapGesture {
                                isAnswerReplyPresented = true
                            }
                            Text ("Reply" + "   ")
                                .foregroundColor(.black)
                            
                                .sheet(isPresented: $isAnswerReplyPresented) {
                                    AddAnswerView(index: index, answer: "@"+answer.profile.username)
                                }
                            
                            Image(systemName: "arrowshape.backward")
                                .rotationEffect(.degrees(90)).onTapGesture {
                                    //                                    answer.like = answer.like + 1
                                    
                                }
                            
                            
                            
                            Text("\(answer.like)" + " ")
                                .foregroundColor(.black)
                            Image(systemName: "arrowshape.backward")
                                .rotationEffect(.degrees(270)).onTapGesture {
                                    //                                    answer.dislike = answer.dislike + 1
                                }
                            Text("\(answer.dislike)")
                                .foregroundColor(.black)
                            
                        } //Hstack
                        .foregroundColor(Color("AppBlu"))
                    }// vstack
                    .padding(EdgeInsets(top: 10, leading: 10, bottom: 15, trailing: 10))//
                    .background(.white)
                    .cornerRadius(30)
                    .frame(width: 362)
                    
                } //foreach
            } // scrollview
            
            Section {
                TextField("Write your answer...", text: $newAnswer)
                    .padding().onTapGesture {
                        isAnswerViewPresented = true
                    }
                
            } //section
            .frame(width: 362)
            .background(.white)
            .cornerRadius(80)
            
            
        } //vstack
        .background(Color("ScreenColor"))
        .sheet(isPresented: $isAnswerViewPresented){
            AddAnswerView(index: index)
        }
    }//body
}//view

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(index: 0)
    }
}

