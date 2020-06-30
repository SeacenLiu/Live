//
//  SCLiveListViewController.m
//  RTMPLive
//
//  Created by SeacenLiu on 2020/6/30.
//  Copyright © 2020 SeacenLiu. All rights reserved.
//

#import "SCLiveListViewController.h"
#import "SCLivePushViewController.h"

@interface SCLiveListViewController ()

@property (weak, nonatomic) IBOutlet UITableView *liveRoomTableView;

@end

@implementation SCLiveListViewController

#pragma mark - action
- (IBAction)startLiveBtnClick:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Live" bundle:nil];
    SCLivePushViewController *vc = (SCLivePushViewController*)[storyboard instantiateViewControllerWithIdentifier:@"SCLivePushViewControllerId"];
    [self presentViewController:vc animated:YES completion:nil];
}

#pragma mark - view life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
