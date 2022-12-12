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
            return (myData.questions.filter { question in
                (question.title.lowercased().contains(searchText.lowercased()) || question.tag.lowercased().contains(searchText.lowercased()) || question.userName.lowercased().contains(searchText.lowercased()) || question.body.lowercased().contains(searchText.lowercased()))
            },myData.subjects.filter{ subject in
                (subject.name.lowercased().contains(searchText.lowercased()))
            })
        }
        set {
            myData.questions = newValue.0
            myData.subjects = newValue.1
        }
    }
    
    /*var filteredQuestion: ([Question], [Subject]) {
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
    }*/
    
    var body: some View {
        NavigationStack{
            ScrollView{
                Divider()
                HStack {
                    Text("About your courses")
                        .position(x:100,y:10)
                        .bold()
                    
                }
                
                ForEach(filteredQuestion.1) {subject in
                    
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .fill(.white)
                        //.opacity(0.2)
                        
                            .frame(height: 50)
                        VStack(alignment: .leading) {
                            HStack {
                                Text (subject.name)
                                    .bold()
                            }
                        }
                    }
                }
                
                ForEach(filteredQuestion.0) {question in
                    
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .fill(.white)
                        //.opacity(0.2)
                        
                            .frame(height: 200)
                        
                        
                        VStack(alignment: .leading) {
                            HStack {
                                Text (question.userName)
                                    .bold()
                                Text (question.status)
                                Text(" - ")
                                +
                                Text(question.date, style: .date)
                                
                                
                            } .foregroundColor(.black)
                            Text(question.title)
                                .font(.title)
                                .bold()
                            
                            Text(question.body)
                                .lineLimit(2)
                            Divider()
                            
                            HStack {
                                Image(systemName: "paperclip.circle")
                                    .foregroundColor(Color(UIColor(named: "AppBlu")!))
                                    .font(.custom("SFPro" , size: 30))
                                Text("0")
                                +
                                Text("  ")
                                
                                Image(systemName: "message.circle")
                                    .foregroundColor(Color(UIColor(named: "AppBlu")!))
                                    .font(.custom("SFPro" , size: 30))
                                
                                Text("0")
                            }
                        } .foregroundColor(.black)
                            .padding(.horizontal)
                    }
                    .foregroundColor(.white)
                }
            }
            .background(Color(UIColor(named: "ScreenColor")!))
            .searchable(text: $searchText)
            .navigationTitle("Study Space")
        }
    }
}

struct GeneralView_Previews: PreviewProvider {
    static var previews: some View {
        GeneralView()
    }
}
