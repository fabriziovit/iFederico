//
//  loginPage.swift
//  forum
//
//  Created by adriano prota on 08/12/22.
//

import SwiftUI
let LightGray = Color(red: 239.0/255.0, green: 243.0/255.0,blue: 244.0/255.0, opacity: 64.0)
let OurBlue = Color(red: 25/255 ,green: 122/255 ,blue: 164/255 , opacity: 1.0)
let Sfondo = Color(red: 236/255, green: 236/255, blue: 236/255 , opacity: 0.85)


struct LoginView: View {
    
    @State var loginame : String = ""
    @State var password : String = ""
    @State var authenticationFail: Bool = false
    @State var authenticationSucced: Bool = true
    @State var moveToNewView = false
    
    var body: some View {
        ZStack{
            Sfondo
                .ignoresSafeArea()
            VStack{
                
                //NavigationLink(destination: , isActive: $moveToNewView, label: {
                
                //})
                Text("iFederico")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding(.vertical,5)
                
                UsernameTextField(username: $loginame)
                    .padding(.vertical, 20)
                PasswordSecureField(password: $password)
                
                
                
                
                Button(action: {LoginButton()})
                {
                    Text("LOGIN")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 220, height: 60)
                        .background(OurBlue)
                        .cornerRadius(10.0)
                    
                }.padding(.vertical,30)
                
                
                if authenticationFail {
                    Text("Username of password not correct. Try again.")
                        .offset(y: -10)
                        .foregroundColor(.red)
                }
                
                
                
            }
            
        }
    }
    
    struct PasswordSecureField : View {
        @Binding var password: String
        var body: some View {
            return SecureField("Password", text: $password)
                .padding()
                .background(.white)
                .cornerRadius(10.0)
                .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
            
        }
    }
    struct UsernameTextField : View {
        @Binding var username: String
        var body: some View {
            return TextField("Username", text: $username)
                .padding()
                .background(.white)
                .cornerRadius(10.0)
                .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15))
            
        }
    }
    func LoginButton(){
        if loginame == "WWhite" && password == "12345"{
            moveToNewView = true
        }else{
            authenticationFail = true
        }
        
        
    }
    
}
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


