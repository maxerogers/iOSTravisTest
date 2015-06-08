//
//  ProfileCell.m
//  Outlastr
//
//  Created by Max Rogers on 5/28/15.
//  Copyright (c) 2015 Carrot Creative. All rights reserved.
//

#import "ProfileCell.h"

@implementation ProfileCell


-(void) fillContent{
    //    self.contentView.backgroundColor = [UIColor greenColor];
    CGFloat cWidth = self.contentView.frame.size.width;
    CGFloat cHeight = self.contentView.frame.size.height;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    UIImage *img = [UIImage imageWithData: [defaults objectForKey:@"partner_avatar"]];
    if(!img){
        NSLog(@"MAN WE FUCKED UP");
        img = [UIImage imageNamed:@"default_avatar2"];
    }
    
    _partnerImageView = [[UIImageView alloc] initWithImage:img];
    _partnerImageView.frame = CGRectMake(0, cHeight*0.5-cWidth*0.1, cWidth*0.2, cWidth*0.2);
    _partnerImageView.layer.cornerRadius = roundf(_partnerImageView.frame.size.width/2.0);
    _partnerImageView.layer.masksToBounds = YES;
    [self.contentView addSubview: _partnerImageView];
    [_partnerImageView.layer setBorderColor: [[UIColor grayColor] CGColor]];
    [_partnerImageView.layer setBorderWidth: 2.0];
    _partnerImageView.contentMode = UIViewContentModeScaleAspectFill;
    
    UILabel *partnerName = [[UILabel alloc] init];
    [partnerName setText: [defaults objectForKey:@"partner_name"]];
    partnerName.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview: partnerName];
    [self.contentView addConstraint: [NSLayoutConstraint constraintWithItem: partnerName attribute: NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem: self.contentView attribute:NSLayoutAttributeWidth multiplier:0.5 constant:0]];
    [self.contentView addConstraint: [NSLayoutConstraint constraintWithItem: partnerName attribute: NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem: self.contentView attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
    [self.contentView addConstraint: [NSLayoutConstraint constraintWithItem: partnerName attribute: NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem: self.contentView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
    
    UILabel *outlastedLabel = [[UILabel alloc] init];
    outlastedLabel.attributedText = [[NSAttributedString alloc]
                                     initWithString: @"You've Outlasted 4 Couples!"
                                     attributes: @{
                                                   NSFontAttributeName: [UIFont italicSystemFontOfSize:
                                                                         [UIFont systemFontSize]]}];
    //outlastedLabel.textAlignment = NSTextAlignmentCenter;
    outlastedLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview: outlastedLabel];
    [self.contentView addConstraint: [NSLayoutConstraint constraintWithItem: outlastedLabel attribute: NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem: partnerName attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0]];
    [self.contentView addConstraint: [NSLayoutConstraint constraintWithItem: outlastedLabel attribute: NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem: partnerName attribute:NSLayoutAttributeBottom multiplier:1.0 constant:20]];
    
    UILabel *numDays = [[UILabel alloc] init];
    NSString *numDaysString = [NSString stringWithFormat:@"%@ days", [self calculateLengthTogetherString: [defaults objectForKey:@"anniversary_date"]] ];
    [numDays setText: numDaysString ];
    numDays.translatesAutoresizingMaskIntoConstraints = NO;
    [self.contentView addSubview: numDays];
    [self.contentView addConstraint: [NSLayoutConstraint constraintWithItem:numDays attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem: self.contentView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0]];
    [self.contentView addConstraint: [NSLayoutConstraint constraintWithItem: numDays attribute: NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem: self.contentView attribute:NSLayoutAttributeCenterY multiplier:1 constant:0]];
}

//-(void) ideaNumber2{
//    self.contentView.backgroundColor = [[UIColor alloc] initWithRed:255/255.0 green:153/255.0 blue:255/255.0 alpha:1.0];
//
//    //Heart Portrait
//
//    UIImage *partnerImage = [UIImage imageNamed:@"katie2"];
//    UIImage *heart = [UIImage imageNamed:@"heart2"];
//
//    CGRect imageRect = CGRectMake(0, 0, partnerImage.size.width, partnerImage.size.height);
//    UIGraphicsBeginImageContextWithOptions(imageRect.size, NO, 0.0);
//    [partnerImage drawInRect:CGRectMake(1,1,partnerImage.size.width-2,partnerImage.size.height-2)];
//    partnerImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//
//    CGRect imageRect2 = CGRectMake(0, 0, heart.size.width, heart.size.height);
//    UIGraphicsBeginImageContextWithOptions(imageRect2.size, NO, 0.0);
//    [heart drawInRect:CGRectMake(1,1,heart.size.width-2,heart.size.height-2)];
//    heart = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//
//    //Old Approach
////    UIImageView *partnerImageView = [[UIImageView alloc] initWithImage: [self maskImage:partnerImage withMask:heart]];
////    //UIImageView *partnerImageView = [[UIImageView alloc] initWithImage: partnerImage];
////    [self.contentView addSubview: partnerImageView];
////    partnerImageView.contentMode = UIViewContentModeScaleAspectFill;
////    partnerImageView.translatesAutoresizingMaskIntoConstraints = NO;
////    [self.contentView addConstraint: [NSLayoutConstraint constraintWithItem: partnerImageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem: self.contentView attribute:NSLayoutAttributeHeight multiplier:1.0 constant:0]];
////    [self.contentView addConstraint: [NSLayoutConstraint constraintWithItem: partnerImageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem: self.contentView attribute:NSLayoutAttributeHeight multiplier:0.5 constant:0]];
////    [self.contentView addConstraint: [NSLayoutConstraint constraintWithItem: partnerImageView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem: self.contentView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
////    [self.contentView addConstraint: [NSLayoutConstraint constraintWithItem: partnerImageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem: self.contentView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
//
//    // New Approach
//
//    UIImageView *outlineView = [[UIImageView alloc] initWithImage:heart];
//    [outlineView setFrame: CGRectMake(self.contentView.frame.size.width*0.1, self.contentView.frame.size.width*0.1, self.contentView.frame.size.width*0.75, self.contentView.frame.size.width*0.75)];
//    [self.contentView addSubview: outlineView];
//
//    UIImageView *partnerImageView = [[UIImageView alloc] initWithImage: partnerImage];
//    [partnerImageView setFrame: CGRectMake(self.contentView.frame.size.width*0.15, self.contentView.frame.size.width*0.15, self.contentView.frame.size.width*0.65, self.contentView.frame.size.width*0.65)];
//    [self.contentView addSubview: partnerImageView];
//    partnerImageView.contentMode = UIViewContentModeScaleAspectFill;
//    UIImageView *maskView = [[UIImageView alloc] initWithImage:heart];
//    [maskView setFrame: (CGRect){.size = partnerImageView.frame.size}];
//    partnerImageView.maskView = maskView;
//
//    // Text
//
//    UILabel *daysCount =  [[UILabel alloc] init];
//    [daysCount setText: @"Congratulations"];
//    [daysCount setFont: [UIFont systemFontOfSize: 25]];
//    daysCount.textAlignment = NSTextAlignmentCenter;
//    [daysCount setTextColor: [UIColor whiteColor]];
//    daysCount.translatesAutoresizingMaskIntoConstraints = NO;
//    [self.contentView addSubview: daysCount];
//    [self.contentView addConstraint: [NSLayoutConstraint constraintWithItem:daysCount attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
//    [self.contentView addConstraint: [NSLayoutConstraint constraintWithItem:daysCount attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1.0 constant:10]];
//
//    UILabel *partnerName =  [[UILabel alloc] init];
//    [partnerName setText: @" You've outlasted 4 new couples!"];
//    partnerName.textAlignment = NSTextAlignmentCenter;
//    [partnerName setTextColor: [UIColor whiteColor]];
//    partnerName.translatesAutoresizingMaskIntoConstraints = NO;
//    [self.contentView addSubview: partnerName];
//    [self.contentView addConstraint: [NSLayoutConstraint constraintWithItem:partnerName attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:daysCount attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
//    [self.contentView addConstraint: [NSLayoutConstraint constraintWithItem:partnerName attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:daysCount attribute:NSLayoutAttributeBottom multiplier:1.0 constant:20]];
//
//    UILabel *congratsLabel =  [[UILabel alloc] init];
//    [congratsLabel setText: @"Together with Katie Holmes for XX Days"];
//    congratsLabel.textAlignment = NSTextAlignmentCenter;
//    [congratsLabel setTextColor: [UIColor whiteColor]];
//    congratsLabel.translatesAutoresizingMaskIntoConstraints = NO;
//    [self.contentView addSubview: congratsLabel];
//    [self.contentView addConstraint: [NSLayoutConstraint constraintWithItem:congratsLabel attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
//    [self.contentView addConstraint: [NSLayoutConstraint constraintWithItem:congratsLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-10]];
//
//}

- (UIImage*) maskImage:(UIImage *) image withMask:(UIImage *) mask
{
    CGImageRef imageReference = image.CGImage;
    CGImageRef maskReference = mask.CGImage;
    
    CGImageRef imageMask = CGImageMaskCreate(CGImageGetWidth(maskReference),
                                             CGImageGetHeight(maskReference),
                                             CGImageGetBitsPerComponent(maskReference),
                                             CGImageGetBitsPerPixel(maskReference),
                                             CGImageGetBytesPerRow(maskReference),
                                             CGImageGetDataProvider(maskReference),
                                             NULL, // Decode is null
                                             YES // Should interpolate
                                             );
    
    CGImageRef maskedReference = CGImageCreateWithMask(imageReference, imageMask);
    CGImageRelease(imageMask);
    
    UIImage *maskedImage = [UIImage imageWithCGImage:maskedReference];
    CGImageRelease(maskedReference);
    
    return maskedImage;
}
-(void)photoSelected{
    //TODO Let User's select their partner's photo. Save it for future use (maybe upload to the server?)
    [self pickImageFromPhone];
}
-(void) addPhotoSelector{
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(photoSelected)];
    singleTap.numberOfTapsRequired = 1;
    [_partnerImageView setUserInteractionEnabled:YES];
    [_partnerImageView addGestureRecognizer:singleTap];
}

//This is very ANTI  MVC hacky approach I've figured out
- (UIViewController *)parentViewController {
    UIResponder *responder = self;
    while ([responder isKindOfClass:[UIView class]])
        responder = [responder nextResponder];
    return (UIViewController *) responder;
}

-(void)pickImageFromPhone{
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]){
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.modalPresentationStyle = UIModalPresentationCurrentContext;
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        picker.delegate = [self parentViewController];
        [[self parentViewController] presentViewController:picker animated:YES completion:nil];
    }else{
        NSLog(@"There is no photolibrary on this device");
    }
}

-(NSString *)calculateLengthTogetherString:(NSString *) anniversaryDate{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss zzz"];
    NSDate *capturedStartDate = [dateFormatter dateFromString: anniversaryDate];
    NSTimeInterval diff = [[NSDate date] timeIntervalSinceDate:capturedStartDate];
    NSInteger time = round(diff);
    return [NSString stringWithFormat:@"%ld", time / (60*60*24)];
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self){
        [self fillContent];
        [self addPhotoSelector];
    }
    
    return self;
}

@end
