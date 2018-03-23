//
//  ViewController.m
//  notice
//
//  Created by Smile on 2018/3/22.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ViewController.h"
#import "testViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor blueColor];
    
    UIButton *But = [[UIButton alloc]init];
    But.frame = CGRectMake(50,50,80,40);
    [But setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [But setTitle:@"记得删除通知" forState:UIControlStateNormal];
    But.titleLabel.textAlignment = NSTextAlignmentCenter;
    But.backgroundColor = [UIColor whiteColor];
    [But.titleLabel setFont:[UIFont fontWithName:@"STHeitiSC-Medium" size:12]];
    [But addTarget:self action:@selector(ButMethods) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:But];
    
    UIButton *Butx = [[UIButton alloc]init];
    Butx.frame = CGRectMake(50,180,80,40);
    [Butx setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [Butx setTitle:@"我要去新VC" forState:UIControlStateNormal];
    Butx.titleLabel.textAlignment = NSTextAlignmentCenter;
    Butx.backgroundColor = [UIColor whiteColor];
    [Butx.titleLabel setFont:[UIFont fontWithName:@"STHeitiSC-Medium" size:12]];
    [Butx addTarget:self action:@selector(ButxMethods) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:Butx];
    
    //注册通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tongzhi:)name:@"tongzhi" object:nil];

}

- (void)ButxMethods
{
    testViewController *controller = [[testViewController alloc] init];
    [self presentViewController:controller animated:YES completion:nil];
    return;
}

- (void)ButMethods
{
    //移除当前对象的通知
     [[NSNotificationCenter defaultCenter] removeObserver:self];
    //删除通知
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"tongzhi" object:self];

    return;
}

- (void)tongzhi:(NSNotification *)text{
    
    NSLog(@"%@",text.userInfo[@"textOne"]);
    
    NSLog(@"－－－－－接收到通知------");
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
