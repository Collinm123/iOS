//
//  CNMFortunesModel.m
//  iFortunes
//
//  Created by Collin Mann on 2/18/14.
//  Copyright (c) 2014 Collin Mann. All rights reserved.
//

#import "CNMFortunesModel.h"

@interface CNMFortunesModel ()

@property (strong, nonatomic) NSMutableArray *answers;

@end

@implementation CNMFortunesModel



- (id) init {
    self = [super init];
    if (self) {
        _answers = [[NSMutableArray alloc] initWithObjects:
                    @"You will die today",
                    @"You will fail your upcoming midterm.",
                    @"You will get an A+ on your upcoming midterm.",
                    @"You will win a million dollars.",
                    @"You will live to be 150.",
                    @"You will explore every continent in the world",
                    @"You will make an outstanding contribution to the world.",
                    @"You will get a hot date today.", nil];
    }
    return self;
}

- (NSString *) secretAnswer {
    NSString *value = [[NSString alloc]
                       initWithFormat: @"You will work your butt off to become successful, so you can donate your money to those less fortunate than you."];
    return value;
}

- (NSString *) randomAnswer {
    return  [self.answers objectAtIndex: random()%[self.answers count]];
}

- (NSUInteger) numberOfAnswers {
    return [self.answers count];
}

- (NSUInteger) indexOfAnswer: (id) sender{
    return [self.answers indexOfObject: sender];
}

- (void) removeAnswerAtIndex:(NSUInteger)index {
    if (index < self.numberOfAnswers) {
        [self.answers removeObjectAtIndex:index];
    }
}

- (void) insertAnswer:(NSString *)answer
              atIndex:(NSUInteger)index{
    if (index < self.numberOfAnswers) {
        [self.answers insertObject:answer
                           atIndex:index];
    }
}


@end
