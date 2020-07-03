//
//  SCLivePlayViewController.m
//  RTMPLive
//
//  Created by SeacenLiu on 2020/6/30.
//  Copyright © 2020 SeacenLiu. All rights reserved.
//

#import "SCLivePlayViewController.h"

// ijkplayer
#import "IJKFFMoviePlayerController.h"

@interface SCLivePlayViewController ()

@property (weak, nonatomic) IBOutlet UILabel *roomIdLabel;
@property (weak, nonatomic) IBOutlet UIView *videoMutedTipsView;
@property (weak, nonatomic) IBOutlet UIButton *switchCameraButton;

@property (weak, nonatomic) IBOutlet UIView *roomOwnerVideoView;

@property (nonatomic, strong) IJKFFMoviePlayerController *player;

@end

@implementation SCLivePlayViewController

#pragma mark - action
- (IBAction)onLinkMicClicked:(id)sender {
    
}

- (IBAction)onSwitchCameraClicked:(id)sender {
    
}

- (IBAction)onMuteRoomOwnerAudioClicked:(id)sender {
    
}

- (IBAction)onMuteRoomOwnerVideoClicked:(id)sender {
    
}

- (IBAction)onDashboardClicked:(id)sender {
    
}


#pragma mark - ijkplayer
- (void)configIJKPlayer {
    if (self.player)
    [IJKFFMoviePlayerController checkIfFFmpegVersionMatch:YES];
    IJKFFOptions *options = [IJKFFOptions optionsByDefault];
    self.player = [[IJKFFMoviePlayerController alloc] initWithContentURLString:@"rtmp://192.168.31.28:1935/live/test" withOptions:options];
    self.player.view.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    self.player.view.frame = self.view.bounds;
    self.player.scalingMode = IJKMPMovieScalingModeAspectFit;
    self.player.shouldAutoplay = YES;
    self.view.autoresizesSubviews = YES;
    [self.view addSubview:self.player.view];
}

#pragma mark - view life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configIJKPlayer];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.player prepareToPlay];
    [self.player play];
}

- (void)viewWillDisAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.player pause];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.player shutdown];
}

@end

