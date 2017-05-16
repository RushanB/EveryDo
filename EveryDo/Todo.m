//
//  Todo.m
//  EveryDo
//
//  Created by Rushan on 2017-05-16.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import "Todo.h"

@implementation Todo

- (instancetype)initWithTitle:(NSString*)title andDescription:(NSString*)todoDescription andPriority:(int)priority andIsCompleted:(BOOL)isCompleted{
    self = [super init];
    if (self) {
        _title = title;
        _todoDescription = todoDescription;
        _priority = priority;
        
        _isCompleted = NO;
        
    }
    return self;
}

@end
