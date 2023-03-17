//
//  LoginView.swift
//  Healthy Anteater
//
//  Created by JacEL on 3/5/23.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State var username: String = ""
    @State var password: String = ""
    @State var isLogged = false
    @State var isSignUp = false
    @State private var showErrorMessage = false
    @State private var registerSuccess = false
    var body: some View{
        if isLogged{
            MainView()
                .environmentObject(HealthKitViewModel())
        }
        else if isSignUp{
            initWeight()
        }
        else{
            content
        }
    }
    
    var content: some View {
        NavigationView{
            VStack(alignment: .center, spacing: 28) {
                InfoText().padding(.top, 44)
                VStack(alignment: .leading, spacing: 11) {
                    Text("Login")
                        .font(.system(size: 13, weight: .light))
                        .foregroundColor(.secondary)
                        .frame(height: 15, alignment: .leading)
                    
                    TextField("", text: $username)
                        .font(.system(size: 17, weight: .thin))
                        .foregroundColor(.primary)
                        .frame(height: 44)
                        .padding(.horizontal, 12)
                        .background(Color.white)
                        .cornerRadius(4.0)
                }
                
                VStack(alignment: .leading, spacing: 11) {
                    Text("Password")
                        .font(.system(size: 13, weight: .light))
                        .foregroundColor(.secondary)
                        .frame(height: 15, alignment: .leading)
                    
                    SecureField("", text: $password)
                        .font(.system(size: 17, weight: .thin))
                        .foregroundColor(.primary)
                        .frame(height: 44)
                        .padding(.horizontal, 12)
                        .background(Color.white)
                        .cornerRadius(4.0)
                }
                Button{
                    // sign up
                    if (Manager.checkLogin(email: username, password: password)){
                        register()
                    }
                    else{
                        showErrorMessage = true
                    }
                }label:{
                    Text("If you don't have an account, Click here to Sign up!")
                        .bold()
                        .font(.system(size: 14, weight: .light))
                }
                /*
                Spacer()
                NavigationLink(destination: initFoodRecording().navigationBarBackButtonHidden(true), label:{
                    Text("Login")
                })
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .onSubmit {
                    debugPrint("Login Button Tapped!")
                }
                */
                Spacer()
                Button("Login") {
                    if (Manager.checkLogin(email: username, password: password)){
                        login()
                    }
                    else{
                        showErrorMessage = true
                    }
                }
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .buttonStyle(.borderedProminent)
                    .controlSize(.large)
            }
            .padding()
            .background(.secondary.opacity(0.1))
            
        }
        .padding(.horizontal, 35.0)
        .alert(isPresented: $showErrorMessage){
                () -> Alert in
                Alert(title: Text("Invalid Data. Please check!"))
        }
        .alert(isPresented: $registerSuccess){
                () -> Alert in
                Alert(title: Text("Successfully registered"))
        }
        
    }
    
    func register(){
        // input the email and password combination into the databse
        Task {
            if await sendRegister(username: username, password: password) {
                // true
                registerSuccess = true
                isSignUp = true
            } else {
                showErrorMessage = true
            }
        }
    }
    
    func login(){
        // check for login and get userid from the database
        Task {
            if await sendLogin(username: username, password: password) {
                isLogged = true
            } else {
                showErrorMessage = true
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct InfoText: View {
    var body: some View {
        Text("Enter your login and password")
            .font(.system(size: 16, weight: .light))
            .foregroundColor(.primary)
    }
}
