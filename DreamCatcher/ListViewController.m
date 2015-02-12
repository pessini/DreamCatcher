//
//  ListViewController.m
//  DreamCatcher
//
//  Created by Leandro Pessini on 2/12/15.
//  Copyright (c) 2015 Brazuca Labs. All rights reserved.
//

#import "ListViewController.h"

@interface ListViewController () <UITableViewDataSource, UITableViewDelegate>


@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)onAddButtonTapped:(UIBarButtonItem *)sender
{

}

- (IBAction)onEditButtonTaped:(UIBarButtonItem *)sender
{
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];

    return cell;
}

@end
