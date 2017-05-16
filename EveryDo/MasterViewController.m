//
//  MasterViewController.m
//  EveryDo
//
//  Created by Rushan on 2017-05-16.
//  Copyright © 2017 RushanBenazir. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "TodoTableViewCell.h"
#import "Todo.h"

@interface MasterViewController ()

@property Todo *toDo;
@property NSMutableArray *objects;

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.objects = [[NSMutableArray alloc]init];
    
    UISwipeGestureRecognizer *swipedR = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipedToDo:)];
    [self.tableView.addGestureRecognizer:swipedR];
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
     [self.tableView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)insertNewObject:(id)sender {
    if (!self.objects) {
        self.objects = [[NSMutableArray alloc] init];
    }
    [self.objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}


#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        self.toDo = self.objects[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[segue destinationViewController];
        [controller setDetailItem:self.toDo];
    }else if([[segue identifier] isEqualToString:@"addItem"]){
        NewViewController *nvc = (NewViewController *)[segue destinationViewController];
        nvc.addItemDelegate = self;
    }
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    self.toDo = self.objects[indexPath.row];
    [cell setTodo:self.toDo];
    //NSDate *object = self.objects[indexPath.row];
    //cell.textLabel.text = [object description];
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    if(sourceIndexPath != destinationIndexPath){
        Todo *todoObject = [self.objects objectAtIndex:sourceIndexPath.row];
        [self.objects removeObjectAtIndex:sourceIndexPath.row];
        [self.objects insertObject:todoObject atIndex:destinationIndexPath.row];
        [self.tableView reloadData];
        
    }
}


#pragma mark - Adding new Todo

-(void)addNewToDo:(Todo *)newToDo{
    [self.objects addObject: newToDo];
    [self.objects removeObject: newToDo];
    [self.objects insertObject:newToDo atIndex:0];
    [self.tableView reloadData];
}

#pragma mark - Deleting + Completing

@end
