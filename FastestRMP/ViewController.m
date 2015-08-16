//
//  ViewController.m
//  FastestRMP
//
//  Created by Arsalan Vakili on 2015-06-18.
//  Copyright (c) 2015 Arsalan Vakili. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *displayTheSpeed;
@property(nonatomic,assign) CGFloat speed;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.speed = 0;
    _needle.transform= CGAffineTransformRotate(self.needle.transform, 45 * M_PI/180);
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)RMPMover:(UIPanGestureRecognizer *)recognizer {
    
    CGPoint velocity= [recognizer velocityInView:self.view];
   self.speed= sqrtf((velocity.x * velocity.x)+ (velocity.y * velocity.y));
    
    CGFloat angle = self.speed / 6000 * M_PI * 2;
    
    
    if ([recognizer state] == UIGestureRecognizerStateBegan) {
        _needle.transform = CGAffineTransformMakeRotation(360);
    }
    
    
    if ([recognizer state] == UIGestureRecognizerStateChanged) {
        
        
        _needle.transform = CGAffineTransformMakeRotation(angle);
        
        NSString *speedString = [NSString stringWithFormat:@"Highest speed is: %f",self.speed];
        
        self.displayTheSpeed.text = speedString;
        
        NSLog(@"the speed is %f", self.speed);
    }
    
    
    if ([recognizer state] == UIGestureRecognizerStateEnded || [recognizer state] == UIGestureRecognizerStateFailed || [recognizer state] == UIGestureRecognizerStateCancelled){
        
           // checking for different states whether and animating back to our original position
        [UIView animateWithDuration:2
                              delay:0.1
                            options:0
                         animations:^{
                             _needle.transform= CGAffineTransformMakeRotation(45 * M_PI/180);
                         }
                         completion:^(BOOL finished){
                             NSLog(@"Done!");
                         }];
        
    }
}


@end


