//
//  LGSemiModalNavViewController.h
//  6th Man Apps LLC
//
//  Created by Luke Geiger on 7/13/15.
//  Copyright (c) 2016 6th Man Apps LLC. All rights reserved.
//

#import "LGSemiModalNavViewController.h"

@interface LGSemiModalNavViewController ()

@end

@implementation LGSemiModalNavViewController

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

#pragma mark - Life

- (void)loadView{
    [super loadView];
    
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.view.clipsToBounds = YES;
    self.transitioningDelegate = self;
    self.modalPresentationStyle = UIModalPresentationCustom;
    self.modalPresentationCapturesStatusBarAppearance = YES;
    [self defaults];
}

-(void)defaults{
    _tapDismissEnabled = YES;
    _animationSpeed = 0.15f;
    _backgroundShadeColor = [UIColor blackColor];
    _scaleTransform = CGAffineTransformMakeScale(.9, .9);
    _backgroundShadeAlpha = 0.4;
}

#pragma mark - Actions

- (void)dismissWasTapped{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UIViewControllerTransitioningDelegate Methods

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting
                                                                      sourceController:(UIViewController *)source {
    return [self transitionPresenting:YES];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [self transitionPresenting:NO];
}

-(LGSemiModalTransition*)transitionPresenting:(BOOL)presenting{
    LGSemiModalTransition *animator = [LGSemiModalTransition new];
    animator.presenting = presenting;
    animator.tapDismissEnabled = _tapDismissEnabled;
    animator.animationSpeed = _animationSpeed;
    animator.backgroundShadeColor = _backgroundShadeColor;
    animator.scaleTransform = _scaleTransform;
    animator.backgroundShadeAlpha = _backgroundShadeAlpha;
    return animator;
}

@end
