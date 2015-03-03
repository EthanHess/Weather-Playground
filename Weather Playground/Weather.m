//
//  Weather.m
//  Weather Playground
//
//  Created by Christian Monson on 3/2/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "Weather.h"

//static NSString * const locationKey = @"name";
//static NSString * const weatherMainKey = [@"weather"][0][@"main"];
//static NSString * const weatherDescriptionKey = [@"weather"][0][@"description"];
//static NSString * const weatherIconKey = @"icon";
//static NSString * const weatherTempKey = @"temp";

@implementation Weather

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    self = [super init];
    if (self) {
        self.locationName = dictionary[@"name"];
        self.weatherMain = dictionary[@"weather"][0][@"main"];
        self.weatherDescription = dictionary[@"weather"][0][@"description"];
        self.weatherIcon = dictionary[@"icon"];
        self.weatherTemp = dictionary[@"main"][0][@"temp"];
        
    }
    
    return self;
    
}

@end
