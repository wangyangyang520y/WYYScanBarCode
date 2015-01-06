//
//  ScanBarCodeView.m
//  WYYScanBarCode
//
//  Created by wangyangyang on 15/1/6.
//  Copyright (c) 2015年 wangyangyang. All rights reserved.
//

#import "ScanBarCodeView.h"

@implementation ScanBarCodeView

-(instancetype)init
{
    self = [super init];
    if (self) {
        [self initScan];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initScan];
    }
    return self;
}

-(void)initScan
{
    // Device
    _device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    // Input
    _input = [AVCaptureDeviceInput deviceInputWithDevice:self.device error:nil];
    
    // Output
    _output = [[AVCaptureMetadataOutput alloc]init];
    [_output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    
    // Session
    _session = [[AVCaptureSession alloc]init];
    [_session setSessionPreset:AVCaptureSessionPresetHigh];
    if ([_session canAddInput:self.input])
    {
        [_session addInput:self.input];
    }
    
    if ([_session canAddOutput:self.output])
    {
        [_session addOutput:self.output];
    }
    
    // 条码类型 AVMetadataObjectTypeQRCode,AVMetadataObjectTypePDF417Code
    _output.metadataObjectTypes =@[AVMetadataObjectTypePDF417Code,AVMetadataObjectTypeQRCode];
    
    // Preview
    _preview =[AVCaptureVideoPreviewLayer layerWithSession:self.session];
    _preview.videoGravity = AVLayerVideoGravityResizeAspectFill;
    _preview.frame = self.bounds;
    [self.layer insertSublayer:self.preview atIndex:0];
    
}

-(void)setScanRect:(CGRect)rect
{
    //设置AVCaptureMetadataOutput  的rectOfInterest 的属性就可以设置可扫描区域了   这样设置就可以：CGRectMake（y的起点/屏幕的高，x的起点/屏幕的宽，扫描的区域的高/屏幕的高，扫描的区域的宽/屏幕的宽）
    _output.rectOfInterest = CGRectMake(rect.origin.y/self.frame.size.height, rect.origin.x/self.frame.size.width, rect.size.height/self.frame.size.height, rect.size.width/self.frame.size.width);
}

-(void)scanStart
{
    [_session startRunning];
}

-(void)scanStop
{
    [_session stopRunning];
}


#pragma mark AVCaptureMetadataOutputObjectsDelegate
- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
    NSString *stringValue;
    
    if ([metadataObjects count] >0)
    {
        AVMetadataMachineReadableCodeObject * metadataObject = [metadataObjects objectAtIndex:0];
        stringValue = metadataObject.stringValue;
    }
    
    [self scanStop];
    
    if ([self.scanDelegate respondsToSelector:@selector(scanCompleteCallBack:)]) {
        [self.scanDelegate scanCompleteCallBack:stringValue];
    }
    
}
@end
