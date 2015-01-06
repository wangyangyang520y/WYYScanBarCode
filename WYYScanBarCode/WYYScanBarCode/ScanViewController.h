//
//  ScanViewController.h
//  IphoneScanTest
//
//  Created by wangyangyang on 14/8/21.
//  Copyright (c) 2014年 wangyangyang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScanSurfaceView.h"
#import "ScanBarCodeView.h"


@interface ScanViewController : UIViewController<ScanViewDelegate>
{
    ScanBarCodeView *scanBarCodeView;
    ScanSurfaceView *surfaceView;
    NSTimer *timer;
    NSString *textResult;
    UIImage *imageResult;
}

@end
