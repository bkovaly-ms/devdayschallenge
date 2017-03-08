//
//  ScheduleReader.h
//  DevDaysUltimateEdition
//
//  Copyright © 2017 Microsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Event.h"

@interface ScheduleReader : NSObject

+ (NSArray<Event *> *)eventsFromFile:(NSString *)plistFilename;

@end
