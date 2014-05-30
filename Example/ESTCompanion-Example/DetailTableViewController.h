//
//  DetailTableViewController.h
//  ESTCompanion-Example
//
//  Created by Jonathon Hibbard on 5/30/14.
//  Copyright (c) 2014 estcompanion. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailTableViewController : UITableViewController

@property (nonatomic, copy) NSString *beaconIdentifier;
@property (nonatomic, copy) NSString *beaconColor;

@end
