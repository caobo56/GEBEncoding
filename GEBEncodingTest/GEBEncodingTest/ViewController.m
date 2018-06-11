//
//  ViewController.m
//  GEBEncodingTest
//
//  Created by caobo56 on 2018/6/11.
//  Copyright © 2018年 caobo56. All rights reserved.
//

#import "ViewController.h"
#import "GEBEncoding.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self testCase];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)testCase{
    NSDictionary * dict = @{@"inputs.sourceType":@(1998),@"inputs.data":@(2000)};
    NSData * encodeData = [GEBEncoding encodedDataFromObject:dict];
    NSLog(@"encodeData = %@",encodeData);
    
    id decodeData = [GEBEncoding objectFromEncodedData:encodeData];
    
    NSLog(@"decodeData = %@",decodeData);
    NSLog(@"decodeData class = %@",[decodeData class]);
    NSLog(@"inputs.sourceType = %@",[decodeData objectAtIndex:1]);
}

@end
