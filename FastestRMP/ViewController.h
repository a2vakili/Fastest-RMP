//
//  ViewController.h
//  FastestRMP
//
//  Created by Arsalan Vakili on 2015-06-18.
//  Copyright (c) 2015 Arsalan Vakili. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{

}


@property (weak, nonatomic) IBOutlet UIImageView *needle;

- (IBAction)RMPMover:(UIPanGestureRecognizer *)recognizer;


@end

