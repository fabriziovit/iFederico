//
//  AddQuestionView.swift
//  iFede
//
//  Created by Carmine Franzese on 11/12/22.
//

import SwiftUI

struct AddQuestionView: View {
    @ObservedObject var myData = sharedData
    //@State var index: Int
    @State var title: String = ""
    @State private var question: String = "Write your question..."
    @State var tag: Subject = Subject(name: "", department: "")
    @State private var isPostedQuestion: Bool = false
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack{
            NavigationLink(destination: SubjectView(tag: tag), isActive: $isPostedQuestion) {
            }
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
                        TextField("Title...", text: $title)
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
                        TextEditor(text: $question).padding(.all).opacity(question == "Write your question..." ? 0.25 : 1).onTapGesture {
                            if question == "Write your question..."{
                                question = ""
                            }
                        }.padding(.horizontal, 12)
                    }
                }
            }
            .background(Color(UIColor(named: "ScreenColor")!))
            .navigationTitle("New Question")
            .toolbar{
                ToolbarItem{
                    Button{
                        addQuestion(title: title, profile: Student(name: "Walter", surname: "White", username: "WWhite"), body: question, tag: tag, answers: [], ACounter: 0, AnswerCounter: 0)
                        dismiss()
                    } label: {
                        Text("Post")
                    }
                }
            }
        }
    }
    
    func addQuestion(title: String, profile : Student, body : String, tag : Subject, answers : [Answer], ACounter : Int, AnswerCounter : Int){
        let newQuestion = Question(title: title, profile: profile, body: body, tag: tag, answers: [], ACounter: 0, date: Date(), index: myData.questions.count)
        
        myData.questions.append(newQuestion)
    }
}

struct AddQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        AddQuestionView(tag: Subject(name: "Analisi I", department: ""))
    }
}
