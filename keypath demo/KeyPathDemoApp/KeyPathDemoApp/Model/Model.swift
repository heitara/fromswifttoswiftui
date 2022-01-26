//
//  Model.swift
//  KeyPathDemoApp
//
//  Created by Emil Atanasov on 25.01.22.
//

import Foundation

class Gallery: ObservableObject {
    
    init(images: [String]) {
        self.images = images
        if images.count > 0 {
            self.currentImage = images[0]
        } else {
            self.currentImage = ""
        }
    }
    
    @Published var images: [String] = []
    @Published var currentImage: String
}
