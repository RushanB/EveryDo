//
//  NewViewController.h
//  EveryDo
//
//  Created by Rushan on 2017-05-16.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Todo.h"

@protocol AddItemProtocol <NSObject>

-(void)addNewToDo:(Todo *)newToDo;

@end

@interface NewViewController : UIViewController

@property (nonatomic) id <AddItemProtocol> addItemDelegate;

@end
