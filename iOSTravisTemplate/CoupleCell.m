//
//  CoupleCell.m
//  Outlastr
//
//  Created by Max Rogers on 5/27/15.
//  Copyright (c) 2015 Carrot Creative. All rights reserved.
//

#import "CoupleCell.h"

@implementation CoupleCell

-(void)fillContent{
    
    //The rounded blue top
    _bluetopLayer = [CALayer layer];
    _bluetopLayer.frame = CGRectMake(0, 0, self.contentView.frame.size.width, self.contentView.frame.size.height*0.5);
    [self.contentView.layer addSublayer: _bluetopLayer];
    
    _bluetopLayer.backgroundColor = [[UIColor alloc] initWithRed:102/255.0 green:170/255.0 blue:217/255.0 alpha:1.0].CGColor;
    _bluetopLayer.cornerRadius = 4;
    
    //The White box on the bottom
    UIView *messageView = [[UIView alloc] initWithFrame: CGRectMake(0, self.contentView.frame.size.height*0.7, self.contentView.frame.size.width, self.contentView.frame.size.height*0.2)];
    [self.contentView addSubview: messageView];
    messageView.backgroundColor = [UIColor whiteColor];
    messageView.layer.cornerRadius = 5.0;
    
    self.contentView.layer.shadowOffset = CGSizeMake(0, 3);
    self.contentView.layer.shadowRadius = 3;
    self.contentView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.contentView.layer.shadowOpacity = 0.3;
    
    
    //The Couple photo
    UIImage *couplePhoto = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:_data[@"photo"] ]]];
    UIImageView *couplePhotoView = [[UIImageView alloc] initWithImage: couplePhoto];
    couplePhotoView.frame = CGRectMake(0, 5, self.contentView.frame.size.width, self.contentView.frame.size.height*0.7);
    [self.contentView addSubview: couplePhotoView];
    couplePhotoView.contentMode = UIViewContentModeScaleAspectFill;
    [couplePhotoView setClipsToBounds:YES];
    //The Text Labels
    
    UILabel *numOfDays = [[UILabel alloc] init];
    [numOfDays setText: [NSString stringWithFormat:@"%@", _data[@"days_together"]]];
    [numOfDays setTextAlignment: NSTextAlignmentCenter];
    [messageView addSubview: numOfDays];
    numOfDays.translatesAutoresizingMaskIntoConstraints = NO;
    [messageView addConstraint: [NSLayoutConstraint constraintWithItem:numOfDays attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem: messageView attribute:NSLayoutAttributeTop multiplier:1.0 constant:20]];
    [messageView addConstraint: [NSLayoutConstraint constraintWithItem:numOfDays attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem: messageView attribute:NSLayoutAttributeWidth multiplier:0.3 constant:0]];
    
    UILabel *daysLabel = [[UILabel alloc] init];
    [daysLabel setText: @"DAYS"];
    [daysLabel setTextAlignment: NSTextAlignmentCenter];
    [messageView addSubview: daysLabel];
    daysLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [messageView addConstraint: [NSLayoutConstraint constraintWithItem:daysLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem: numOfDays attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0]];
    [messageView addConstraint: [NSLayoutConstraint constraintWithItem:daysLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem: messageView attribute:NSLayoutAttributeWidth multiplier:0.3 constant:0]];
    
    
    UILabel *partner2 = [[UILabel alloc] init];
    [partner2 setText: [_data[@"member_2"] uppercaseString]];
    [partner2 setTextColor: [UIColor whiteColor]];
    [self.contentView addSubview: partner2];
    partner2.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addConstraint: [NSLayoutConstraint constraintWithItem:partner2 attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem: couplePhotoView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-5]];
    [self.contentView addConstraint: [NSLayoutConstraint constraintWithItem:partner2 attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem: couplePhotoView attribute:NSLayoutAttributeLeading multiplier:1.0 constant:10]];
    [self.contentView addConstraint: [NSLayoutConstraint constraintWithItem:partner2 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem: self.contentView attribute:NSLayoutAttributeWidth multiplier:0.7 constant:0]];
    
    UILabel *partner1 = [[UILabel alloc] init];
    [partner1 setText: [NSString stringWithFormat:@"%@ &", [_data[@"member_1"] uppercaseString]]];
    [partner1 setTextColor: [UIColor whiteColor]];
    [self.contentView addSubview: partner1];
    partner1.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addConstraint: [NSLayoutConstraint constraintWithItem:partner1 attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem: partner2 attribute:NSLayoutAttributeTop multiplier:1.0 constant:0]];
    [self.contentView addConstraint: [NSLayoutConstraint constraintWithItem:partner1 attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem: partner2 attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0]];
    [self.contentView addConstraint: [NSLayoutConstraint constraintWithItem:partner1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem: partner2 attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
    
    //Adding soft shadows to overlaying text
    partner1.layer.shadowColor = [[UIColor blackColor] CGColor];
    partner1.layer.shadowOffset = CGSizeMake(0.0, 0.0);
    partner1.layer.shadowRadius = 3.0;
    partner1.layer.shadowOpacity = 0.75;
    partner1.layer.masksToBounds = NO;
    partner2.layer.shadowColor = [[UIColor blackColor] CGColor];
    partner2.layer.shadowOffset = CGSizeMake(0.0, 0.0);
    partner2.layer.shadowRadius = 3.0;
    partner2.layer.shadowOpacity = 0.75;
    partner2.layer.masksToBounds = NO;
    
    
    UILabel *blurb = [[UILabel alloc] initWithFrame: CGRectMake(messageView.frame.size.width*0.3, messageView.frame.size.height*0.1, messageView.frame.size.width*0.6, messageView.frame.size.height*0.8)];
    
    NSString *byline = [NSString stringWithFormat:@"%@ %@", @"8/22/12", _data[@"byline"]];
    
    NSMutableAttributedString *blurbText = [[NSMutableAttributedString alloc] initWithString:byline];
    [blurbText addAttribute:NSFontAttributeName
                      value:[UIFont systemFontOfSize:12]
                      range:NSMakeRange(0, 8)];
    
    blurb.attributedText = blurbText;
    [blurb setTextColor: [UIColor blackColor]];
    blurb.numberOfLines = 3;
    [messageView addSubview: blurb];
    
    // Share BTN
    UIButton *shareBtn = [UIButton buttonWithType: UIButtonTypeCustom];
    [shareBtn setImage: [UIImage imageNamed:@"share"] forState: UIControlStateNormal];
    shareBtn.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview: shareBtn];
    [self.contentView addConstraint: [NSLayoutConstraint constraintWithItem: shareBtn attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem: couplePhotoView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-10]];
    [self.contentView addConstraint: [NSLayoutConstraint constraintWithItem: shareBtn attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem: couplePhotoView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-10]];
    [self.contentView addConstraint: [NSLayoutConstraint constraintWithItem: shareBtn attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem: self.contentView attribute:NSLayoutAttributeWidth multiplier:0.1 constant:0]];
    [self.contentView addConstraint: [NSLayoutConstraint constraintWithItem: shareBtn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem: self.contentView attribute:NSLayoutAttributeWidth multiplier:0.1 constant:0]];
    
    [shareBtn addTarget:self
                 action:@selector(shareTrigger)
       forControlEvents:UIControlEventTouchUpInside];
    
    // Link BTN
    UIButton *linkBtn = [UIButton buttonWithType: UIButtonTypeCustom];
    [linkBtn setImage: [UIImage imageNamed:@"disclosure_chevron"] forState: UIControlStateNormal];
    linkBtn.translatesAutoresizingMaskIntoConstraints = NO;
    [messageView addSubview: linkBtn];
    [messageView addConstraint: [NSLayoutConstraint constraintWithItem: linkBtn attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem: messageView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
    [messageView addConstraint: [NSLayoutConstraint constraintWithItem: linkBtn attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem: messageView attribute:NSLayoutAttributeTrailing multiplier:0.95 constant:0]];
    [messageView addConstraint: [NSLayoutConstraint constraintWithItem: linkBtn attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem: messageView attribute:NSLayoutAttributeWidth multiplier:0.05 constant:0]];
    [messageView addConstraint: [NSLayoutConstraint constraintWithItem: linkBtn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem: messageView attribute:NSLayoutAttributeWidth multiplier:0.075 constant:0]];
    
    [linkBtn addTarget:self
                action:@selector(linkTrigger)
      forControlEvents:UIControlEventTouchUpInside];
    
}

-(void) shareTrigger{
    //    NSLog(@"Share Btn in  %@", self);
    [self shareLink];
}

-(void) linkTrigger{
    //NSLog(@"Link Btn in  %@", self);
    [self openExternalLink];
}


-(void) assignIndexNumber: (NSIndexPath *) x {
    _indexNumber = x.item;
    [self changeBackgroundColor];
}

-(void) changeBackgroundColor{
    
    switch (_indexNumber % 3)
    {
        case 2:
            
            _bluetopLayer.backgroundColor = [[UIColor alloc] initWithRed:240/255.0 green:232/255.0 blue:125/255.0 alpha:1.0].CGColor;
            
            break;
            
        case 1:
            
            _bluetopLayer.backgroundColor = [[UIColor alloc] initWithRed:100/255.0 green:153/255.0 blue:238/255.0 alpha:1.0].CGColor;
            
            break;
            
        case 0:
            
            _bluetopLayer.backgroundColor = [[UIColor alloc] initWithRed:83/255.0 green:228/255.0 blue:170/255.0 alpha:1.0].CGColor;
            
            break;
            
        default:
            
            _bluetopLayer.backgroundColor = [UIColor whiteColor].CGColor;
            
            break;
            
    }
}

//-(void) ideaNumber2{
//    UIImageView *coupleImageView = [[UIImageView alloc] initWithImage: [UIImage imageNamed:@"tomkat2"]];
//    coupleImageView.frame = CGRectMake(self.contentView.frame.size.width*0.1, self.contentView.frame.size.height*0.1, self.contentView.frame.size.width*0.8, self.contentView.frame.size.height*0.8);
//    coupleImageView.contentMode = UIViewContentModeScaleAspectFit;
//    [self.contentView addSubview: coupleImageView];
//    UILabel *title = [[UILabel alloc] init];
//    [title setText: @"Tom Cruise & Katie Holmes"];
//    [title setTextColor: [UIColor whiteColor]];
//    [title setTextAlignment: NSTextAlignmentCenter];
//    title.translatesAutoresizingMaskIntoConstraints = NO;
//    [self.contentView addSubview: title];
//    [self.contentView addConstraint: [NSLayoutConstraint constraintWithItem: title attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem: self.contentView attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
//    [self.contentView addConstraint: [NSLayoutConstraint constraintWithItem: title attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem: self.contentView attribute:NSLayoutAttributeTop multiplier:1.0 constant:0]];
//}

-(void) loadData:(NSDictionary *)dict{
    _data = dict;
    [self fillContent];
}

-(void)createEmailModal{
    
}

-(void) shareLink{
    UIView *masterView = [[[self superview] superview] superview];
    _shareHolderView = [[UIView alloc] initWithFrame: CGRectMake(masterView.frame.origin.x,
                                                                 masterView.frame.origin.y+masterView.frame.size.height*0.8,
                                                                 masterView.frame.size.width,
                                                                 masterView.frame.size.height*0.2)];
    _shareHolderView.backgroundColor = [[UIColor alloc] initWithRed:165/255.0 green:105/255.0 blue:165/255.0 alpha:0.9];
    [masterView addSubview: _shareHolderView];
    
    UIButton *emailBtn = [UIButton buttonWithType: UIButtonTypeSystem];
    [emailBtn setTitle:@"Email" forState: UIControlStateNormal];
    [_shareHolderView addSubview: emailBtn];
    emailBtn.translatesAutoresizingMaskIntoConstraints = NO;
    [emailBtn setTitleColor: [UIColor whiteColor] forState: UIControlStateNormal];
    
    
    [_shareHolderView addConstraint: [ NSLayoutConstraint constraintWithItem: emailBtn attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem: _shareHolderView attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
    [_shareHolderView addConstraint: [ NSLayoutConstraint constraintWithItem: emailBtn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem: _shareHolderView attribute:NSLayoutAttributeHeight multiplier:0.5 constant:0]];
    [_shareHolderView addConstraint: [ NSLayoutConstraint constraintWithItem: emailBtn attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem: _shareHolderView attribute:NSLayoutAttributeTop multiplier:1.0 constant:0]];
    
    emailBtn.titleLabel.adjustsFontSizeToFitWidth = YES;
    emailBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [emailBtn.titleLabel setFont: [UIFont systemFontOfSize:30]];
    
    [emailBtn addTarget:self
                 action:@selector(createEmailModal)
       forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *cancelBtn = [UIButton buttonWithType: UIButtonTypeSystem];
    [cancelBtn setTitle:@"Cancel" forState: UIControlStateNormal];
    [_shareHolderView addSubview: cancelBtn];
    cancelBtn.translatesAutoresizingMaskIntoConstraints = NO;
    [cancelBtn setTitleColor: [UIColor whiteColor] forState: UIControlStateNormal];
    
    
    [_shareHolderView addConstraint: [ NSLayoutConstraint constraintWithItem: cancelBtn attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem: _shareHolderView attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
    [_shareHolderView addConstraint: [ NSLayoutConstraint constraintWithItem: cancelBtn attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem: _shareHolderView attribute:NSLayoutAttributeHeight multiplier:0.5 constant:0]];
    [_shareHolderView addConstraint: [ NSLayoutConstraint constraintWithItem: cancelBtn attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem: _shareHolderView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0]];
    
    cancelBtn.titleLabel.adjustsFontSizeToFitWidth = YES;
    cancelBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [cancelBtn.titleLabel setFont: [UIFont systemFontOfSize:30]];
    
    [cancelBtn addTarget:self
                  action:@selector(killShareView)
        forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)killShareView{
    [_shareHolderView removeFromSuperview];
}

-(void) openExternalLink{
    UIView *masterView = [[[self superview] superview] superview];
    _linkView = [[WKWebView alloc] initWithFrame: CGRectMake(masterView.frame.origin.x,
                                                             masterView.frame.origin.y+masterView.frame.size.height*0.1,
                                                             masterView.frame.size.width,
                                                             masterView.frame.size.height*0.9)];
    NSURL *url = [[NSURL alloc] initWithString: _data[@"article_url"]];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL: url];
    [_linkView loadRequest:request];
    [masterView addSubview: _linkView];
    _linkView.navigationDelegate = self;
    _backButton = [UIButton buttonWithType: UIButtonTypeSystem];
    [_backButton setTitle:@"BACK" forState: UIControlStateNormal];
    _backButton.frame = CGRectMake(masterView.frame.origin.x,
                                   masterView.frame.origin.y+masterView.frame.size.height*0.01,
                                   masterView.frame.size.width*0.2,
                                   masterView.frame.size.height*0.1);
    [_backButton setTintColor: [UIColor whiteColor]];
    [masterView addSubview: _backButton];
    [_backButton addTarget:self
                    action:@selector(exitLinkView)
          forControlEvents:UIControlEventTouchUpInside];
    
    _indicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    _indicator.frame = CGRectMake(0.0, 0.0, 40.0, 40.0);
    _indicator.center = masterView.center;
    [masterView addSubview:_indicator];
    [_indicator bringSubviewToFront:masterView];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = TRUE;
    [_indicator startAnimating];
}

-(void) webView: (WKWebView *) webView didFinishNavigation: (WKNavigation *)navigation {
    //    NSLog(@"FINISHED LOADING");
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [_indicator stopAnimating];
}

-(void) exitLinkView{
    [_backButton removeFromSuperview];
    [_linkView removeFromSuperview];
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self){
        //Needs data first
        //        [self fillContent];
    }
    
    return self;
}

@end