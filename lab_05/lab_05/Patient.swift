//
//  Patient.swift
//  lab_05
//
//  Created by Arch Umeshbhai Patel on 2025-06-06.
//

import Foundation

class Patient: ObservableObject, Identifiable {
    @Published var name: String
    @Published var history: String
    @Published var email : String
    @Published var allergies: String
    
    init(name: String, history: String, email: String, allergies: String) {
        self.name = name
        self.history = history
        self.email = email
        self.allergies = allergies
    }
    
    init() {
        self.name = "Demo"
        self.history = "Demo"
        self.email = "email"
        self.allergies = "allergies"
    }
    
}
