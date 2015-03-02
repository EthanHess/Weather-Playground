//
//  Weather.m
//  Weather Playground
//
//  Created by Christian Monson on 3/2/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "Weather.h"

static NSString * const locationKey = @"location";
static NSString * const weatherMainKey = @"main";
static NSString * const weatherDescriptionKey = @"description";
static NSString * const weatherIconKey = @"icon";
static NSString * const weatherTempKey = @"temp";

@implementation Weather

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    self = [super init];
    if (self) {
        self.locationName = dictionary[locationKey];
        self.weatherMain = dictionary[weatherMainKey];
        self.weatherDescription = dictionary[weatherDescriptionKey];
        self.weatherIcon = dictionary[weatherIconKey];
        self.weatherTemp = dictionary[weatherTempKey];
        
    }
    
    return self;
    
}

@end
