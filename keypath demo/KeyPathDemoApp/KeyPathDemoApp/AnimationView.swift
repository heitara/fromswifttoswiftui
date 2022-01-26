//
//  AnimationView.swift
//  KeyPathDemoApp
//
//  Created by Emil Atanasov on 25.01.22.
//

import SwiftUI

struct AnimationView: View {
    @Namespace var namespace
    @State var show = false
    let animationId = "circle"
    
    var body: some View {
        ZStack {
            if !show {
                Circle()
                    .foregroundColor(.purple)
                    .matchedGeometryEffect(id: animationId, in: namespace)
                    .frame(width: 100, height: 100)
            } else {
                Circle()
                    .foregroundColor(.green)
                    .matchedGeometryEffect(id: animationId, in: namespace)
                    .frame(maxWidth: .infinity, maxHeight: 400)
            }
        }
        .onTapGesture {
            withAnimation {
                show.toggle()
            }
        }
    }
}

struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationView()
    }
}
