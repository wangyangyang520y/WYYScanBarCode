//
//  ScanBarCodeView.h
//  WYYScanBarCode
//
//  Created by wangyangyang on 15/1/6.
//  Copyright (c) 2015年 wangyangyang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@protocol ScanViewDelegate <NSObject>

-(void)scanCompleteCallBack:(NSString *)stringValue;

@end

@interface ScanBarCodeView : UIView<AVCaptureMetadataOutputObjectsDelegate>

@property (strong,nonatomic)AVCaptureDevice * device;
@property (strong,nonatomic)AVCaptureDeviceInput * input;
@property (strong,nonatomic)AVCaptureMetadataOutput * output;
@property (strong,nonatomic)AVCaptureSession * session;
@property (strong,nonatomic)AVCaptureVideoPreviewLayer * preview;

@property(nonatomic,assign)id<ScanViewDelegate>scanDelegate;

-(void)setScanRect:(CGRect)rect;
-(void)scanStart;
-(void)scanStop;
@end
