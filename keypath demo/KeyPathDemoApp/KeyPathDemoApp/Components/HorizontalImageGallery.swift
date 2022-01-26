//
//  HorizontalImageGallery.swift
//  KeyPathDemoApp
//
//  Created by Emil Atanasov on 17.01.22.
//

import SwiftUI

struct HorizontalImageGallery: View {
    //fetch images from Environment
    @EnvironmentObject var gallery: Gallery
    private let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
    @State private var index = 0

    var body: some View {
        TabView(selection: $gallery.currentImage) {
            ForEach(gallery.images, id: \.self) { image in
                    Image(image)
                        .resizable()
                        .scaledToFill()
                        .tag(image)
                }
            }.tabViewStyle(.page)
        .frame(height: 276)
        .onReceive(timer, perform: { _ in
            index = index + 1 < gallery.images.count ? index + 1 : 0
            withAnimation {
                gallery.currentImage = gallery.images[index]
            }
        })

    }
}

struct HorizontalImageGallery_Previews: PreviewProvider {
    static var gallery = Gallery(images: ["image_1", "image_2", "image_3"])
    
    static var previews: some View {
        HorizontalImageGallery()
            .environmentObject(gallery)
    }
}
