//
//  ProfileView.swift
//  OurApp
//
//  Created by Giuseppe Arena on 12/12/22.
//

import SwiftUI
struct ProfileView: View {
    
    @ObservedObject var myData = sharableData
    var student: Student = sharableData.students[0]
    
    var body: some View {
        NavigationStack{
            ZStack{
                VStack{
                    Text("Profile")
                        .font(.title)
                        .bold()
                    Image(student.imagename)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width:280, height:280)
                        .clipShape(Circle())
                        .shadow(radius:10)
                        .padding()
                    
                    HStack{
                        Text(student.nome)
                            .font(.title)
                            .bold()
                        +
                        Text(" ")
                        +
                        Text(student.cognome)
                            .font(.title)
                            .bold()
                    }
                    .foregroundColor(.blue)
                    Text(student.department)
                        .bold()
                    Text(student.descrizione)
                        .padding()
                }
            }
              .padding()
               Spacer()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(student: sharableData.students[0])
    }
}
