//
//  testViewController.m
//  notice
//
//  Created by Smile on 2018/3/22.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "testViewController.h"

@interface testViewController ()
{
    UILabel *Label;
}
@end

@implementation testViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    
    UIButton *But = [[UIButton alloc]init];
    But.frame = CGRectMake(50,50,80,40);
    [But setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [But setTitle:@"我要传值" forState:UIControlStateNormal];
    But.titleLabel.textAlignment = NSTextAlignmentCenter;
    But.backgroundColor = [UIColor whiteColor];
    [But.titleLabel setFont:[UIFont fontWithName:@"STHeitiSC-Medium" size:12]];
    [But addTarget:self action:@selector(ButMethods) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:But];
    
    UIButton *Butx = [[UIButton alloc]init];
    Butx.frame = CGRectMake(50,180,80,40);
    [Butx setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [Butx setTitle:@"我要回VC" forState:UIControlStateNormal];
    Butx.titleLabel.textAlignment = NSTextAlignmentCenter;
    Butx.backgroundColor = [UIColor whiteColor];
    [Butx.titleLabel setFont:[UIFont fontWithName:@"STHeitiSC-Medium" size:12]];
    [Butx addTarget:self action:@selector(ButxMethods) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:Butx];
    
    Label  = [[UILabel alloc] initWithFrame:CGRectMake(75, 250, 200, 50)];
    Label.text=@"我是要传的数据label";
    Label.font = [UIFont fontWithName:@"STHeitiSC-Light" size:18];
    Label.textColor = [UIColor blackColor];
    Label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:Label];
}

- (void)ButMethods
{
    //添加 字典，将label的值通过key值设置传递
    
    NSDictionary *dict =[[NSDictionary alloc]initWithObjectsAndKeys:Label.text,@"textOne",Label.text,@"textTwo",nil];
    
    //创建通知
    // NSNotification 有三个属性，name, object, userInfo，其中最关键的object就是从第三个界面传来的数据。name就是通知事件的名字， userInfo一般是事件的信息。
    NSNotification *notification =[NSNotification notificationWithName:@"tongzhi" object:nil userInfo:dict];
    
    //通过通知中心发送通知
    
    [[NSNotificationCenter defaultCenter] postNotification:notification];
    
    [self.navigationController popViewControllerAnimated:YES];
    
    return;
}

- (void)ButxMethods
{
    [self dismissViewControllerAnimated:YES completion:nil];
    return;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
