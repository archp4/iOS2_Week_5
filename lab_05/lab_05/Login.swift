//
//  Login.swift
//  lab_05
//
//  Created by Arch Umeshbhai Patel on 2025-06-06.
//

import SwiftUI

struct Login: View {
    
    @Binding var authFlow: AuthFlow
    @EnvironmentObject var patient : Patient
    
    @State private var email : String = "patient@mail.com"
    @State private var name : String = "Demo Patient"

    
    var body: some View {
        NavigationStack{
            Form{
                Section("Email"){
                    TextField("Enter Email", text: $email)
                }
                Section("Name"){
                    TextField("Enter Name", text: $name)
                }
                HStack{
                    Button("Login"){
                        if (!email.isEmpty && !name.isEmpty)
                        {
                            authFlow = .home
                            patient.email = email
                            patient.name = name
                            patient.allergies = "Eggs"
                            patient.history = "Default History"
                            authFlow = .home
                        }
                        
                    }
                }
                Button("Create an Account"){
                    authFlow = .signUp
                }
                
            }
            .navigationTitle("Sign In Account")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

#Preview {
    Login(authFlow: .constant(.signIn))
}
