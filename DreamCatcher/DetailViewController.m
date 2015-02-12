//
//  DetailViewController.m
//  DreamCatcher
//
//  Created by Leandro Pessini on 2/12/15.
//  Copyright (c) 2015 Brazuca Labs. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;


@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    self.title = self.titleString;
    self.textView.text = self.descriptionString;
}



@end
