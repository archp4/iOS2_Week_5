//
//  SignUp.swift
//  lab_05
//
//  Created by Arch Umeshbhai Patel on 2025-06-06.
//

import SwiftUI

struct SignUp: View {
    
    @Binding var authFlow: AuthFlow
    @EnvironmentObject var patient : Patient
    
    @State private var email : String = "patient@mail.com"
    @State private var name : String = "Demo Patient"
    @State private var history : String = "medical history"
    @State private var allergies : String = "allergie"
    
    var body: some View {
    
        Form{
            Section("Enter Email"){
                TextField("Enter Email: ", text: $email)
                    .autocapitalization(.none)
            }
            Section("Enter Name"){
                TextField("Enter Name: ", text: $name)
            }
            Section("Enter History"){
                TextField("Enter Medical History: ", text: $history)
            }
            Section("Enter Allergies"){
                TextField("Enter Allergies: ", text: $allergies)
            }
            Button("Register"){
                if (!email.isEmpty && !name.isEmpty && !history.isEmpty && !allergies.isEmpty)
                {
                    authFlow = .home
                    patient.email = email
                    patient.name = name
                    patient.allergies = allergies
                    patient.history = history
                    authFlow = .home
                    
                }
            }
            
            Button("Already Account? Login"){
                authFlow = .signIn
            }
        }
        .navigationTitle("SignIn")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

#Preview {
    SignUp(authFlow: .constant(.signUp)).environmentObject(Patient())
}
