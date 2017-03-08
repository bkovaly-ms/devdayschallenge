//
//  EventViewController.m
//  DevDaysUltimateEdition
//
//  Copyright © 2017 Microsoft. All rights reserved.
//

#import "EventViewController.h"
#import "DevDayColors.h"

@interface EventViewController ()

@end

@implementation EventViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor primaryBackgroundColor];
    
    self.titleLabel.text = self.event.title;
    self.titleLabel.textColor = [UIColor primaryTextColor];
    self.titleLabel.font = [UIFont systemFontOfSize:18 weight:UIFontWeightSemibold];
    
    self.descriptionTextView.text = self.event.eventDescription;
    self.descriptionTextView.textColor = [UIColor secondaryTextColor];
    self.descriptionTextView.scrollEnabled = NO;
    self.descriptionTextView.editable = NO;
    self.descriptionTextView.textContainerInset = UIEdgeInsetsMake(-2, -4, 0, 0);
    self.descriptionTextView.textContainer.lineBreakMode = NSLineBreakByTruncatingTail;
    self.descriptionTextView.backgroundColor = [UIColor clearColor];
    self.descriptionTextView.font = [UIFont systemFontOfSize:14 weight:UIFontWeightMedium];
    
    UILabel *presenterLabel = [UILabel new];
    presenterLabel.textColor = [UIColor primaryTextColor];
    presenterLabel.text = @"Brandon Kovaly";

}

@end
