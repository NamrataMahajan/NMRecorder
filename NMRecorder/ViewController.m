//
//  ViewController.m
//  NMRecorder
//
//  Created by Namrata on 07/11/16.
//  Copyright © 2016 Namrata Mahajan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

 recordSetting = [[NSMutableDictionary alloc] init];

[recordSetting setValue :[NSNumber numberWithInt:kAudioFormatLinearPCM] forKey:AVFormatIDKey];
[recordSetting setValue:[NSNumber numberWithFloat:44100.0] forKey:AVSampleRateKey];
[recordSetting setValue:[NSNumber numberWithInt: 2] forKey:AVNumberOfChannelsKey];

[recordSetting setValue :[NSNumber numberWithInt:16] forKey:AVLinearPCMBitDepthKey];
[recordSetting setValue :[NSNumber numberWithBool:NO] forKey:AVLinearPCMIsBigEndianKey];
[recordSetting setValue :[NSNumber numberWithBool:NO] forKey:AVLinearPCMIsFloatKey];

NSError *error;



      audioRecorder = [[AVAudioRecorder alloc]initWithURL:[self getRecordURL] settings:recordSetting error:&error];

     if (error) {
    NSLog(@"%@",error.localizedDescription);
}
else {
    NSLog(@"Audio recorder successfully created");
}

}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSString *)getRecordPath {
    return [NSHomeDirectory() stringByAppendingPathComponent:@"record.caf"];
}

-(NSURL *)getRecordURL {
    
    NSLog(@"%@",[self getRecordPath]);
    
    return [NSURL URLWithString:[self getRecordPath]];
}





- (IBAction)ActionRecord:(id)sender {
//    [audioPlayer record];
   [audioRecorder record];
    
    
}

- (IBAction)ActionPlay:(id)sender {
    NSError *error;
    audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:[self getRecordURL] error:&error];
    
    if (error) {
        //
    }
    else {
        [audioPlayer play];
    }
    
}



- (IBAction)ActionStop:(id)sender {
    [audioPlayer stop];
}
@end
