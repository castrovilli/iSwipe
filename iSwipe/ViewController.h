//
//  ViewController.h
//  iSwipe
//
//  Created by Tedi Fibri on 4/1/13.
//  Copyright (c) 2013 tediscript. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *tapImageOutlet;

@property (strong, nonatomic) UISwipeGestureRecognizer *swipeGestureRecognizerRight;
@property (strong, nonatomic) UISwipeGestureRecognizer *swipeGestureRecognizerLeft;

@property (strong, nonatomic) NSArray *images;
@property NSInteger currentIndex;

@end
