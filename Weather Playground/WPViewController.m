//
//  WPViewController.m
//  Weather Playground
//
//  Created by Joshua Howland on 6/17/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "WPViewController.h"
#import "WeatherController.h"
#import "Weather.h"

@interface WPViewController ()
@property (weak, nonatomic) IBOutlet UILabel *weatherMainLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *weatherDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *weatherTempLabel;
@property (weak, nonatomic) IBOutlet UIImageView *weatherIconImageView;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation WPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)searchButton:(id)sender {
    
    NSString *name = [self.textField.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [[WeatherController sharedInstance] getWeatherWithName:name completion:^(NSArray *weatherArray) {
        
        Weather *weather = [weatherArray firstObject];
        
        NSString *weatherMainInfo = [NSString stringWithFormat:@"%@", weather.weatherMain];
        self.weatherMainLabel.text = weatherMainInfo;
        
        NSString *locationNameInfo = [NSString stringWithFormat:@"%@", weather.locationName];
        self.locationNameLabel.text = locationNameInfo;
        
        NSString *weatherDescriptionInfo = [NSString stringWithFormat:@"%@", weather.weatherDescription];
        self.weatherDescriptionLabel.text = weatherDescriptionInfo;
        
        NSString *weatherTempInfo = [NSString stringWithFormat:@"%@", weather.weatherTemp];
        self.weatherTempLabel.text = weatherTempInfo;
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
