//
//  ContentView.swift
//  Memorizes
//
//  Created by 潘令川 on 2023/10/1.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack(alignment: .center){
            let emojis:[String] = ["👻" , "😈" , "🎃" , "🕷️"]
            ForEach (emojis.indices , id: \.self) { index in
                CardView(content: emojis[index])
            }
        }.foregroundColor(.orange)
            .padding()
    }
}
    struct CardView: View {
       @State var isFaceUp : Bool = true
        let content :String
        var body: some View {
            ZStack {
                let base = RoundedRectangle(cornerRadius: 12)
                // note let and var in different condition
                // type inference
                //Set this "base" to change all relevant values at once
                if isFaceUp {
                   base
                        //.fill()  it is by default
                        .foregroundColor(.white)
                   base
                        .strokeBorder(lineWidth: 3)
                    Text(content).font(.largeTitle)
                } else {
                   base
                }
            }.onTapGesture {
                isFaceUp.toggle()
            }
        }
    }
    
#Preview {
    ContentView()
}
