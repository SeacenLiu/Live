//
//  SCLivePushViewController.m
//  RTMPLive
//
//  Created by SeacenLiu on 2020/6/30.
//  Copyright © 2020 SeacenLiu. All rights reserved.
//

#import "SCLivePushViewController.h"

// RTMP
#import "LFLiveKit.h"

@interface SCLivePushViewController () <LFLiveSessionDelegate>

// Base
@property (weak, nonatomic) IBOutlet UIView *localVideoView;
@property (weak, nonatomic) IBOutlet UILabel *roomIdLabel;
@property (weak, nonatomic) IBOutlet UIImageView *videoMutedTipsView;

// RTMP
@property (nonatomic, strong) LFLiveSession *liveSession;

@end

@implementation SCLivePushViewController

#pragma mark - action

- (IBAction)onSwitchCameraClicked:(UIButton *)sender {
    
}

- (IBAction)onResolutionClicked:(UIButton *)sender {
    
}

- (IBAction)onMicCaptureClicked:(UIButton *)sender {
    
}

- (IBAction)onVideoCaptureClicked:(UIButton *)sender {
    
}

- (IBAction)onDashboardClicked:(UIButton *)sender {
    
}

#pragma mark - view life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // RTMP
    [self configRTMPPusher];
    [self startRTMPPushStream];
}

#pragma mark - Live
- (void)configRTMPPusher {
    LFLiveAudioConfiguration *audioConfig = [LFLiveAudioConfiguration defaultConfiguration];
    LFLiveVideoConfiguration *videoConfig = [LFLiveVideoConfiguration defaultConfiguration];
    _liveSession = [[LFLiveSession alloc] initWithAudioConfiguration:audioConfig
                                                  videoConfiguration:videoConfig];
    _liveSession.preView = self.localVideoView;
    _liveSession.delegate = self;
    _liveSession.running = YES;
}

- (void)startRTMPPushStream {
#warning RTMP URL
    LFLiveStreamInfo *streamInfo = [LFLiveStreamInfo new];
    streamInfo.url = @"rtmp://192.168.1.103:1935/live/test";
    [self.liveSession startLive:streamInfo];
}

#pragma mark - LFLiveSessionDelegate
- (void)liveSession:(nullable LFLiveSession *)session liveStateDidChange:(LFLiveState)state {
    
}

- (void)liveSession:(nullable LFLiveSession *)session debugInfo:(nullable LFLiveDebug*)debugInfo {
    
}

- (void)liveSession:(nullable LFLiveSession*)session errorCode:(LFLiveSocketErrorCode)errorCode {
    
}

@end
