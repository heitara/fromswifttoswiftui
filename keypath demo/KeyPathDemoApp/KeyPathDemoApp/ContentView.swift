//
//  ContentView.swift
//  KeyPathDemoApp
//
//  Created by Emil Atanasov on 24.01.22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var gallery = Gallery(images: ["image_1", "image_2", "image_3"]
)
    var body: some View {
        VStack(alignment: .leading) {
            Text("Image gallery")
            .font(.largeTitle)
            .fontWeight(.bold)
            .padding()
            HorizontalImageGallery()
        }.environmentObject(gallery)
    }
}





struct ContentView_Previews: PreviewProvider {
    static let configs: [LayoutDirection] = [.leftToRight, .rightToLeft]
    static var previews: some View {
            ForEach(configs, id:\.self) { direction in
            ContentView()
                .previewLayout(.sizeThatFits)
                .environment(\.layoutDirection, direction)
            }
            
        
    }
}
