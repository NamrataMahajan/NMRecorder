//
//  ViewController.h
//  NMRecorder
//
//  Created by Namrata on 07/11/16.
//  Copyright © 2016 Namrata Mahajan. All rights reserved.
//

#import <UIKit/UIKit.h>
@import AVFoundation;

@interface ViewController : UIViewController
{
    AVAudioPlayer *audioPlayer;
    AVAudioRecorder *audioRecorder;
    NSMutableDictionary *recordSetting;
}
- (IBAction)ActionRecord:(id)sender;
- (IBAction)ActionPlay:(id)sender;

- (IBAction)ActionStop:(id)sender;

@end

