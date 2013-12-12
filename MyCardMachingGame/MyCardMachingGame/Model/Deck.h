//
//  Deck.h
//  Matchismo
//
//  Created by JAE LEE on 12/9/13.
//  Copyright (c) 2013 JAE LEE. All rights reserved.
//

#import <Foundation/Foundation.h>
 #import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;

- (Card *)drawRandomCard;
- (int)numberOfCardsInDeck;

@end
