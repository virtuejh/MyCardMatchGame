//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by JAE LEE on 12/9/13.
//  Copyright (c) 2013 JAE LEE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface CardMatchingGame : NSObject

- (instancetype)initWithCardCount:(NSUInteger)cardCount usingDeck:(Deck *)deck;
- (void) chooseCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly)NSInteger score;

@end

/*
#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

- (id)initWithCardCount:(NSUInteger)cardCount usingDeck:(Deck *)deck matchingCards:(NSUInteger)gameTypeCards;

- (void)flipCardAtIndex:(NSUInteger)index;

- (Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly)int score;

@property (nonatomic, readonly) NSString *flipDescription;

@property (nonatomic) int numberOfMatchingCards;

@end
*/