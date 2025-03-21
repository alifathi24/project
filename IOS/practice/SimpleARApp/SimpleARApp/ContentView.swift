//
//  ContentView.swift
//  SimpleARApp
//
//  Created by Fathi Ali on 2025-03-13.
//

import SwiftUI
import RealityKit
import ARKit

struct ContentView: View {
    var body: some View {
        ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        
        // Configure AR session
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = .horizontal
        arView.session.run(config)
        
        // Create a 3D box
        let box = ModelEntity(mesh: .generateBox(size: 0.1), materials: [SimpleMaterial(color: .blue, isMetallic: true)])
        
        // Attach box to anchor
        let anchor = AnchorEntity(plane: .horizontal)
        anchor.addChild(box)
        box.position = SIMD3(0, 0.05, 0) // Slightly above the surface
        
        // Add anchor to ARView
        arView.scene.addAnchor(anchor)
        
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
}
