//
//  MTLViewContainer.swift
//  TakAppHighLights
//
//  Created by Demian Nezhdanov on 05/08/2023.
//


import SwiftUI
import MKDevice
struct MTLViewContainer: UIViewRepresentable {
    var model: PhotoEditorTools
    
    func makeUIView(context: Context) -> UIView {
        return model.mView
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
 
    }
    
}


