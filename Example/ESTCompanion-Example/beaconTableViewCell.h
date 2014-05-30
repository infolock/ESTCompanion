//
//  beaconTableViewCell.h
//  ESTCompanion-Example
//
//  Created by Jonathon Hibbard on 5/29/14.
//  Copyright (c) 2014 Jonathon Hibbard. All rights reserved.
//

@class ESTBeacon;

@interface beaconTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *majorLabel;
@property (nonatomic, weak) IBOutlet UILabel *minorLabel;
@property (nonatomic, weak) IBOutlet UILabel *proximityLabel;
@property (nonatomic, weak) IBOutlet UILabel *identifierLabel;

@property (nonatomic, weak) IBOutlet UIImageView *beaconImageView;

@end
