//
//  emojiMemoryGameView.swift
//  Memorizes
//
//
//

import SwiftUI

struct emojiMemoryGameView: View {
    var viewModel: EmojiMemoryGame
    let emojis: [String] = ["👻", "😈", "🎃", "🕷️", "😇", "😱", "🍭", "🍬", "🤡"]
    var body: some View {
        ScrollView {
            cards
        }

        .padding()
    }

    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))]) { // little size the view can
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2 / 3, contentMode: .fit) //  Strictly follow the proportion
            }

        }.foregroundColor(.orange)
    }

    struct CardView: View {
        @State var isFaceUp: Bool = true
        let content: String
        var body: some View {
            ZStack {
                let base = RoundedRectangle(cornerRadius: 12)
                // note let and var in different condition
                // type inference
                // Set this "base" to change all relevant values at once
                Group {
                    base
                        // .fill()  it is by default
                        .foregroundColor(.white)
                    base
                        .strokeBorder(lineWidth: 3)
                    Text(content).font(.largeTitle)
                }
                .opacity(isFaceUp ? 1 : 0)
                base.fill().opacity(isFaceUp ? 0 : 1)
            }.onTapGesture {
                isFaceUp.toggle()
            }
        }
    }
}

#Preview {
    emojiMemoryGameView()
}
