//
//  Deck.m
//  Matchismo
//
//  Created by JAE LEE on 12/9/13.
//  Copyright (c) 2013 JAE LEE. All rights reserved.
//

#import "Deck.h"

@interface Deck()
@property (strong, nonatomic)NSMutableArray *cards;
@end

@implementation Deck

- (int)numberOfCardsInDeck
{
    return [self.cards count];
}

- (NSMutableArray *)cards
{
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

- (void)addCard:(Card *)card
          atTop:(BOOL)atTop
{
    if (!card) return;
    
    if (atTop) {
        [self.cards insertObject:card atIndex:0];
    } else {
        [self.cards addObject:card];
    }
}

- (Card *)drawRandomCard
{
    Card *randomCard = nil;
    
    if (self.cards.count) {
        unsigned index = arc4random() % self.cards.count;
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    return randomCard;
}

@end
