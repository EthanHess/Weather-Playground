//
//  WeatherController.h
//  Weather Playground
//
//  Created by Christian Monson on 3/2/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Weather.h"

@interface WeatherController : NSObject

+ (instancetype)sharedInstance;

- (void)getWeatherWithName:(NSString *)name completion:(void (^)(NSArray *weather))completion;

@end
