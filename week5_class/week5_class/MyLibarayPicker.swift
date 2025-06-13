//
//  MyLibarayPicker.swift
//  week5_class
//
//  Created by Arch Umeshbhai Patel on 2025-06-13.
//

import Foundation
import SwiftUI
import PhotosUI

struct MyLibarayPicker : UIViewControllerRepresentable {
    
    
    @Binding var selectedImage: UIImage?

    func makeUIViewController(context: UIViewControllerRepresentableContext<MyLibarayPicker>) -> some UIViewController {
        var libraryConfig = PHPickerConfiguration(photoLibrary: PHPhotoLibrary.shared())
        libraryConfig.selectionLimit = 1
        libraryConfig.filter = .images
        
        let imagePicker = PHPickerViewController(configuration: libraryConfig)
        imagePicker.delegate = context.coordinator
        return imagePicker
    }
    
    func makeCoordinator() -> MyLibarayPicker.Cooridinator {
        return Cooridinator(parent: self)
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        //
    }
    
    class Cooridinator : NSObject, PHPickerViewControllerDelegate {
        var parent : MyLibarayPicker
        
        init(parent: MyLibarayPicker) {
            self.parent = parent
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            picker.dismiss(animated: true )
            if results.count > 0 {
                if let selectedImage = results.first {
                    if selectedImage.itemProvider.canLoadObject(ofClass: UIImage.self){
                        selectedImage.itemProvider.loadObject(ofClass: UIImage.self){ image, error in
                            guard error == nil else {
                                print("Load Image Failure")
                                return
                            }
                            
                            if let img = image {
                                self.parent.selectedImage = img
                            }
                        }
                    }
                }
            }
            else {
                
            }
        }
        
        
    }
}
