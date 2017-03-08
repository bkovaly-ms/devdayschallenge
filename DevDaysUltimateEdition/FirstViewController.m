//
//  FirstViewController.m
//  DevDaysUltimateEdition
//
//  Copyright © 2017 Microsoft. All rights reserved.
//

#import "FirstViewController.h"
#import "ScheduleReader.h"
#import "EventTableViewCell.h"
#import "EventViewController.h"

@interface FirstViewController ()

@property NSArray *events;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[EventTableViewCell class] forCellReuseIdentifier:[EventTableViewCell reuseIdentifier]];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    self.events = [ScheduleReader eventsFromFile:@"ScheduleDay1"];
    [self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.events count];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    EventTableViewCell *eventCell = [self.tableView dequeueReusableCellWithIdentifier:[EventTableViewCell reuseIdentifier] forIndexPath:indexPath];
    [eventCell configureWithEvent:[self.events objectAtIndex:indexPath.row]];
    return eventCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [EventTableViewCell cellHeight];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Event *selectedEvent = [self.events objectAtIndex:indexPath.row];
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    EventViewController *eventViewController = [storyboard instantiateViewControllerWithIdentifier:@"EventViewController"];
    eventViewController.event = selectedEvent;
    [self.navigationController pushViewController:eventViewController animated:YES];
}

@end
