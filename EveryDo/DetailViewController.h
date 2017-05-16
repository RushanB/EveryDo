//
//  DetailViewController.h
//  EveryDo
//
//  Created by Rushan on 2017-05-16.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Todo.h"

@interface DetailViewController : UIViewController

@property (strong,nonatomic) Todo *detailItem;
//property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

