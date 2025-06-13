//
//  ProfileScreen.swift
//  week5_class
//
//  Created by Arch Umeshbhai Patel on 2025-06-06.
//

import SwiftUI
import PhotosUI
struct ProfileScreen: View {
    
    
    
    @State private var profileImage: UIImage?
    @State private var showSheet : Bool = false
    @State private var permissionGranted : Bool = false
    @State private var showPicker : Bool = false
    @State private var isUsingCamera : Bool = false
    
    @EnvironmentObject var user : User
    @State private var email : String = ""
    @State private var password : String = ""
    @Environment(\.dismiss) var dimiss
    var body: some View {
        VStack{
            Form{
                Button(action: {
                    if self.permissionGranted {
                        self.showSheet = true
                    } else {
                        self.requestCamera()
                    }
                }){
                    Image(uiImage: profileImage ?? UIImage(systemName: "person")!)
                        .resizable()
                        .frame(width: 300, height: 300)
                }.actionSheet(isPresented:self.$showSheet, content: {
                    ActionSheet(
                        title: Text("Choose Picture"),
                        message: Text("Select Profie Picture to upload"),
                        buttons: [
                            .default(Text("Select Profile Picture to upload")){
                                guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else {
                                    print(#function, "PhotoLibrary isn't available on the device")
                                    return
                                }
                                self.isUsingCamera = false
                                self.showPicker = true
                            },
                            .default(Text("Choose from Photo Library")){
                                guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
                                    print(#function, "Camera isn't available on the device")
                                    return
                                }
                                self.isUsingCamera = true
                                self.showPicker = true
                            },
                            .cancel()
                        ]
                    )
                }) // Action Sheet // Button
                
                Text("\(user.email)")
                
                SecureField("Enter password", text: $password)
                    .textFieldStyle(.roundedBorder)
                
                
                Button("Update"){
                    //verify the credential
                    if (!email.isEmpty && !password.isEmpty){
                        user.email = user.email
                        user.password = password
                        dimiss()
                    }
                }.buttonStyle(.borderedProminent)
                
                
            }//Form
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
        } .onAppear(){
            password = user.password
            checkPermission()
        } .fullScreenCover(isPresented: $showPicker){
            if isUsingCamera {
                
            } else {
                MyLibarayPicker(selectedImage: $profileImage)
            }
        }
    } // Body
    private func checkPermission(){
        switch PHPhotoLibrary.authorizationStatus() {
        case .authorized:
            self.permissionGranted = true
        case .restricted, .limited:
            break
        case .notDetermined, .denied:
            self.permissionGranted = false
            requestCamera()
        default:
            self.permissionGranted = false
        }
        
    } // Func
    
    private func requestCamera(){
        PHPhotoLibrary.requestAuthorization{ status in
            switch status {
            case .authorized:
                self.permissionGranted = true
            case .restricted, .limited:
                break
            case .notDetermined, .denied:
                self.permissionGranted = false
            default:
                self.permissionGranted = false
            }
        }
    } // Func
}

#Preview {
    ProfileScreen().environmentObject(User())
}

