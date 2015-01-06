//
//  ScanViewController.m
//  IphoneScanTest
//
//  Created by wangyangyang on 14/8/21.
//  Copyright (c) 2014年 wangyangyang. All rights reserved.
//

#import "ScanViewController.h"

@implementation ScanViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.navigationController setNavigationBarHidden:NO];
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"二维码/条码";
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont fontWithName:@"Heiti SC" size:20];
    self.navigationItem.titleView = titleLabel;
    
    
    UIButton *back = [[UIButton alloc] initWithFrame:CGRectMake(0,0, 60, 30)];
    [back setTitle:@"返回" forState:UIControlStateNormal];
    [back addTarget:self action:@selector(selfBack:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:back];
    self.navigationItem.leftBarButtonItem = backItem;
    
    
    NSLog(@"view的原点：%f",self.view.frame.origin.y);
    
    scanBarCodeView = [[ScanBarCodeView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    scanBarCodeView.scanDelegate = self;
    
    surfaceView = [[ScanSurfaceView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];

    [scanBarCodeView setScanRect:surfaceView.scanRect];
    [scanBarCodeView addSubview:surfaceView];
    [self.view addSubview:scanBarCodeView];
    
    
}

-(void)selfBack:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO];
    [scanBarCodeView scanStart];
    [surfaceView startBaseLineAnimation];
}


-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [scanBarCodeView scanStop];
    [surfaceView stopBaseLineAnimation];
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)scanCompleteCallBack:(NSString *)stringValue
{
    NSLog(@"扫描值是：%@",stringValue);
    [self selfBack:nil];
}


@end
