//
//  ViewController.m
//  Steps
//
//  Created by Mayur Phadte on 20/09/15.
//  Copyright © 2015 Mayur Phadte. All rights reserved.
//

#import "ViewController.h"
@import CoreMotion;

@interface ViewController ()
typedef void (^CMPedometerHandler)(CMPedometerData *pedometerData, NSError *error);
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CMPedometer *pedometer = [[CMPedometer alloc] init];
    NSDate* startDate;
    CMPedometerHandler handler = ^(CMPedometerData *pedometerData, NSError *error){
        if(error){
            NSLog(@"Historical pedometer query failed :%@",
                  [error localizedDescription]);
        }
        else{
            [self handlePedometerData:pedometerData];
        }
        
    };
    [pedometer queryPedometerDataFromDate:startDate toDate:[NSDate date] withHandler:handler];
}
-(void)handlePedometerData:(CMPedometerData*)pmData{
    NSLog(@"%@",pmData);
        
    
}
    
    
    
    
    


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
