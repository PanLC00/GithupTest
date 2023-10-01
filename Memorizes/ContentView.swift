//
//  ContentView.swift
//  Memorizes
//
//
//

import SwiftUI

struct ContentView: View {
    @State var cardCount = 4
    let emojis:[String] = ["👻" , "😈" , "🎃" , "🕷️","😇", "😱","🍭" ,"🍬" , "🤡"]
    var body: some View {
        
        VStack {
            ScrollView{
                cards
                cardCountAdjusters
            }
        }
        .padding()
    }
    
    var cardCountAdjusters :some View {
        
        HStack{
            cardRemover
            Spacer()
            cardAdder
        }
    }
    
    var cards :some View {
        LazyVGrid(columns:[GridItem(.adaptive(minimum: 120))]){ // little size the view can
            ForEach (0..<cardCount , id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3 ,contentMode: .fit) //  Strictly follow the proportion
            }
            
        }.foregroundColor(.orange)
    }
    
    func cardCounterAdjuster(by offset:Int  , symbol:String ) -> some View {
        Button {
            cardCount += offset
        } label: {
            Image(systemName:symbol)
        }.imageScale(.large)
            .font(.largeTitle)
            .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
        
    }
    
    var cardRemover:some View {
        cardCounterAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
        
    }
    var cardAdder:some View {
        cardCounterAdjuster(by: 1, symbol:"rectangle.stack.badge.plus.fill")
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
                Group {
                    base
                    //.fill()  it is by default
                        .foregroundColor(.white)
                    base
                        .strokeBorder(lineWidth: 3)
                    Text(content).font(.largeTitle)
                }
                .opacity(isFaceUp ? 1 : 0)
                base.fill().opacity(isFaceUp ? 0 : 1 )
            }.onTapGesture {
                isFaceUp.toggle()
            }
            
            
        
        }
    }
}
#Preview {
    ContentView()
}
