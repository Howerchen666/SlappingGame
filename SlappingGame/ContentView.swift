//
//  ContentView.swift
//  SlappingGame
//
//  Created by Hower Chen on 2020/9/21.
//  Copyright © 2020 Hower Chen. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var firstExtended = false
    @State var secondExtended = false
    
    @State var firstScore = 0
    @State var secondScore = 0
    
    @State var flipped = false
    
    @available(iOS 14.0, *)
    var body: some View {
        VStack{
            Rectangle() //TODO Change the rectangle to authentic image
                .frame(width: 200, height: 200)
                .offset(y: firstExtended ? 400 : 0)
                .onTapGesture {
                    guard !self.firstExtended else { return }
                    
                    self.firstExtended = true
                    
                    checkFirst()
                    
                    delay(seconds: 0.5) {
                        self.firstExtended = false
                    }
                }
                .zIndex(10)
            Spacer()
            
            HStack {
                Text("Score: \(firstScore)")
                Spacer()
            }
            .frame(height: 100.0)
            .ignoresSafeArea()
            
            Divider()
            
            HStack {
                Text("Score: \(secondScore)")
                Spacer()
            }
            .rotationEffect(Angle(degrees: 180))
            .frame(height: 100.0)
            .ignoresSafeArea()
            
            Spacer()
            Rectangle()//TODO Change the rectangle to authentic image
                .frame(width: 200, height:200)
                .foregroundColor(.red)
                .offset(y: secondExtended ? 0 : -400)
                .onTapGesture {
                    self.secondExtended = true
                    
                    delay(seconds: 0.5) {
                        self.secondExtended = false
                    }
            }
        }
        .rotationEffect(Angle(degrees: flipped ? 180 : 0))
        .ignoresSafeArea()
    }
    
    func checkFirst() {
        if secondExtended == false {
            if flipped {
                firstScore += 1
            } else {
                secondScore += 1
            }
        } else {
            flipped.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//Delay extension
func delay(seconds: Double, block: @escaping () -> ()) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: block)
}
