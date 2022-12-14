//
//  AddAnswerView.swift
//  iFede
//
//  Created by Carmine Franzese on 11/12/22.
//

import SwiftUI

struct AddAnswerView: View {
    @State var myData = sharedData
    @State var question: Question
    @State var profile: Student = Student (name: "Walter", surname: "White", username: "WWhite", department: "Mechatronic Engineering",description: "This is my Bio, welcome to my profile. I’m a mechatronic engineering student of Federico II- Say my Name!", nameImage: "Profilo")
    @State private var answer: String = "Write your answer..."
    //    @Binding var isAnswerViewPresented: Bool
    @State private var isAnswerPosted: Bool = false
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        //NavigationLink(destination: QuestionView(question: question), isActive: $isAnswerViewPresented){}
        NavigationStack{
            //          NavigationLink(destination: QuestionView(question: question), isActive: $isAnswerViewPresented){}
            ScrollView{
                Divider().padding(.bottom, 10)
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
                        TextEditor(text: $answer).padding(.all).opacity(answer == "Write your answer..." ? 0.25 : 1).onTapGesture {
                            if answer == "Write your answer..."{
                                answer = ""
                            }
                        }.padding(.horizontal, 12)
                        //TextField("Write a Question...", text: $domanda)
                        //.position(x: 196, y: 25)
                        //.padding()
                    }
                }.onAppear(){
                    //                    isAnswerViewPresented = false
                }
            }
            .background(Color(UIColor(named: "ScreenColor")!))
            .navigationTitle("New Answer")
            .toolbar{
                ToolbarItem{
                    Button{
                        //bottone per chiudere tastiera
                        addAnswer(question: question, body: answer, profile: profile)
                        dismiss()
                        //isAnswerViewPresented = true
                    } label: {
                        Text("Reply")
                    }
                }
            }
        }
    }
    
    func addAnswer(question: Question, body: String, profile: Student){
        var index: Int = 0
        let newAnswer = Answer(profile: profile, body: body, like: 0, dislike: 0, ACounter: 0, date: Date())
        myData.questions.forEach{questionInd in
            if questionInd.id == question.id{
                sharedData.questions[index].answers.append(newAnswer)
            }
            index = index + 1
        }
    }
}

struct AddAnswerView_Previews: PreviewProvider {
    static var previews: some View {
        //        AddAnswerView(question: sharedData.questions[0], isAnswerViewPresented: Binding<Bool>.constant(true))
        AddAnswerView(question: sharedData.questions[0])
    }
}
