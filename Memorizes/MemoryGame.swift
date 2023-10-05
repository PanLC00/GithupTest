//
//  MemorizeGame.swift
//  Memorizes
//
//  Created by 潘令川 on 2023/10/3.
//

import Foundation

// this is Model , and independence to UI
struct MemorizeGame <CardContent>  {
    var cards: Array<Card>
    func choose (cards: Card) {
        
    }
    struct Card {
        var isFacedUp: Bool
        var isMatched: Bool
        var content: CardContent
        
    }
}








