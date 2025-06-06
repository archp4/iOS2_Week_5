//
//  ContentView.swift
//  lab_05
//
//  Created by Arch Umeshbhai Patel on 2025-06-06.
//

import SwiftUI

struct ContentView: View {
    @State var authFlow: AuthFlow =  .signIn
    @StateObject var patient : Patient = Patient()  
    var body: some View {
        
        switch authFlow {
        case .signIn:
            Login(authFlow: $authFlow).environmentObject(patient)
        case .signUp:
            SignUp(authFlow: $authFlow).environmentObject(patient)
        case .home:
            HomeScreen(authFlow: $authFlow).environmentObject(patient)
        }
    }
}

#Preview {
    ContentView()
}
