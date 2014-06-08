//
//  DetailTableViewController.h
//  ESTCompanion-Example
//
//  Created by Jonathon Hibbard on 5/30/14.
//  Copyright (c) 2014 estcompanion. All rights reserved.
//

@class ESTBeacon;

@interface DetailTableViewController : UITableViewController

@property (nonatomic, strong) ESTBeacon *beacon;

@property (nonatomic, copy) NSString *beaconIdentifier;
@property (nonatomic, copy) NSString *beaconColor;

@end
