//
//  LoginView.swift
//  Healthy Anteater
//
//  Created by JacEL on 3/5/23.
//

import SwiftUI

struct LoginView: View {
    @State var username: String = ""
    @State var password: String = ""
    var body: some View {
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
                Text("You will automatically register if you haven't yet")
                    .font(.system(size: 14, weight: .light))
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
            }
            .padding()
            .background(.secondary.opacity(0.1))
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
