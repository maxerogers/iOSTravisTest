//
//  CoupleCell.h
//  Outlastr
//
//  Created by Max Rogers on 5/27/15.
//  Copyright (c) 2015 Carrot Creative. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
@import WebKit;
@interface CoupleCell : UICollectionViewCell <WKNavigationDelegate>
@property NSInteger indexNumber;
@property CALayer *bluetopLayer;
@property NSDictionary *data;
@property WKWebView *linkView;
@property UIButton *backButton;
@property UIActivityIndicatorView *indicator;
@property UIView *shareHolderView;
-(void) assignIndexNumber:(NSIndexPath *) x;
-(void) loadData: (NSDictionary *) dict;
@end