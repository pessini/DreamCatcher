//
//  ListViewController.m
//  DreamCatcher
//
//  Created by Leandro Pessini on 2/12/15.
//  Copyright (c) 2015 Brazuca Labs. All rights reserved.
//

#import "ListViewController.h"
#import "DetailViewController.h"

@interface ListViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property NSMutableArray *titlesArray;
@property NSMutableArray *descriptionsArray;


@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.titlesArray = [NSMutableArray new];
    self.descriptionsArray = [NSMutableArray new];
}

- (void)presentDreamEntry
{

    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Enter New Dream" message:nil preferredStyle:UIAlertControllerStyleAlert];

    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {

        textField.placeholder = @"Dream Title";

    }];

    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {

        textField.placeholder = @"Dream Description";
        
    }];

    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];

    UIAlertAction *saveAction = [UIAlertAction actionWithTitle:@"Save" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {

        UITextField *textFieldOne = alertController.textFields[0];
        UITextField *textFieldTwo = alertController.textFields[1];

        [self.titlesArray addObject:textFieldOne.text];
        [self.descriptionsArray addObject:textFieldTwo.text];

        [self.tableView reloadData];

    }];

    [alertController addAction:cancelAction];
    [alertController addAction:saveAction];

    [self presentViewController:alertController animated:true completion:nil];

}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.titlesArray removeObjectAtIndex:indexPath.row];
    [self.descriptionsArray removeObjectAtIndex:indexPath.row];
    [self.tableView reloadData];
}

- (IBAction)onAddButtonTapped:(UIBarButtonItem *)sender
{

    [self presentDreamEntry];
}

- (IBAction)onEditButtonTaped:(UIBarButtonItem *)sender
{
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titlesArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = [self.titlesArray objectAtIndex:indexPath.row];

    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    DetailViewController *detailVC = segue.destinationViewController;

    detailVC.titleString = [self.titlesArray objectAtIndex:self.tableView.indexPathForSelectedRow.row];
    detailVC.descriptionString = [self.descriptionsArray objectAtIndex:self.tableView.indexPathForSelectedRow.row];
    

}

@end
