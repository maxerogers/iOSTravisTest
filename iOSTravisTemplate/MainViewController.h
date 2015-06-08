//
//  MainViewController.h
//  Outlastr
//
//  Created by Max Rogers on 5/26/15.
//  Copyright (c) 2015 Carrot Creative. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProfileCell.h"
#import "CoupleCell.h"
#import "EndCell.h"
#import "ApiMaster.h"

@interface MainViewController : UIViewController <UICollectionViewDataSource,UICollectionViewDelegateFlowLayout, UIImagePickerControllerDelegate>
@property UIActivityIndicatorView *indicator;
@property UIView *topbar;
@property UIColor *purpleColor;
@property UIColor *darkPurpleColor;
@property UITableView *couplesView;
@property UICollectionView *collectionView;
@property ApiMaster *apimaster;
@property NSArray *beat;
@property ProfileCell *profileCell;
@property UIView *menuView;
@end