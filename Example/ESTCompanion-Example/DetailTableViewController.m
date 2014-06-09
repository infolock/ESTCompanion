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
#import "ESTCompanion.h"
#import "ESTBeacon+Companion.h"

#import "UIAlertView+ESTCompanion.h"
#import "UIColor+Hexcode.h"

@interface DetailTableViewController ()

@property (nonatomic, weak) IBOutlet UITextField *identifierTextField;
@property (nonatomic, weak) IBOutlet UIButton *purpleBeaconColorBtn;
@property (nonatomic, weak) IBOutlet UIButton *tealBeaconColorBtn;
@property (nonatomic, weak) IBOutlet UIButton *blueBeaconColorBtn;

@end

@implementation DetailTableViewController

-(void)viewDidLoad {
    [super viewDidLoad];
 
    if( self.beacon ) {
        self.beaconColor = [[self.beacon beaconColor] hexCodeColor];
        self.beaconIdentifier = [self.beacon identifier];
    }
    if( !isEmptyString( self.beaconIdentifier ) ) {
        self.identifierTextField.text = self.beaconIdentifier;
    }
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.beacon = nil;
}

-(IBAction)beaconColorBtnTapped:(UIButton *)btn {
    NSString *color = [btn.backgroundColor hexCodeColor];
    self.beaconColor = color;
}

-(IBAction)saveBtnTapped:(id)sender {
    self.beaconIdentifier = [self.identifierTextField.text copy];
    [self performSegueWithIdentifier:@"unwind" sender:self];
}

-(IBAction)resetSettingsToFactoryDefaultsBtnTapped:(id)sender {

    [UIAlertView showAlertWithTitle:@"Test" message:@"TEST" delegate:nil cancelButtonTitle:@"cancel" otherButtonTitles:nil];
//    [UIAlertView showAlertWithTitle:@"Reset Settings"
//                            message:@"Warning: There is no going back if you decide to do this!"
//                cancelBtnCompletion:nil
//                  cancelButtonTitle:@"Cancel"
//                 otherBtnCompletion:^{
//                    NSLog( @"Resetting beacon settings to factory defaults!" );
//
//                    dispatch_async(dispatch_get_main_queue(), ^{
//                        [[ESTCompanion sharedInstance] resetFactorySettingsToBeacon:self.beacon];
//
//                    });
//                }
//                otherButtonTitles:@"Do it!", nil];


}

@end
