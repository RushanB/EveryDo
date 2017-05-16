//
//  TodoTableViewCell.h
//  EveryDo
//
//  Created by Rushan on 2017-05-16.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Todo.h"

@interface TodoTableViewCell : UITableViewCell

@property (nonatomic) Todo *toDo;
@property (nonatomic) IBOutlet UILabel *labelTitle;
@property (nonatomic) IBOutlet UILabel *lineDescription;
@property (nonatomic) IBOutlet UILabel *priorityNumber;


-(void)setTodo:(Todo *)toDo;


@end
