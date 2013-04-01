//
//  ViewController.m
//  iSwipe
//
//  Created by Tedi Fibri on 4/1/13.
//  Copyright (c) 2013 tediscript. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize swipeGestureRecognizerRight;
@synthesize swipeGestureRecognizerLeft;
@synthesize images;
@synthesize currentIndex;
@synthesize tapImageOutlet;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.swipeGestureRecognizerRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
    self.swipeGestureRecognizerRight.direction = UISwipeGestureRecognizerDirectionRight;
    self.swipeGestureRecognizerRight.numberOfTouchesRequired = 1;
    [self.tapImageOutlet addGestureRecognizer:self.swipeGestureRecognizerRight];
    
    self.swipeGestureRecognizerLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
    self.swipeGestureRecognizerLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    self.swipeGestureRecognizerLeft.numberOfTouchesRequired = 1;
    [self.tapImageOutlet addGestureRecognizer:self.swipeGestureRecognizerLeft];
    
    self.images = [NSArray arrayWithObjects:[UIImage imageNamed:@"image0.jpg"], [UIImage imageNamed:@"image1.jpg"], [UIImage imageNamed:@"image2.jpg"], [UIImage imageNamed:@"image3.jpg"], [UIImage imageNamed:@"image4.jpg"], nil];
    currentIndex = 0;
    
    NSLog(@"%d", [self.images count]);
    
    [self refreshImageView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)handleSwipes:(UISwipeGestureRecognizer *) paramSender {
    if(paramSender.direction & UISwipeGestureRecognizerDirectionRight) {
        currentIndex = currentIndex - 1;
        if(currentIndex < 0) {
            currentIndex = [images count] - 1;
        }
        [self refreshImageView];
    }
    if(paramSender.direction & UISwipeGestureRecognizerDirectionLeft) {
        currentIndex = currentIndex + 1;
        if(currentIndex > ([images count] - 1)) {
            currentIndex = 0;
        }
        [self refreshImageView];
    }
}

- (void) refreshImageView {
    NSLog(@"Current index: %d", currentIndex);
    self.tapImageOutlet.image = [self.images objectAtIndex:currentIndex];
}

@end
