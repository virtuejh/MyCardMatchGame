//
//  PlayingCard.m
//  Matchismo
//
//  Created by JAE LEE on 12/9/13.
//  Copyright (c) 2013 JAE LEE. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    if ([otherCards count] == 1) {
        id otherCard = [otherCards firstObject];
        if ([otherCard isKindOfClass:[PlayingCard class]]) {
            PlayingCard *otherPlayingCard = (PlayingCard *)otherCard;
            if ([otherPlayingCard.suit isEqualToString:self.suit]) {
                score = 1;
            } else if (otherPlayingCard.rank == self.rank) {
                score = 4;
            }
        }
    }
    return score;
}


- (NSString *) contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

@synthesize  suit = _suit;

+ (NSArray *)validSuits
{
    return @[@"♠︎", @"♣︎", @"♥︎", @"♦︎"];
}

- (void) setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

- (NSString *)suit
{
    return _suit ? _suit: @"?";
}

+ (NSArray *)rankStrings
{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+ (NSUInteger)maxRank
{
    return [self rankStrings].count-1;
}

@end

/*
 //
 //  PlayingCard.m
 //  Matchismo
 //
 //  Created by Kyle Adams on 6/12/13.
 //  Copyright (c) 2013 Kyle Adams. All rights reserved.
 //
 
 #import "PlayingCard.h"
 
 @implementation PlayingCard
 
 - (int)match:(NSArray *)otherCards
 {
 int score = 0;
 if ([otherCards count] == 1) {
 id otherCard = [otherCards lastObject];
 if ([otherCard isKindOfClass:[PlayingCard class]]) {
 PlayingCard *otherPlayingCard = (PlayingCard *)otherCard;
 if ([otherPlayingCard.suit isEqualToString:self.suit]) {
 score = 1;
 } else if (otherPlayingCard.rank == self.rank) {
 score = 4;
 }
 }
 }
 return score;
 }
 
 - (NSString *)contents
 {
 NSArray *rankStrings = [PlayingCard rankStrings];
 return [rankStrings [self.rank] stringByAppendingString:self.suit];
 }
 
 @synthesize suit = _suit;
 
 - (void)setSuit:(NSString *)suit
 {
 if ([[PlayingCard validSuits] containsObject:suit]) {
 _suit = suit;
 }
 }
 
 - (NSString *)suit
 {
 return _suit ? _suit : @"?";
 }
 
 - (void)setRank:(NSUInteger)rank
 {
 if (rank <= [PlayingCard maxRank]) {
 _rank = rank;
 }
 }
 
 
 + (NSArray *)validSuits
 {
 return @[@"♠",@"♣",@"♥",@"♦"];
 }
 
 
 + (NSArray *)rankStrings
 {
 return @[@"?",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
 }
 
 + (NSUInteger)maxRank {
 return [self rankStrings].count-1;
 }
 
 @end

*/