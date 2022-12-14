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
    
    var filteredQuestion: ([Question], [Subject]) {
        get {
            if searchText.isEmpty { return (myData.questions, []) }
            return ([],myData.subjects.filter{ subject in
                (subject.name.lowercased().contains(searchText.lowercased()))
            })
        }
        set {
            //myData.questions = newValue.0
            myData.subjects = newValue.1
        }
    }
    
    var body: some View {
        NavigationStack{
            ScrollView{

                ForEach(filteredQuestion.1) {subject in
                    
                    NavigationLink(destination: SubjectView(isPostedQuestion: Binding<Bool>.constant(false))) {
                        
                        ZStack(alignment: .leading) {
                            Rectangle()
                                .fill(.white)
                            .opacity(0.10)
                                .frame(height: 50)
                                .cornerRadius(20)
                            VStack(alignment: .leading) {
                                HStack {
                                    Text (subject.name)
                                        .bold()
                                        .foregroundColor(Color(UIColor(named: "AppBlu")!))
                                        .padding()
                                }
                            }
                        }
                    }
                    
                }
                ForEach(filteredQuestion.0) {question in
                    NavigationLink(destination: QuestionView(question: question)) {
                        ZStack(alignment: .center) {
                            Rectangle()
                                .fill(.white)
                                .frame(width: 362, height: 190)
                                .cornerRadius(20)
                                VStack(alignment: .leading, spacing: 5) {
                                    // line 1
                                    HStack {
                                        Text (question.profile.username)
                                            .font(.system(size: 17, weight: .bold, design: .default))
                                        Text (question.status)
                                        Text(" - ")
                                        +
                                        Text(question.date.formatted(.dateTime.day().month().year()))
                                    } .foregroundColor(.black)
                                    
                                    Text(question.title)
                                        .font(.system(size: 24, weight: .bold, design: .default))
                                        .multilineTextAlignment(.leading)
                                    
                                    Text(question.body)
                                        .lineLimit(2)
                                        .font(.system(size: 17,design: .default))
                                        .multilineTextAlignment(.leading)
                                    Divider()
                                    
                                    HStack {
                                        Image(systemName: "paperclip")
                                            .foregroundColor(Color(UIColor(named: "AppBlu")!))
                                            .font(.custom("SFPro", size: 18))
                                        Text(String(question.ACounter))
                                        +
                                        Text("  ")
                                        
                                        Image(systemName: "message")
                                            .foregroundColor(Color(UIColor(named: "AppBlu")!))
                                            .font(.custom("SFPro", size: 18))
                                        Text(String(question.answers.count))
                                    }
                            } .foregroundColor(.black)
                                .padding(EdgeInsets(top: 0, leading: 30, bottom: 0, trailing: 20))
                        }
                    }//navigation destination
                }
            }
            .background(Color(UIColor(named: "ScreenColor")!))
            .searchable(text: $searchText, prompt: "Search by courses...")
            .navigationTitle("Study Space")
            
        }
    }
    
}
struct GeneralView_Previews: PreviewProvider {
    static var previews: some View {
        GeneralView()
    }
}
