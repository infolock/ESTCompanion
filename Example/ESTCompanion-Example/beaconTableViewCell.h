//
//  beaconTableViewCell.h
//  ESTCompanion-Example
//
//  Created by Jonathon Hibbard on 5/29/14.
//  Copyright (c) 2014 estcompanion. All rights reserved.
//

@class ESTBeacon;

@interface beaconTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *majorLabel;
@property (nonatomic, weak) IBOutlet UILabel *minorLabel;

@end
