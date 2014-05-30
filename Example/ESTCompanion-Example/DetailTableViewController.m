//
//  DetailTableViewController.m
//  ESTCompanion-Example
//
//  Created by Jonathon Hibbard on 5/30/14.
//  Copyright (c) 2014 estcompanion. All rights reserved.
//

#import "DetailTableViewController.h"
#import "UIColor+Hexcode.h"
#import "ESTCompanionConstants.h"

@interface DetailTableViewController ()

@property (nonatomic, weak) IBOutlet UITextField *identifierTextField;
@property (nonatomic, weak) IBOutlet UIButton *purpleBeaconColorBtn;
@property (nonatomic, weak) IBOutlet UIButton *tealBeaconColorBtn;
@property (nonatomic, weak) IBOutlet UIButton *blueBeaconColorBtn;

@end

@implementation DetailTableViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    if( !isEmptyString( self.beaconIdentifier ) ) {
        self.identifierTextField.text = self.beaconIdentifier;
    }
}

-(IBAction)beaconColorBtnTapped:(UIButton *)btn {
    NSString *color = [btn.backgroundColor hexCodeColor];
    self.beaconColor = color;
}

-(IBAction)saveBtnTapped:(id)sender {
    self.beaconIdentifier = [self.identifierTextField.text copy];
    [self performSegueWithIdentifier:@"unwind" sender:self];
}

@end
