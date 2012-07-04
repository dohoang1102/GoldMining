//
//  GoldMiningViewController.m
//  GoldMining
//
//  Created by 機器 王 on 12/7/3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "GoldMiningViewController.h"

@interface GoldMiningViewController ()

- (IBAction)scorePressed:(id)sender ;
- (IBAction)infoPressed:(id)sender ;

@end

@implementation GoldMiningViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)scorePressed:(id)sender 
{
    // run Score View
}

- (IBAction)infoPressed:(id)sender 
{
    // run Info View
    [[[UIAlertView alloc] initWithTitle:@"About GoldMining"message:@"This is an iPhone Game" delegate:nil cancelButtonTitle:@"Done" otherButtonTitles:nil, nil] show];
}


@end