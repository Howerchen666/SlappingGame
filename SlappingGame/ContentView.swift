//
//  ContentView.swift
//  SlappingGame
//
//  Created by Hower Chen on 2020/9/21.
//  Copyright © 2020 Hower Chen. All rights reserved.
//

import SwiftUI

@available(iOS 14.0, *)
struct ContentView: View {
    @State var firstExtended = false
    @State var secondExtended = false
    
    @available(iOS 14.0, *)
    var body: some View {
        VStack{
            Rectangle() //TODO Change the rectangle to authentic image
                .frame(width: 200, height: 200)
                .offset(y: firstExtended ? 400 : 0)
                .onTapGesture {
                    self.firstExtended = true
                    
                    delay(seconds: 0.5) {
                        self.firstExtended = false
                    }
                }
                .zIndex(10)
            Spacer()
            Divider()
            if #available(iOS 14.0, *) {
                HStack {
                    Text("Score:")
                    Spacer()
                }
                .ignoresSafeArea()
                .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            } else {
                // Fallback on earlier versions
            }
            
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
        .edgesIgnoringSafeArea(.all)
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
