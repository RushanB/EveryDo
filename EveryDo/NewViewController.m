//
//  NewViewController.m
//  EveryDo
//
//  Created by Rushan on 2017-05-16.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import "NewViewController.h"

@interface NewViewController ()

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *priorityTextField;
@property (weak, nonatomic) IBOutlet UITextField *descriptionTextField;

@property (weak, nonatomic) IBOutlet UIButton *doneButton;

@end

@implementation NewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doneButton:(id)sender {
    Todo *newToDoToAdd = [[Todo alloc]initWithTitle:self.titleTextField.text andDescription:self.descriptionTextField.text andPriority:[self.priorityTextField.text intValue]];
    [self.addItemDelegate addNewToDo:newToDoToAdd];
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
