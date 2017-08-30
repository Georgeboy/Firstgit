//
//  ViewController.m
//  animation
//
//  Created by apple on 15/11/17.
//  Copyright © 2015年 George. All rights reserved.
//

#import "ViewController.h"
#import "MainViewController.h"
@interface ViewController ()
@property (strong,nonatomic) UIView *scaleView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(20, 200, 200, 60)];
    view.backgroundColor = [UIColor redColor];
    self.scaleView = view;
    view.hidden = YES;
    [self.view addSubview:view];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 100, 320, 60);
    button.backgroundColor = [UIColor greenColor];
    [button addTarget:self action:@selector(scale) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)scale
{
    self.scaleView.hidden = NO;
    self.scaleView.transform = CGAffineTransformMakeScale(0.01f, 0.01f);//将要显示的view按照正常比例显示出来
    [UIView beginAnimations:nil context:UIGraphicsGetCurrentContext()];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];  //InOut 表示进入和出去时都启动动画
    [UIView setAnimationDuration:0.5f];//动画时间
    self.scaleView.transform=CGAffineTransformMakeScale(1.0f, 1.0f);//先让要显示的view最小直至消失
    [UIView commitAnimations]; //启动动画
    
    CATransition *myTranstiton = [CATransition animation];
    myTranstiton.duration = 0.5;
    myTranstiton.type = kCATransitionMoveIn;
    myTranstiton.subtype = kCATransitionFromTop;
    [self.view.superview.layer  addAnimation:myTranstiton forKey:nil ];
    
//    UINavigationController *nav  = [[UINavigationController alloc]initWithRootViewController:self];
    
    MainViewController * _mainViewController=[[MainViewController alloc] init];
//    [self presentModalViewController:_mainViewController animated:YES];
//    [nav pushViewController:_mainViewController animated:NO];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
