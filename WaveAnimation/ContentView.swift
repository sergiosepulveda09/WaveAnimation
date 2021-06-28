//
//  ContentView.swift
//  WaveAnimation
//
//  Created by Sergio Sepulveda on 2021-06-27.
//

import SwiftUI
import UIKit

struct ContentView: View {
    
    let universalSize = UIScreen.main.bounds
    @State var isAnimated: Bool = false
    
    var body: some View {
        ZStack {
            getSinWave(interval: universalSize.width)
                .foregroundColor(Color(#colorLiteral(red: 0.541287601, green: 0.807090342, blue: 0.8501774669, alpha: 1)))
                .offset(x: isAnimated ? universalSize.width * -1 : 0)
                .animation(Animation.linear(duration: 6).repeatForever(autoreverses: false))
            getSinWave(interval: universalSize.width)
                .foregroundColor(Color(#colorLiteral(red: 0.541287601, green: 0.807090342, blue: 0.8501774669, alpha: 1)).opacity(0.5))
                .offset(x: isAnimated ? universalSize.width * -1 : 0)
                .animation(Animation.linear(duration: 12).repeatForever(autoreverses: false))
        }.onAppear() {
            self.isAnimated = true
        }
    }
    
    func getSinWave(interval: CGFloat,amplitude: CGFloat = 120,baseline: CGFloat = UIScreen.main.bounds.height/2) -> Path {
        Path { path in
            path.move(to: CGPoint(x: 0, y: baseline))
            path.addCurve(to: CGPoint(x: interval, y: baseline), control1: CGPoint(x: interval * (0.5), y: amplitude + baseline), control2: CGPoint(x: interval * (0.5), y: -amplitude + baseline))
            path.addCurve(to: CGPoint(x: interval * 2, y: baseline), control1: CGPoint(x: interval * (1.5), y: amplitude + baseline), control2: CGPoint(x: interval * (1.5), y: -amplitude + baseline))
            path.addLine(to: CGPoint(x: interval * 2, y: universalSize.height))
            path.addLine(to: CGPoint(x: 0, y: universalSize.height))
            
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
