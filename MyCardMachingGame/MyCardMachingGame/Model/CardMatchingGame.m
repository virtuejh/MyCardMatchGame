//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by JAE LEE on 12/9/13.
//  Copyright (c) 2013 JAE LEE. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (strong, nonatomic) NSMutableArray *cards; //of Card
@property (nonatomic, readwrite) NSInteger score;
@end

@implementation CardMatchingGame

//Lazy instantiation
-(NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (id)initWithCardCount:(NSUInteger)cardCount
              usingDeck:(Deck *)deck
{
    self = [super init];
    
    if (self) {
        for (int i = 0; i < cardCount; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];

            }else{
                self = nil;
                break;
            }

        }
    }
    return self;
}

static const int MISMATCH_PENALTY = 1;
#define MATCH_BONUS 4
#define FLIP_COST 0

- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index < self.cards.count) ? self.cards[index] : nil;
}

- (void) chooseCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        }else{
            
            for (Card *otherCard in self.cards) {
                
                if (otherCard.isChosen && !otherCard.isMatched) {
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore) {
                        self.score += matchScore; // * MATCH_BONUS;
                        otherCard.matched = YES;
                        card.chosen = YES;
                    }else{
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen = NO;
                    }
                    break;
                }
                
            }
            
            self.score -= FLIP_COST;
            card.chosen = YES;
        }
    }
}

@end

/*
#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (strong, nonatomic) NSMutableArray *cards;
@property (strong, nonatomic) NSMutableArray *facedUpCards;
@property (nonatomic) int score;
@property (nonatomic) NSString *flipDescription;
@end

@implementation CardMatchingGame


//Lazy instantiation
-(NSMutableArray *)cards
{
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

-(NSMutableArray *)facedUpCards
{
    if (!_facedUpCards) {
        _facedUpCards = [[NSMutableArray alloc] init];
    }
    return _facedUpCards;
}

- (id)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
          matchingCards:(NSUInteger)gameTypeCards
{
    self = [super init];
    
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            if (!card) {
                self = nil;
            } else {
                self.cards[i] = card;
            }
        }
    }
    _numberOfMatchingCards = gameTypeCards;
    return self;
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index < self.cards.count) ? self.cards[index] : nil;
}

#define FLIP_COST 1
#define MATCH_BONUS 4
#define MISMATCH_PENALTY 2

-(void) flipCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    
    if (card && !card.isUnplayable) {
        if (!card.isFaceUp) {
            NSMutableArray *otherCards = [[NSMutableArray alloc] init];
            NSMutableArray *otherContents = [[NSMutableArray alloc] init];
            for (Card *otherCard in self.cards) {
                if (otherCard.isFaceUp && !otherCard.isUnplayable) {
                    [otherCards addObject:otherCard];
                    [otherContents addObject:otherCard.contents];
                }
            }
            if ([otherCards count] < _numberOfMatchingCards - 1) {
                self.flipDescription = [NSString stringWithFormat:@"Flipped up %@", card.contents];
            } else {
                int matchScore = [card match:otherCards];
                if (matchScore) {
                    card.unplayable = YES;
                    for (Card *otherCard in otherCards) {
                        otherCard.unplayable = YES;
                        
                    }
                    self.score += matchScore * MATCH_BONUS;
                    self.flipDescription =
                    [NSString stringWithFormat:@"Matched %@ & %@ for %d points",
                     card.contents,
                     [otherContents componentsJoinedByString:@" & "],
                     matchScore * MATCH_BONUS];
                } else {
                    for (Card *otherCard in otherCards) {
                        otherCard.faceUp = NO;
                    }
                    self.score -= MISMATCH_PENALTY;
                    self.flipDescription =
                    [NSString stringWithFormat:@"%@ & %@ don’t match! %d point penalty!",
                     card.contents,
                     [otherContents componentsJoinedByString:@" & "],
                     MISMATCH_PENALTY];
                }
            }
            self.score -= FLIP_COST;
        }
        card.faceUp = !card.faceUp;
    }
}

@end
*/