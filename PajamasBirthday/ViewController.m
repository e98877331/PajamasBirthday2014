//
//  ViewController.m
//  PajamasBirthday
//
//  Created by Cheng-yan Yang on 9/30/14.
//  Copyright (c) 2014 towolf. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
NSTimer * timer;
}
@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    


}

-(void)viewDidAppear:(BOOL)animated
{
   
    timer = [NSTimer scheduledTimerWithTimeInterval:0.8
                                             target:self
                                           selector:@selector(rotateImage)
                                           userInfo:nil
                                            repeats:YES];
//    [UIView animateWithDuration:1
//                          delay:0.0
//                        options:UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat | UIViewAnimationOptionCurveEaseInOut
//                     animations:^{
//                         // do whatever animation you want, e.g.,
//                         
//                         CGRect frame = self.birthdayText.frame;
//                         
//                         [self.birthdayText setFrame:CGRectMake(frame.origin.x
//                                                                , frame.origin.y +5, frame.size.width, frame.size.height)];
//                     }
//                     completion:NULL];
//    

    
    
    
    NSString *keyPath = @"transform.translation.y";
    CABasicAnimation *wave1ScaleAnimation = [CABasicAnimation animationWithKeyPath:keyPath];
    wave1ScaleAnimation.toValue = [NSNumber numberWithFloat:5];
    wave1ScaleAnimation.duration = 0.5;
    //infinity loop
    wave1ScaleAnimation.repeatCount = HUGE_VALF;
    //totally 2 second per cycle
    wave1ScaleAnimation.autoreverses = YES;
    wave1ScaleAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [self.birthdayText.layer addAnimation:wave1ScaleAnimation forKey:@"RecordingAnimation"];

    
    NSString *keyPath2 = @"transform.scale";
    CABasicAnimation *scale = [CABasicAnimation animationWithKeyPath:keyPath2];
    scale.toValue = [NSNumber numberWithFloat:0.8];
    scale.duration = 2;
    //infinity loop
    scale.repeatCount = HUGE_VALF;
    //totally 2 second per cycle
    scale.autoreverses = YES;
    scale.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [self.heart.layer addAnimation:scale forKey:@"scaleAnimation"];

}


int imageState = 0;
-(void)rotateImage
{
    //NSLog(@"tic tic");
    if(!imageState)
    {
    self.wolfyImage.transform = CGAffineTransformMakeRotation(.3);
    self.pajamasImage.transform =CGAffineTransformMakeRotation(.3);
        imageState = 1;
    }
    else
    {
        self.wolfyImage.transform = CGAffineTransformMakeRotation(-0.1);
        self.pajamasImage.transform =CGAffineTransformMakeRotation(-0.1);
        imageState = 0;
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
