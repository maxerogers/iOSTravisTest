//
//  TestViewController.m
//
//
//  Created by Max Rogers on 5/28/15.
//
//

#import "TestViewController.h"

@implementation TestViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [[UIColor alloc] initWithRed:0.9 green:0.9 blue:0.9 alpha:1.0];
    
    UIView *contentView = [[UIView alloc] init];
    contentView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview: contentView];
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem: contentView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute: NSLayoutAttributeHeight multiplier:1.0 constant:0]];
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem: contentView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute: NSLayoutAttributeWidth multiplier:1.0 constant:0]];
    
    contentView.layer.backgroundColor = [UIColor orangeColor].CGColor;
    contentView.layer.cornerRadius = 20.0;
    
    CALayer *sublayer = [CALayer layer];
    sublayer.backgroundColor = [UIColor blueColor].CGColor;
    sublayer.shadowOffset = CGSizeMake(0, 3);
    sublayer.shadowRadius = 5.0;
    sublayer.shadowColor = [UIColor blackColor].CGColor;
    sublayer.shadowOpacity = 0.8;
    sublayer.frame = CGRectMake(30, 30, 128, 192);
    sublayer.borderColor = [UIColor blackColor].CGColor;
    sublayer.borderWidth = 2.0;
    sublayer.cornerRadius = 10.0;
    [self.view.layer addSublayer:sublayer];
    
    CALayer *imageLayer = [CALayer layer];
    imageLayer.frame = sublayer.bounds;
    imageLayer.cornerRadius = 10.0;
    imageLayer.contents = (id) [UIImage imageNamed:@"katie"].CGImage;
    imageLayer.masksToBounds = YES;
    [sublayer addSublayer:imageLayer];
    
    CALayer *layer2 = [CALayer layer];
    CGFloat radius2 = 50.0;
    [layer2 setMasksToBounds:YES];
    [layer2 setBackgroundColor: [[UIColor blueColor] CGColor]];
    [layer2 setCornerRadius:radius2 ];
    [layer2 setBounds:CGRectMake(0.0f, 0.0f, radius2 *2 ,radius2 *2)];
    layer2.frame = CGRectMake(200, 300, 100, 100);
    [contentView.layer addSublayer: layer2];
    
    CALayer *layer = [CALayer layer];
    CGFloat radius = 25.0;
    [layer setMasksToBounds:YES];
    [layer setBackgroundColor: [[UIColor redColor] CGColor]];
    [layer setCornerRadius:radius ];
    [layer setBounds:CGRectMake(0.0f, 0.0f, radius *2 ,radius *2)];
    layer.frame = CGRectMake(225, 325, 50, 50);
    layer2.mask = layer;
    [contentView.layer addSublayer: layer];
    
    UIImageView *imgview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"katie"]];
    [imgview setFrame: CGRectMake(50, 300, 100, 100)];
    imgview.layer.cornerRadius = roundf(imgview.frame.size.width/2.0);
    imgview.layer.masksToBounds = YES;
    [contentView addSubview: imgview];
    
    CALayer *layer3 = [CALayer layer];
    CGFloat radius3 = 50;
    [layer3 setMasksToBounds:YES];
    [layer3 setBackgroundColor: [[UIColor whiteColor] CGColor]];
    [layer3 setCornerRadius:radius3 ];
    [layer3 setBounds:CGRectMake(0.0f, 0.0f, radius3 *2 ,radius3 *2)];
    layer3.frame = CGRectMake(50, 450, 100, 100);
    [contentView.layer addSublayer: layer3];
    
    imgview = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"katie"]];
    [imgview setFrame: CGRectMake(layer3.frame.origin.x + radius3 * 0.15, layer3.frame.origin.y + radius3 * 0.15, layer3.frame.size.width * 0.85, layer3.frame.size.height * 0.85)];
    imgview.layer.cornerRadius = roundf(imgview.frame.size.width/2.0);
    imgview.layer.masksToBounds = YES;
    [contentView addSubview: imgview];
    [imgview.layer setBorderColor: [[UIColor grayColor] CGColor]];
    [imgview.layer setBorderWidth: 2.0];
    imgview.contentMode = UIViewContentModeScaleAspectFit;
    
    
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    indicator.frame = CGRectMake(0.0, 0.0, 40.0, 40.0);
    indicator.center = self.view.center;
    [self.view addSubview:indicator];
    [indicator bringSubviewToFront:self.view];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = TRUE;
    [indicator startAnimating];
    /*
     UIView *cell = [[UIView alloc] init];
     [self.view addSubview: cell];
     cell.translatesAutoresizingMaskIntoConstraints = NO;
     [self.view addConstraint: [NSLayoutConstraint constraintWithItem: cell attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute: NSLayoutAttributeHeight multiplier:0.4 constant:0]];
     [self.view addConstraint: [NSLayoutConstraint constraintWithItem: cell attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute: NSLayoutAttributeWidth multiplier:0.9 constant:0]];
     [self.view addConstraint: [NSLayoutConstraint constraintWithItem: cell attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute: NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
     [self.view addConstraint: [NSLayoutConstraint constraintWithItem: cell attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute: NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
     cell.backgroundColor = [UIColor whiteColor];
     
     
     int radius = cell.frame.size.width/2;
     UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, cell.frame.size.width, cell.frame.size.height) cornerRadius:0];
     UIBezierPath *circlePath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 2.0*radius, 2.0*radius) cornerRadius:radius];
     [path appendPath:circlePath];
     [path setUsesEvenOddFillRule:YES];
     CAShapeLayer *fillLayer = [CAShapeLayer layer];
     fillLayer.path = path.CGPath;
     fillLayer.fillRule = kCAFillRuleEvenOdd;
     fillLayer.fillColor = [UIColor redColor].CGColor;
     fillLayer.opacity = 0.5;
     [cell.layer addSublayer:fillLayer];
     cell.backgroundColor = [UIColor greenColor];
     NSArray *transparentRects = [[NSArray alloc] initWithObjects:[NSValue valueWithCGRect:CGRectMake(cell.frame.origin.x, cell.frame.origin.y, 100, 20)], nil];
     PartialTransparentView *transparentView = [[PartialTransparentView alloc] initWithFrame:CGRectMake(cell.frame.origin.x,cell.frame.origin.y,cell.frame.size.width,cell.frame.size.height) backgroundColor:[UIColor colorWithWhite:1 alpha:0.75] andTransparentRects:transparentRects];
     [cell addSubview:transparentView];
     */
    
    
    
    
    
    
    
    /*
     UIView *circleView = [[UIView alloc] init];
     circleView.alpha = 0.5;
     circleView.layer.cornerRadius = 50;
     circleView.backgroundColor = [UIColor blueColor];
     [cell addSubview: circleView];
     circleView.translatesAutoresizingMaskIntoConstraints = NO;
     [self.view addConstraint: [NSLayoutConstraint constraintWithItem: circleView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell attribute: NSLayoutAttributeHeight multiplier:0.4 constant:0]];
     [self.view addConstraint: [NSLayoutConstraint constraintWithItem: circleView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell attribute: NSLayoutAttributeWidth multiplier:0.9 constant:0]];
     [self.view addConstraint: [NSLayoutConstraint constraintWithItem: circleView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell attribute: NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
     [self.view addConstraint: [NSLayoutConstraint constraintWithItem: circleView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell attribute: NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
     
     CircleView *circle1 = [[CircleView alloc] init];
     circle1.translatesAutoresizingMaskIntoConstraints = NO;
     [cell addSubview: circle1];
     [self.view addConstraint: [NSLayoutConstraint constraintWithItem: circle1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:cell attribute: NSLayoutAttributeHeight multiplier:0.4 constant:0]];
     [self.view addConstraint: [NSLayoutConstraint constraintWithItem: circle1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:cell attribute: NSLayoutAttributeWidth multiplier:0.9 constant:0]];
     [self.view addConstraint: [NSLayoutConstraint constraintWithItem: circle1 attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:cell attribute: NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
     [self.view addConstraint: [NSLayoutConstraint constraintWithItem: circle1 attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:cell attribute: NSLayoutAttributeCenterY multiplier:1.0 constant:0]];
     */
}

@end
