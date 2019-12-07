//
//  ContentView.swift
//  RecreatingTheIPhoneCameraTimelapseAnimation
//
//  Created by Ramill Ibragimov on 07.12.2019.
//  Copyright © 2019 Ramill Ibragimov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var rotateHandle = false
    @State private var strokeGrows = false
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [Color.black, Color.black]), center: .center, startRadius: 5, endRadius: 500)
            
            ForEach([0, 30, 60, 90, 120, 150, 180, 210, 240, 270, 300, 330], id: \.self) {angle in
                Rectangle()
                    .offset(y: -30)
                    .frame(width: 2, height: 10)
                    .foregroundColor(.white)
                    .rotationEffect(.degrees(angle))
            }
 
            Circle()
                .trim(from: strokeGrows ? 0 : 1, to: 1)
                .stroke(style: StrokeStyle(lineWidth: 5, dash: [1, 2], dashPhase: 1.0))
                .frame(width: 66, height: 66)
                .foregroundColor(.white)
                .rotationEffect(.degrees(90))
                .rotation3DEffect(.degrees(180), axis: (x: 1, y: 0, z: 0))
                .animation(Animation.linear(duration: 8).delay(2).repeatForever(autoreverses: false))
                .onAppear(){
                    self.strokeGrows.toggle()
                }
            
            Rectangle()
                .offset(y: -30)
                .frame(width: 2, height: 10)
                .foregroundColor(.white)
                .rotationEffect(.degrees(rotateHandle ? 360 : 0))
                .animation(Animation.linear(duration: 8).delay(2).repeatForever(autoreverses: false))
                .onAppear(){
                    self.rotateHandle.toggle()
                }
            
            Rectangle()
                .frame(width: 25, height: 25)
                .foregroundColor(.red)
                .cornerRadius(4)
            
        }.scaleEffect(2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
