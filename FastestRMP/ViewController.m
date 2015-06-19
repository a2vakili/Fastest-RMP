//
//  ViewController.m
//  FastestRMP
//
//  Created by Arsalan Vakili on 2015-06-18.
//  Copyright (c) 2015 Arsalan Vakili. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//{
//    NSDate *lastCalled;
//}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _needle.transform= CGAffineTransformRotate(self.needle.transform, 45*M_PI/180);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)RMPMover:(UIPanGestureRecognizer *)recognizer {
    
    CGPoint velocity= [recognizer velocityInView:self.view];
    CGFloat speed= sqrtf((velocity.x * velocity.x)+ (velocity.y * velocity.y));
    
    CGFloat angle = speed / 9000 * M_PI * 2;
    
    
    if ([recognizer state] == UIGestureRecognizerStateChanged) {
        
//        NSDate *nowDate = [NSDate date];
//        
//        NSTimeInterval difference = [nowDate timeIntervalSinceDate:lastCalled];
//        
//        lastCalled = nowDate;
        
        _needle.transform = CGAffineTransformMakeRotation(angle);
//         _needle.transform= CGAffineTransformRotate(self.needle.transform, angle);
        
        NSLog(@"the speed is %f", speed);
    }
    
//    else if (speed >200){
//        _needle.transform= CGAffineTransformRotate(self.needle.transform, 4*M_PI/180);
//        
//    }
//    else if (speed >300){
//        _needle.transform= CGAffineTransformRotate(self.needle.transform, 6*M_PI/180);
//    }
//    
//    else if (speed > 400){
//        _needle.transform= CGAffineTransformRotate(self.needle.transform, 8*M_PI/180);
    //}
    if ([recognizer state] == UIGestureRecognizerStateEnded){
      
        
        [UIView animateWithDuration:1
                              delay:0.0
                            options:0
                         animations:^{
                            _needle.transform= CGAffineTransformMakeRotation(45*M_PI/180);
                         }
                         completion:^(BOOL finished){
                             NSLog(@"Done!");
                         }];


    }
}


@end


