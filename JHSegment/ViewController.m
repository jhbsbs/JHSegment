//
//  ViewController.m
//  JHSegment
//
//  Created by Aily on 15/12/14.
//  Copyright © 2015年 Aily. All rights reserved.
//

#import "ViewController.h"
#import "SegmentControl.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()
@property (nonatomic,strong) UIScrollView* scrollView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight-64)];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.contentSize = CGSizeMake(320*4, 0);
    self.scrollView.scrollEnabled = NO;
    [self.view addSubview:self.scrollView];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self firstView];
    [self secondView];
    [self thirdView];
    [self forthView];
    
    SegmentControl* seg = [[SegmentControl alloc]initWithTitles:@[@"firstview",@"secondview",@"thirdview",@"forthview"] frame:CGRectMake(0, 64, ScreenWidth, 32)];
    seg.tag = 1221;
    seg.eventBlock = ^(NSInteger index,SegmentControl* segment){
        
        switch (index) {
            case 0:
                [self.scrollView setContentOffset:CGPointMake(0, 0)];
                break;
            case 1:
                [self.scrollView setContentOffset:CGPointMake(ScreenWidth, 0)];
                break;
            case 2:
                [self.scrollView setContentOffset:CGPointMake(ScreenWidth*2, 0)];
                break;
            case 3:
                [self.scrollView setContentOffset:CGPointMake(ScreenWidth*3, 0)];
                break;
            default:
                break;
        }
    };
    [self.view addSubview:seg];
}

-(void)firstView{
    
    UIView* firstView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    firstView.backgroundColor = [UIColor yellowColor];
    UILabel* firstLab = [[UILabel alloc]init];
    firstLab.text = @"视图1";
    firstLab.frame = CGRectMake(0, 0, 120, 30);
    firstLab.center = CGPointMake(ScreenWidth/2, ScreenHeight/2);
    [firstView addSubview:firstLab];
    [_scrollView addSubview:firstView];
}

-(void)secondView{
    
    UIView* firstView = [[UIView alloc]initWithFrame:CGRectMake(ScreenWidth, 0, ScreenWidth, ScreenHeight)];
    firstView.backgroundColor = [UIColor brownColor];
    UILabel* firstLab = [[UILabel alloc]init];
    firstLab.center = CGPointMake(ScreenWidth*2/2, ScreenHeight/2);
    firstLab.text = @"视图2";
    firstLab.frame = CGRectMake(ScreenWidth, 0, 120, 30);
    [firstView addSubview:firstLab];
    [_scrollView addSubview:firstView];
}

-(void)thirdView{
    
    UIView* firstView = [[UIView alloc]initWithFrame:CGRectMake(ScreenWidth*2, 0, ScreenWidth, ScreenHeight)];
    firstView.backgroundColor = [UIColor redColor];
    UILabel* firstLab = [[UILabel alloc]init];
    firstLab.center = CGPointMake(ScreenWidth*3/2, ScreenHeight/2);
    firstLab.text = @"视图3";
    firstLab.frame = CGRectMake(ScreenWidth*2, 0, 120, 30);
    [firstView addSubview:firstLab];
    [_scrollView addSubview:firstView];
}

-(void)forthView{
    
    UIView* firstView = [[UIView alloc]initWithFrame:CGRectMake(ScreenWidth*3, 0, ScreenWidth, ScreenHeight)];
    firstView.backgroundColor = [UIColor greenColor];
    UILabel* firstLab = [[UILabel alloc]init];
    firstLab.center = CGPointMake(ScreenWidth*4/2, ScreenHeight/2);
    firstLab.text = @"视图4";
    firstLab.frame = CGRectMake(ScreenWidth*3, 0, 120, 30);
    [firstView addSubview:firstLab];
    [_scrollView addSubview:firstView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
