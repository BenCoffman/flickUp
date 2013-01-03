//
//  BCViewController.m
//  flickslider
//
//  Created by Coffman, Ben on 12/5/12.
//  Copyright (c) 2012 Coffman, Ben. All rights reserved.
//

#import "BCViewController.h"

@interface BCViewController (){
    UIPanGestureRecognizer *_panGestureRecognizer;
    CGFloat                 _xSteady;
}

@end

@implementation BCViewController

@synthesize flickView = _flickView;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    _panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanFrom:)];
    [self.flickView addGestureRecognizer:_panGestureRecognizer];
    
    _xSteady = self.flickView.center.x;
    NSLog(@"Center: %f", self.flickView.center.x);
    NSLog(@"Center: %f", self.flickView.center.y);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)handlePanFrom:(UIPanGestureRecognizer *)recognizer{
    CGPoint translation = [recognizer translationInView:recognizer.view];
    CGPoint velocity    = [recognizer velocityInView:recognizer.view];
    
    
    
    if (recognizer.state == UIGestureRecognizerStateBegan) {
    }
    else if (recognizer.state == UIGestureRecognizerStateChanged) {
        CGPoint tempPoint;
        tempPoint = [recognizer locationInView:self.view];
        NSLog(@"point %f", tempPoint.y);
        NSLog(@"center %f", self.flickView.center.y);
        
        self.flickView.center = CGPointMake(160, tempPoint.y + 220);
        
    }
    else if (recognizer.state == UIGestureRecognizerStateEnded) {
        CGPoint tempPoint;
        tempPoint = [recognizer locationInView:self.view];
        
        if (velocity.x > 5)
        {
            [UIView animateWithDuration:.3 delay:0
                                options:UIViewAnimationOptionCurveEaseOut
                             animations:^ {
                                 self.flickView.center = CGPointMake(160, 300);
                             }
                             completion:NULL];
        }
        else if (tempPoint.y < 254) {
            [UIView animateWithDuration:.3 delay:0
                                options:UIViewAnimationOptionCurveEaseOut
                             animations:^ {
                                 self.flickView.center = CGPointMake(160, 300);
                             }
                             completion:NULL];
        }
        else {
            [UIView animateWithDuration:.3 delay:0
                                options:UIViewAnimationOptionCurveEaseOut
                             animations:^ {
                                 self.flickView.center = CGPointMake(160, 619);
                             }
                             completion:NULL];
        }
    }
}

    

@end
