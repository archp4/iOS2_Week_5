//
//  HomeScreen.swift
//  lab_05
//
//  Created by Arch Umeshbhai Patel on 2025-06-06.
//

import SwiftUI

struct HomeScreen: View {
    
    @Binding var authFlow: AuthFlow
    @EnvironmentObject var patient : Patient
    @State private var showProfile : Bool = false
    @State private var showRecord : Bool = false
    
    
    var body: some View {
        NavigationStack{
            Form{
                Section("Welcome \(patient.name),"){
                    HStack(){
                        Text("Email: ")
                        Spacer()
                        Text("\(patient.email)")
                    }
                }
                Section("Medical History"){
                    Text("\(patient.history)")
                }
                Section("Allergies"){
                    VStack{
                        Text("\(patient.allergies)")
                    }
                }
            }
            .navigationDestination(isPresented: $showRecord) {
                Records().environmentObject(patient)
            }
            .navigationDestination(isPresented: $showProfile) {
                Profile().environmentObject(patient)
            }
            .navigationTitle("Dashboard")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    Menu{
                        Button("Profile"){
                            showProfile = true
                        }
                        Button("Records"){
                            showRecord = true
                        }
                        Button("Logout"){
                            authFlow = .signIn
                        }
                    }label: {
                        Image(systemName: "gear")
                    }
                    
                }
            }
        }

    }
}

#Preview {
    HomeScreen(authFlow: .constant(.home)).environmentObject(Patient())
}
