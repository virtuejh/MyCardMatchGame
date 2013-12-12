//
//  Card.h
//  Matchismo
//
//  Created by JAE LEE on 12/5/13.
//  Copyright (c) 2013 JAE LEE. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;

@property (nonatomic, getter = isFaceUp) BOOL faceUp;
@property (nonatomic, getter = isUnplayable) BOOL unplayable;

@property (nonatomic, getter = isMatched) BOOL matched;
@property (nonatomic, getter = isChosen) BOOL chosen;

- (int)match:(NSArray *)otherCards;

@end
