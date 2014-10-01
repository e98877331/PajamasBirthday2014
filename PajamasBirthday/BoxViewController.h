//
//  BoxViewController.h
//  PajamasBirthday
//
//  Created by Cheng-yan Yang on 10/2/14.
//  Copyright (c) 2014 towolf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface BoxViewController : UIViewController <AVAudioPlayerDelegate>
@property (weak, nonatomic) IBOutlet UIButton *cathandBtn;
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;

@end
