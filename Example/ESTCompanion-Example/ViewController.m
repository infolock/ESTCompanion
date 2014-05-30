//
//  ViewController.m
//  ESTCompanion-Example
//
//  Created by Jonathon Hibbard on 5/28/14.
//  Copyright (c) 2014 Jonathon Hibbard. All rights reserved.
//

#import "ViewController.h"
#import "beaconTableViewCell.h"

#import "ESTBeaconManager+AutoRegioning.h"

static NSString * const DEFAULT_BEACON_IDENTIFIER = @"estimoteIdentifier";

@interface ViewController () <ESTBeaconManagerDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) ESTBeaconManager *beaconManager;
@property (nonatomic, copy) NSArray *beacons;
@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end


@implementation ViewController

// Note: ESTBeaconManagerUUIDGroupDelegate used here to range immediately;  otherwise, just use the default ESTBeaconManager
-(void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    self.beaconManager = [[ESTBeaconManager alloc] initAutoRegioningWithOptions:kUUIDGroupInitOptionsAvoidUnknownStateBeacons
                                                                       delegate:self
                                                                  proximityUUID:ESTIMOTE_PROXIMITY_UUID
                                                                     identifier:DEFAULT_BEACON_IDENTIFIER];
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];

    [self.beaconManager stopRangingBeaconsInRegion];
}

-(void)setBeacons:(NSArray *)beacons {
    if( !_beacons || ![_beacons isEqualToArray:beacons] ) {
        _beacons = [beacons copy];

        [self.tableView reloadData];
    }
}


#pragma mark - ESTBeaconManager Delegate ( default )

-(void)beaconManager:(ESTBeaconManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(ESTBeaconRegion *)region {
    self.beacons = beacons;
    [self.tableView reloadData];
}

#pragma mark -
#pragma mark UITableView Delegate/Datasource
#pragma mark -

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80.0f;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.beacons count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *cellIdentifier = @"cellIdentifier";

    beaconTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];

    ESTBeacon *beacon = self.beacons[(NSUInteger)indexPath.row];

    cell.majorLabel.text = [beacon.major stringValue];
    cell.minorLabel.text = [beacon.minor stringValue];

    return cell;
}

@end
