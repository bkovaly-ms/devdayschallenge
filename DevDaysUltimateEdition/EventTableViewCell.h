//
//  EventTableViewCell.h
//  DevDaysUltimateEdition
//
//  Copyright © 2017 Microsoft. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Event.h"

@interface EventTableViewCell : UITableViewCell

+ (NSString*)reuseIdentifier;

+ (CGFloat)cellHeight;

- (void)configureWithEvent:(Event *)event;

@end
