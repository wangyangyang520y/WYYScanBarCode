//
//  ScanSurfaceView.h
//  MMP.iPhone.RMYY
//
//  Created by wangyangyang on 14/11/25.
//  Copyright (c) 2014年 wangyangyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScanSurfaceView : UIView
{
    CALayer *baselineLayer;
    BOOL isAnimation;
}

@property(nonatomic,assign)CGRect scanRect;

-(void)startBaseLineAnimation;
-(void)stopBaseLineAnimation;

@end
