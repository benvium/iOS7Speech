//
//  CVViewController.m
//  SpeechTest
//
//  Created by Benjamin Clayton on 23/09/2013.
//  Copyright (c) 2013 Calvium Ltd. All rights reserved.
//

#import "CVViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface CVViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property(nonatomic) AVSpeechSynthesizer *sp;
@end

@implementation CVViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.sp = [[AVSpeechSynthesizer alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)cancelSpeech:(id)sender {
    if (self.sp.isSpeaking) {
        [self.sp stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
    }
}

- (IBAction)speak:(id)sender {
    if (self.sp.isSpeaking) {
        [self.sp stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
    }
    AVSpeechUtterance *ut = [[AVSpeechUtterance alloc] initWithString:self.textField.text];

    [self.sp speakUtterance:ut];


}

@end
