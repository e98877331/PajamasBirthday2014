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
    [UIView animateWithDuration:1
                          delay:0.0
                        options:UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat | UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         // do whatever animation you want, e.g.,
                         
                         CGRect frame = self.birthdayText.frame;
                         
                         [self.birthdayText setFrame:CGRectMake(frame.origin.x
                                                                , frame.origin.y +5, frame.size.width, frame.size.height)];
                     }
                     completion:NULL];
    


}


int imageState = 0;
-(void)rotateImage
{
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
