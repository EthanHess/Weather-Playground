//
//  WeatherController.m
//  Weather Playground
//
//  Created by Christian Monson on 3/2/15.
//  Copyright (c) 2015 DevMountain. All rights reserved.
//

#import "WeatherController.h"
#import "NetworkController.h"
#import "Weather.h"
#import <AFNetworking/AFNetworking.h>

@implementation WeatherController

+ (instancetype)sharedInstance {
    static WeatherController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc]init];
    });
    return sharedInstance;
}

- (void)getWeatherWithName:(NSString *)name completion:(void (^)(NSArray *weather))completion {
   
    NSString *path = [NSString stringWithFormat:@"name/%@",name];
    
    [[NetworkController api] GET:path parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSArray *responseWeatherInformation = responseObject;
        
        NSMutableArray *weatherInformation = [NSMutableArray new];
        for (NSDictionary *dictionary in responseWeatherInformation) {
            Weather *weather = [[Weather alloc]initWithDictionary:dictionary];
            [weatherInformation addObject:weather];
        }
        completion(weatherInformation);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"eror getting weather: %@", error);
        completion(nil);
    }];
}


@end
