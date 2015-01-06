//
//  ViewController.m
//  WYYScanBarCode
//
//  Created by wangyangyang on 15/1/6.
//  Copyright (c) 2015年 wangyangyang. All rights reserved.
//

#import "ViewController.h"


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController setNavigationBarHidden:YES];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:@"扫描" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(scan:) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(0, 0, 100, 50);
    btn.center = self.view.center;
    NSLog(@"view的原点：%f",self.view.frame.origin.y);
    [self.view addSubview:btn];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

-(void)scan:(UIButton *)sender
{
    if (!self.scanViewController) {
        self.scanViewController = [[ScanViewController alloc] init];
    }
    [self.navigationController pushViewController:self.scanViewController animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
