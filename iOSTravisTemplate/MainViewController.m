//
//  MainViewController.m
//  Outlastr
//
//  Created by Max Rogers on 5/26/15.
//  Copyright (c) 2015 Carrot Creative. All rights reserved.
//

#import "MainViewController.h"

@implementation MainViewController{
}

-(void)animateInMenuView{
    _menuView = [[UIView alloc] init];
    _menuView.backgroundColor = [[UIColor alloc] initWithRed:165/255.0 green:105/255.0 blue:165/255.0 alpha:1.0];
    [self.view addSubview: _menuView];
    
    _menuView.frame = CGRectMake( self.view.frame.size.width*0.8, self.view.frame.size.height*0.1, self.view.frame.size.width*0.2, self.view.frame.size.height);
    
    UIButton *editButton = [[UIButton alloc] initWithFrame: CGRectMake(0, 0, _menuView.frame.size.width, _menuView.frame.size.height*0.3)];
    [editButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [editButton setImage:[UIImage imageNamed:@"gear2"] forState: UIControlStateNormal];
    [editButton.titleLabel setTextAlignment: NSTextAlignmentCenter];
    [_menuView addSubview: editButton];
    
}

-(UIView *) addTitleBar{
    UIView *container = [[UIView alloc] init];
    container.backgroundColor = [[UIColor alloc] initWithRed:165/255.0 green:105/255.0 blue:165/255.0 alpha:1.0];
    container.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview: container];
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem: container
                                                           attribute:NSLayoutAttributeTop
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem: self.view
                                                           attribute:NSLayoutAttributeTop
                                                          multiplier:1.0
                                                            constant:0]];
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem: container
                                                           attribute:NSLayoutAttributeWidth
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem: self.view
                                                           attribute:NSLayoutAttributeWidth
                                                          multiplier:1.0
                                                            constant:0]];
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem: container
                                                           attribute:NSLayoutAttributeHeight
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem: self.view
                                                           attribute:NSLayoutAttributeHeight
                                                          multiplier:0.1
                                                            constant:0]];
    
    UIImageView *logo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"logo" ]];
    logo.contentMode = UIViewContentModeScaleAspectFit;
    logo.translatesAutoresizingMaskIntoConstraints = NO;
    [container addSubview: logo];
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem: logo
                                                           attribute:NSLayoutAttributeBottom
                                                           relatedBy: NSLayoutRelationEqual
                                                              toItem: container
                                                           attribute:NSLayoutAttributeBottom
                                                          multiplier:0.8
                                                            constant: 0]];
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem: logo
                                                           attribute:NSLayoutAttributeHeight
                                                           relatedBy: NSLayoutRelationEqual
                                                              toItem: container
                                                           attribute:NSLayoutAttributeHeight
                                                          multiplier:0.4
                                                            constant:0]];
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem: logo
                                                           attribute:NSLayoutAttributeWidth
                                                           relatedBy: NSLayoutRelationEqual
                                                              toItem: container
                                                           attribute:NSLayoutAttributeWidth
                                                          multiplier:0.3
                                                            constant:0]];
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem: logo
                                                           attribute:NSLayoutAttributeCenterX
                                                           relatedBy: NSLayoutRelationEqual
                                                              toItem: container
                                                           attribute:NSLayoutAttributeCenterX
                                                          multiplier:1.0
                                                            constant:0]];
    
    UIButton *menu = [UIButton buttonWithType:UIButtonTypeCustom];
    [menu setImage: [UIImage imageNamed:@"hamburger"] forState: UIControlStateNormal];
    menu.imageView.contentMode = UIViewContentModeScaleAspectFit;
    menu.translatesAutoresizingMaskIntoConstraints = NO;
    [container addSubview: menu];
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem: menu
                                                           attribute:NSLayoutAttributeBottom
                                                           relatedBy: NSLayoutRelationEqual
                                                              toItem: container
                                                           attribute:NSLayoutAttributeBottom
                                                          multiplier:0.8
                                                            constant: 0]];
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem: menu
                                                           attribute:NSLayoutAttributeTrailing
                                                           relatedBy: NSLayoutRelationEqual
                                                              toItem: container
                                                           attribute:NSLayoutAttributeTrailing
                                                          multiplier: 0.95
                                                            constant: 0]];
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem: menu
                                                           attribute:NSLayoutAttributeWidth
                                                           relatedBy: NSLayoutRelationEqual
                                                              toItem: container
                                                           attribute:NSLayoutAttributeWidth
                                                          multiplier:0.1
                                                            constant:0]];
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem: menu
                                                           attribute:NSLayoutAttributeHeight
                                                           relatedBy: NSLayoutRelationEqual
                                                              toItem: container
                                                           attribute:NSLayoutAttributeHeight
                                                          multiplier:0.4
                                                            constant:0]];
    
    return container;
    
}

-(void) setUpColors{
    _purpleColor = [[UIColor alloc] initWithRed:165/255.0 green:105/255.0 blue:165/255.0 alpha:1.0];
    _darkPurpleColor = [[UIColor alloc] initWithRed:143/255.0 green:88/255.0 blue:143/255.0 alpha:1.0];
}

-(UIView *) makeCollectionView{
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = 0;
    _collectionView=[[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    [_collectionView setDataSource:self];
    [_collectionView setDelegate:self];
    
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    [_collectionView setBackgroundColor:[[UIColor alloc] initWithRed:225/255.0 green:225/255.0 blue:225/255.0 alpha:1.0]];
    
    UIView *container = [[UIView alloc] init];
    container.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview: container];
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem: container attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem: container attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0]];
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem: container attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_topbar attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0]];
    [container addSubview:_collectionView];
    return container;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setUpColors];
    self.view.backgroundColor = [[UIColor alloc] initWithRed:225/255.0 green:225/255.0 blue:225/255.0 alpha:1.0];
    _topbar = [self addTitleBar];
    [self makeCollectionView];
    [_collectionView registerClass:[ProfileCell class] forCellWithReuseIdentifier:@"profileCell"];
    [_collectionView registerClass:[CoupleCell class] forCellWithReuseIdentifier:@"coupleCell"];
    [_collectionView registerClass:[EndCell class] forCellWithReuseIdentifier:@"endCell"];
    
    _apimaster = [[ApiMaster alloc] init];
    if(!_apimaster.token){
        _apimaster.token = @"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE0MzM3OTcyNTE3NzR9.zgOV6UtpXNyZlZILyTN5N8pAy7ZF3XkDSEfj1vnQBtI";
        _apimaster.key = @"brad@pitt.com";
    }
    
    void(^success)(AFHTTPRequestOperation *operation, id responseObject) =
    ^void(AFHTTPRequestOperation *operation, id responseObject) {
        //        NSLog(@"%@",responseObject);
        _beat = responseObject[@"beat"];
        NSLog(@"%@",_beat);
        [_indicator stopAnimating];
        [_collectionView reloadData];
    };
    
    void(^fail)(AFHTTPRequestOperation *operation, id responseObject) =
    ^void(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"You weren't supposed to fail");
    };
    
    [_apimaster getBreakupsWithSuccessHandler:success failureHandler:fail];
    
    _indicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    _indicator.frame = CGRectMake(0.0, 0.0, 40.0, 40.0);
    _indicator.center = self.view.center;
    [self.view addSubview:_indicator];
    [_indicator bringSubviewToFront:self.view];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = TRUE;
    [_indicator startAnimating];
    
    //DELETE LATER
    //    [self animateInMenuView];
    
}

//ImagePicker Stuff
- (void)scanPath:(NSString *) sPath {
    
    BOOL isDir;
    
    [[NSFileManager defaultManager] fileExistsAtPath:sPath isDirectory:&isDir];
    
    if(isDir)
    {
        NSArray *contentOfDirectory=[[NSFileManager defaultManager] contentsOfDirectoryAtPath:sPath error:NULL];
        
        int contentcount = [contentOfDirectory count];
        int i;
        for(i=0;i<contentcount;i++)
        {
            NSString *fileName = [contentOfDirectory objectAtIndex:i];
            NSString *path = [sPath stringByAppendingFormat:@"%@%@",@"/",fileName];
            
            
            if([[NSFileManager defaultManager] isDeletableFileAtPath:path])
            {
                NSLog(path);
                [self scanPath:path];
            }
        }
        
    }
    else
    {
        NSString *msg=[NSString stringWithFormat:@"%@",sPath];
        NSLog(msg);
    }
}


- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info{
    [picker dismissViewControllerAnimated:YES completion:nil];
    //save image inside of app documents directory
    
    UIImage *image = (UIImage*) [info objectForKey:UIImagePickerControllerOriginalImage];
    NSData *imageData = UIImagePNGRepresentation(image);
    [[NSUserDefaults standardUserDefaults] setObject:imageData forKey:@"partner_avatar"];
    _profileCell.partnerImageView.image = image;
}

//Collection View STUFF
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [_beat count]+2;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if( indexPath.item == 0){
        ProfileCell *cell = (ProfileCell *) [collectionView dequeueReusableCellWithReuseIdentifier:@"profileCell" forIndexPath:indexPath];
        //This is probably unnecessary but strange behavior in the caching of images. Attempting to just lett the VC handle it
        _profileCell = cell;
        return cell;
    }else if( indexPath.item == [_beat count]+1){
        CoupleCell *cell = (CoupleCell *) [collectionView dequeueReusableCellWithReuseIdentifier:@"endCell" forIndexPath:indexPath];
        return cell;
    }else{
        CoupleCell *cell = (CoupleCell *) [collectionView dequeueReusableCellWithReuseIdentifier:@"coupleCell" forIndexPath:indexPath];
        [cell loadData: _beat[indexPath.item-1]];
        [cell assignIndexNumber:indexPath];
        return cell;
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.item == 0){
        return CGSizeMake(self.view.frame.size.width*0.9, self.view.frame.size.height*0.15);
        //         return CGSizeMake(self.view.frame.size.width, self.view.frame.size.height*0.5);
    }else if( indexPath.item == [_beat count]+1){
        return CGSizeMake(self.view.frame.size.width*0.9, self.view.frame.size.height*0.1);
    }
    //    return CGSizeMake(self.view.frame.size.width, self.view.frame.size.height*0.5);
    return CGSizeMake(self.view.frame.size.width*0.9, self.view.frame.size.height*0.6);
    
}
@end
