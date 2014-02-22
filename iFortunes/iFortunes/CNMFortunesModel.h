//
//  CNMFortunesModel.h
//  iFortunes
//
//  Created by Collin Mann on 2/18/14.
//  Copyright (c) 2014 Collin Mann. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface CNMFortunesModel : NSObject
@property (strong, nonatomic) NSString *secretAnswer;
- (NSString *) randomAnswer;
- (NSUInteger) numberOfAnswers;
- (NSUInteger) indexOfAnswer: (id) sender;
- (void) removeAnswerAtIndex: (NSUInteger) index;
- (void) insertAnswer: (NSString *) answer
              atIndex: (NSUInteger) index;
@end
