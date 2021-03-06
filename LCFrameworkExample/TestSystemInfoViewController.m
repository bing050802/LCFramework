//
//  TestSystemInfoViewController.m
//  LCFramework

//  Created by 郭历成 ( titm@tom.com ) on 13-9-26.
//  Copyright (c) 2014年 Licheng Guo iOS developer ( http://nsobject.me ).All rights reserved.
//  Also see the copyright page ( http://nsobject.me/copyright.rtf ).
//
//

#import "TestSystemInfoViewController.h"
#import "TestSubTitleCell.h"

@interface TestSystemInfoViewController ()

@property(nonatomic,retain) NSArray * datasource;

@end

@implementation TestSystemInfoViewController

-(void) dealloc
{
    LC_RELEASE(_datasource);
    LC_SUPER_DEALLOC();
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.title = @"系统信息";
    
    self.datasource = @[
                            LC_NSSTRING_FORMAT(@"运行次数 && %d",[LC_SystemInfo applicationRunsNumber]),
                            LC_NSSTRING_FORMAT(@"App version && %@",[LC_SystemInfo appVersion]),
                            LC_NSSTRING_FORMAT(@"App identifier && %@",[LC_SystemInfo appIdentifier]),
                            LC_NSSTRING_FORMAT(@"Device model && %@",[LC_SystemInfo deviceModel]),
                            LC_NSSTRING_FORMAT(@"Device UUID && %@",[LC_SystemInfo deviceUUID]),
                            LC_NSSTRING_FORMAT(@"是否是Phone(iPhone,iPod,iTouch) && %d",[LC_SystemInfo isDevicePhone]),
                            LC_NSSTRING_FORMAT(@"是否是Pad && %d",[LC_SystemInfo isDevicePad]),
                            
                      ];
    
    [self setEdgesForExtendedLayoutNoneStyle];
    
    [self showBarButton:NavigationBarButtonTypeLeft
                  title:@""
                  image:[UIImage imageNamed:@"navbar_btn_back.png" useCache:YES]
            selectImage:nil];
}


-(void) navigationBarButtonClick:(NavigationBarButtonType)type
{
    if (type == NavigationBarButtonTypeLeft) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

-(float) tableView:(LC_UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

-(int) tableView:(LC_UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}

-(LC_UITableViewCell *) tableView:(LC_UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TestSubTitleCell * cell = [tableView autoCreateDequeueReusableCellWithIdentifier:@"cell" andClass:[TestSubTitleCell class]];

    NSString * titleString = [self.datasource objectAtIndex:indexPath.row];
    NSArray  * titleArray  = [titleString componentsSeparatedByString:@"&&"];

    
    [cell setTitle:[titleArray objectAtIndex:0]
          subTitle:[titleArray objectAtIndex:1]];
    
    return cell;
}

@end
