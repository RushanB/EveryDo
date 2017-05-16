//
//  TodoTableViewCell.m
//  EveryDo
//
//  Created by Rushan on 2017-05-16.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import "TodoTableViewCell.h"



@implementation TodoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setTodo:(Todo *)toDo{
    _toDo = toDo;
    NSString *string = [[self.toDo.todoDescription componentsSeparatedByString:@" "]objectAtIndex:0];
    
    if(self.toDo.isCompleted == NO){
        self.labelTitle.text = self.toDo.title;
        self.lineDescription.text = [NSString stringWithFormat:@"%@...",string];
        self.priorityNumber.text = [NSString stringWithFormat:@"P: %i", self.toDo.priorityNumber];
    }else{
        NSMutableAttributedString *striked = [[NSMutableAttributedString alloc]initWithString:self.toDo.title];
        [striked addAttribute:NSStrikethroughStyleAttributeName value:@2 range:NSMakeRange(0, [striked length])];
    }
}


@end
