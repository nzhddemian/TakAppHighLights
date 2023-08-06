//
//  ContentView.swift
//  TakAppHighLights
//
//  Created by Demian Nezhdanov on 05/08/2023.
//

import SwiftUI
import MKDevice
struct ContentView: View {
    @ObservedObject var model : PhotoEditorTools
    
    init() {
        self.model = PhotoEditorTools(uiimage: UIImage(named: "test")!)
        self.model.toolMain = .adjust
        self.model.toolAdjust = .highlights
    }
    var body: some View {
        VStack {
            MTLViewContainer(model: model)
                .task(id: model.mView.layer.frame, priority: .high) {
                    
                    model.updateView()
                    
                     }
            Slider(value: $model.uniforms.intensity, in: 0...0.25, minimumValueLabel: Text("0").foregroundColor(.white), maximumValueLabel: Text("1").foregroundColor(.white)) {
                EmptyView()
            }.padding(.horizontal, 50)
            Text("Hello, world!")
            
        }
        .padding()
    }
}

