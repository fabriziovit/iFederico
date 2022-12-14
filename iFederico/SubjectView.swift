//
//  SubjectCategorView.swift
//  iFederico
//
//  Created by Fabrizio Vitale on 13/12/22.
//

//
//  SubjectCategoryView.swift
//  iFederico
//
//  Created by Alessandro Esposito Vulgo Gigante on 13/12/22.
//

import SwiftUI

struct SubjectView: View {
    @ObservedObject var myData = sharedData
    @State private var searchText = ""
    @State var tag = Subject(name: "", department: "")
    @State private var isShowingAddQuestionView: Bool = false
    @Binding var isPostedQuestion: Bool
    
    var body: some View {
        NavigationStack{
            ScrollView{
                NavigationLink(destination: AddQuestionView(tag: Subject(name: "Analisi 1", department: ""),isShowingAddQuestionView: $isShowingAddQuestionView), isActive: $isShowingAddQuestionView) {
                }
                ForEach(myData.questions) {question in
                    NavigationLink(destination: QuestionView(question: question)) {
                        ZStack(alignment: .center) {
                            
                            Rectangle()
                                .fill(.white)
                                .frame(width: 362, height: 190)
                                .cornerRadius(20)
                            VStack(alignment: .leading, spacing: 5) {
                                HStack {
                                    Text (question.profile.username)
                                        .font(.system(size: 17, weight: .bold, design: .default))
                                    
                                    Text (question.status)
                                    Text(" - ")
                                    +
                                    Text(question.date.formatted(.dateTime.day().month().year()))
                                } .foregroundColor(.black)
                                Text(question.title)
                                    .font(.system(size: 24, weight: .bold, design: .default)).multilineTextAlignment(.leading)
                                Text(question.body)
                                    .lineLimit(2)
                                    .font(.system(size: 17,design: .default)).multilineTextAlignment(.leading)
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
                        }//ZStack
                        .onAppear(){
                            isPostedQuestion = false
                        }
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
                               isShowingAddQuestionView = true
                           } label: {
                               Text("New Post")
                           }
                       }
                   }
        }//NavigationStack
        
    }
}


struct SubjectCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        SubjectView(isPostedQuestion: Binding<Bool>.constant(true))
    }
}


