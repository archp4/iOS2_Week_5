//
//  Records.swift
//  lab_05
//
//  Created by Arch Umeshbhai Patel on 2025-06-06.
//

import SwiftUI

struct Records: View {
    @EnvironmentObject var patient : Patient
    
    @State private var history : String = "medical history"
    @State private var allergies : String = "allergie"
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
    
        NavigationStack{
            Form{
                Section("Enter History"){
                    TextField("Enter Medical History: ", text: $history)
                }
                Section("Enter Allergies"){
                    TextField("Enter Allergies: ", text: $allergies)
                }
                Button("Update"){
                    if (!history.isEmpty && !allergies.isEmpty)
                    {
                        patient.allergies = allergies
                        patient.history = history
                        dismiss()
                    }
                }
                
            }
            .navigationTitle("Records")
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear(){
            history = patient.history
            allergies = patient.allergies
        }
    }
}


#Preview {
    Records().environmentObject(Patient())
}
