//
//  EventTableViewCell.m
//  DevDaysUltimateEdition
//
//  Copyright © 2017 Microsoft. All rights reserved.
//

#import "EventTableViewCell.h"
#import "DevDayColors.h"

@interface EventTableViewCell()

@property UILabel *timeLabel;
@property UILabel *titleLabel;
@property UITextView *descriptionTextView;
@property UIView *separatorLineView;

@end

@implementation EventTableViewCell

+ (NSString*)reuseIdentifier {
    return @"EventTableViewCell";
}

+ (CGFloat)cellHeight {
    return 110.0;
}

+ (BOOL)requiresConstraintBasedLayout {
    return YES;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self initializeSubviews];
        [self initializeConstraints];
    }
    
    return self;
}

- (void)initializeSubviews {
    self.backgroundColor = [UIColor primaryBackgroundColor];
    self.contentView.translatesAutoresizingMaskIntoConstraints = NO;
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    self.timeLabel = [UILabel new];
    self.timeLabel.textColor = [UIColor primaryTextColor];
    self.timeLabel.font = [UIFont systemFontOfSize:18 weight:UIFontWeightSemibold];
    self.timeLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.timeLabel.userInteractionEnabled = NO;
    [self.contentView addSubview:self.timeLabel];
    
    self.titleLabel = [UILabel new];
    self.titleLabel.textColor = [UIColor primaryTextColor];
    self.titleLabel.font = [UIFont systemFontOfSize:18 weight:UIFontWeightSemibold];
    self.titleLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.titleLabel.userInteractionEnabled = NO;
    [self.contentView addSubview:self.titleLabel];
    
    self.descriptionTextView = [UITextView new];
    self.descriptionTextView.textColor = [UIColor secondaryTextColor];
    self.descriptionTextView.scrollEnabled = NO;
    self.descriptionTextView.editable = NO;
    self.descriptionTextView.textContainerInset = UIEdgeInsetsMake(-2, -4, 0, 0);
    self.descriptionTextView.textContainer.maximumNumberOfLines = 3;
    self.descriptionTextView.textContainer.lineBreakMode = NSLineBreakByTruncatingTail;
    self.descriptionTextView.backgroundColor = [UIColor clearColor];
    self.descriptionTextView.font = [UIFont systemFontOfSize:14 weight:UIFontWeightMedium];
    self.descriptionTextView.translatesAutoresizingMaskIntoConstraints = NO;
    self.descriptionTextView.userInteractionEnabled = NO;
    [self.contentView addSubview:self.descriptionTextView];
    
    self.separatorLineView = [UIView new];
    self.separatorLineView.translatesAutoresizingMaskIntoConstraints = NO;
    self.separatorLineView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.separatorLineView];
}

- (void)initializeConstraints {
    
    NSDictionary *viewDict = @{ @"titleLabel" : self.titleLabel,
                                @"descriptionTextView" : self.descriptionTextView,
                                @"separatorLineView" : self.separatorLineView };
    // Vertical Constraints
    //
    NSMutableArray *constraints = [NSMutableArray new];
    [constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[timeLabel]-5-[titleLabel]-5-[descriptionTextView]-(>=1)-[separatorLineView(1)]|" options:0 metrics:nil views:viewDict]];
    [constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[contentView]|" options:0 metrics:nil views:@{@"contentView" : self.contentView}]];
    
    // Horizontal Constraints
    //
    constraints = [NSMutableArray new];
    [constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[timeLabel]-|" options:0 metrics:nil views:viewDict]];
    [constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[titleLabel]-|" options:0 metrics:nil views:viewDict]];
    [constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[descriptionTextView]-|" options:0 metrics:nil views:viewDict]];
    [constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[contentView]|" options:0 metrics:nil views:@{@"contentView" : self.contentView}]];
    [constraints addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[separatorLineView]|" options:0 metrics:nil views:@{@"separatorLineView" : self.separatorLineView}]];

    
    [NSLayoutConstraint activateConstraints:constraints];
}

- (void)configureWithEvent:(Event *)event {
    self.timeLabel.text = event.time;
    self.titleLabel.text = event.title;
    self.descriptionTextView.text = event.eventDescription;
}

@end
