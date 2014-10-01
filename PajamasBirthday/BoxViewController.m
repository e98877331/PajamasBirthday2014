//
//  BoxViewController.m
//  PajamasBirthday
//
//  Created by Cheng-yan Yang on 10/2/14.
//  Copyright (c) 2014 towolf. All rights reserved.
//

#import "BoxViewController.h"

@interface BoxViewController ()

@end

@implementation BoxViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    int r = arc4random_uniform(23);
    NSString *fileName = [NSString stringWithFormat:@"miew%d",r];
    
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                         pathForResource:fileName
                                         ofType:@"wav"]];
    
    NSError *error;
    _audioPlayer = [[AVAudioPlayer alloc]
                    initWithContentsOfURL:url
                    error:&error];

    _audioPlayer.volume = 1.0;
    if (error)
    {
        NSLog(@"Error in audioPlayer: %@",
              [error localizedDescription]);
    } else {
        _audioPlayer.delegate = self;
        [_audioPlayer prepareToPlay];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - IBAction


- (IBAction)cathandClick:(id)sender {
    int r = arc4random_uniform(23);
    NSString *fileName = [NSString stringWithFormat:@"miew%d",r];
    
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle]
                                         pathForResource:fileName
                                         ofType:@"wav"]];
    NSLog(fileName);
    NSError *error;
    _audioPlayer =[[AVAudioPlayer alloc]
                   initWithContentsOfURL:url
                   error:&error];
    [_audioPlayer play];

    self.cathandBtn.transform = CGAffineTransformIdentity;
}
- (IBAction)cathandTouchDown:(id)sender {
    self.cathandBtn.transform = CGAffineTransformMakeScale(0.98, 0.98);
}

#pragma mard - AVAudioPlayerDelegate

-(void)audioPlayerDidFinishPlaying:
(AVAudioPlayer *)player successfully:(BOOL)flag
{
}

-(void)audioPlayerDecodeErrorDidOccur:
(AVAudioPlayer *)player error:(NSError *)error
{
    NSLog(@"audio finished");
}

-(void)audioPlayerBeginInterruption:(AVAudioPlayer *)player
{
}

-(void)audioPlayerEndInterruption:(AVAudioPlayer *)player
{
}

@end
