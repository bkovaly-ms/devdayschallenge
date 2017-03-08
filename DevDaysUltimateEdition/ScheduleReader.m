//
//  ScheduleReader.m
//  DevDaysUltimateEdition
//
//  Copyright © 2017 Microsoft. All rights reserved.
//

#import "ScheduleReader.h"

@implementation ScheduleReader

+ (NSArray<Event *> *)eventsFromFile:(NSString *)plistFilename
{
    NSArray *plistData = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:plistFilename ofType:@"plist"]];
    
    NSMutableArray *events = [NSMutableArray arrayWithCapacity:[plistData count]];
    for (NSDictionary *eventDict in plistData) {
        Event *event = [Event new];
        event.time = [eventDict objectForKey:@"time"];
        event.title = [eventDict objectForKey:@"title"];
        event.presenters = [eventDict objectForKey:@"presenters"];
        event.eventDescription = [eventDict objectForKey:@"description"];
        [events addObject:event];
    }
    
    return events;
}

@end
