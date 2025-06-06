//
//  Profile.swift
//  lab_05
//
//  Created by Arch Umeshbhai Patel on 2025-06-06.
//

import SwiftUI

struct Profile: View {
    @EnvironmentObject var patient : Patient
    
    @State private var email : String = "patient@mail.com"
    @State private var name : String = "Demo Patient"
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
    
        NavigationStack{
            Form{
                Section("Enter Email"){
                    TextField("Enter Email: ", text: $email)
                }
                Section("Enter Name"){
                    TextField("Enter Name: ", text: $name)
                }
                Button("Update"){
                    if (!email.isEmpty && !name.isEmpty)
                    {
                        patient.email = email
                        patient.name = name
                        dismiss()
                    }
                }
                
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear(){
            email = patient.email
            name = patient.name
        }
    }
}

#Preview {
    Profile().environmentObject(Patient())
}
