//
//  Todo.h
//  EveryDo
//
//  Created by Rushan on 2017-05-16.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Todo : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *todoDescription;
@property (nonatomic, assign) int priorityNumber;
@property (nonatomic, assign) BOOL isCompleted;

-(instancetype)initWithTitle:(NSString*)title andDescription:(NSString*)todoDescription andPriority:(int)priorityNumber andIsCompleted:(BOOL)isCompleted;


@end
