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
            Button {
                debugPrint("Login Button Tapped!")
            } label: {
                Text("Login")
                    .foregroundColor(.white)
                    .font(.system(size: 18))
                    .frame(width: 215, height: 44, alignment: .center)
            }
            .background(.blue)
            .cornerRadius(4)
            .padding(.top, 36)
        }
        .padding()
        .background(.secondary.opacity(0.1))
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
