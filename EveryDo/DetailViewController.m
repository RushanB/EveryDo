//
//  DetailViewController.m
//  EveryDo
//
//  Created by Rushan on 2017-05-16.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property IBOutlet UILabel *titleLabel;
@property IBOutlet UILabel *descriptionLabel;
@property IBOutlet UILabel *priorityNumberLabel;

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(Todo *)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}


- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.descriptionLabel.text = self.detailItem.todoDescription;
        self.titleLabel.text = self.detailItem.title;
        self.priorityNumberLabel.text = [NSString stringWithFormat:@"Priority: %i", self.detailItem.priorityNumber];
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
