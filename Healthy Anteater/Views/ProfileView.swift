//
//  ProfileView.swift
//  Healthy Anteater
//
//  Created by JacEL on 2/5/23.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var vm: HealthKitViewModel
    var body: some View {
        ZStack{
            Color(UIColor(red: 0.783, green: 0.906, blue: 0.958, alpha: 1))
            .edgesIgnoringSafeArea(.all)
            VStack(alignment: .center) {
                VStack(alignment: .leading) {
                    HStack(){
                        Image("undraw_Dog_walking_re_l61p")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .padding(20)
                        VStack{
                            Text("Your current completeness is:")
                                
                            
                            ZStack{
                                Circle().frame(width: 100, height:100).foregroundColor(Color(UIColor(red: 0.785, green: 0.762, blue: 0.851, alpha: 1)))
                                Text("20%")
                            }
                        }
                    }
                        
                    Text("Hi Evan, ")
                        .font(.title)
                        .fontWeight(.heavy)
                    Text("Let’s see how you doing so far.")
                        .font(.subheadline)
                        .fontWeight(.heavy)
                    Group{
                        Text("Step Count")
                            .font(.title)
                            .fontWeight(.heavy)
                            .padding(10)
                        if vm.isAuthorized {
                            // display step count
                            Text("Your today's step count is: ")
                            Text(vm.userStepCount)
                                .font(.title2)
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity, alignment: .center)
                                .padding(.top, 5)
                                
                        } else {
                            Text("Please Authorize Health!")
                                .font(.title3)
                            
                            Button {
                                vm.healthRequest()
                            } label: {
                                Text("Authorize HealthKit")
                                    .font(.headline)
                                    .foregroundColor(.white)
                            }
                            .frame(width: 200, height: 55)
                            .background(Color(.blue))
                            .cornerRadius(10)
                        }
                    }
                    Group{
                        Text("Food :")
                            .font(.title)
                            .fontWeight(.heavy)
                            .padding(10)
                        Text("Calorie intake summary and anaylsis")
                    }
                    Group{
                        Text("Today :")
                            .font(.title)
                            .fontWeight(.heavy)
                            .padding(10)
                        Text("List target calories")
                    }
                    
                }
                
                Spacer()

            }
            .padding(.horizontal, 35.0)
        }.onAppear {
            if (vm.isAuthorized) {
                vm.readStepsTakenToday()
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
