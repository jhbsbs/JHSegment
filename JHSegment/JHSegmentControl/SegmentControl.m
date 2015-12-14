//
//  SegmentControl.m
//  GameSearch
//
//  Created by MacBook Pro on 15-4-30.
//  Copyright (c) 2015年 JunHaoBsBs. All rights reserved.
//

#import "SegmentControl.h"

#define buttonHeight 30.0f
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define height 32.0f
#define FONT(a) [UIFont systemFontOfSize:a]
#define RGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]

@interface SegmentControl()

@property (nonatomic,assign) NSInteger currSelectIndex;//当前点击

@end

static NSUInteger const XJHSegmentControlTag = 16789;
@implementation SegmentControl

-(id)initWithFrame:(CGRect)frame
{
    
    self = [super initWithFrame:frame];
    if(self)
    {
        self.selectIndex = 0;
        self.currSelectIndex = 0;
        self.secondClickTimes = 0;
        self.thirdClickTimes = 0;
        self.forthClickTimes = 0;
        self.clipsToBounds = YES;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

-(id)initWithTitles:(NSArray*)titles frame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    self.titles = titles;
    if(self)
    {
        self.selectIndex = 0;
        self.currSelectIndex = 0;
        self.clipsToBounds = YES;
        self.backgroundColor = [UIColor whiteColor];
        [self setup];
    }
    return self;
}

-(void)setup
{
    [self addLine];
    self.lineV.frame = CGRectMake(0, 31, ScreenWidth/self.titles.count, 1);
    NSInteger itemCount = self.titles.count;
    int buttonWidth = ScreenWidth/itemCount;
    for(int i=0;i<itemCount;i++){
        
        UIButton* button = [[UIButton alloc]initWithFrame:CGRectMake(i*buttonWidth, 0, buttonWidth, buttonHeight)];
        
        [button setTitle:[self.titles objectAtIndex:i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:RGB(254, 102, 0) forState:UIControlStateSelected];
        button.titleLabel.font = FONT(14);
        button.titleLabel.textAlignment = NSTextAlignmentCenter;
        [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        button.tag = XJHSegmentControlTag+i;
        [self addSubview:button];
    
        if(i == 0)
        {
            button.selected = YES;
        }
    }
}


-(void)click:(UIButton*)button
{
    if(button.tag == XJHSegmentControlTag+1){
        
        self.secondClickTimes++;
    }else if(button.tag == XJHSegmentControlTag+2){
        
        self.thirdClickTimes++;
    }else if(button.tag == XJHSegmentControlTag+3){
        
        self.forthClickTimes++;
    }
    
    NSInteger index = button.tag-XJHSegmentControlTag;
    
    button.selected = YES;
    UIButton *lastBtn = (UIButton *)[self viewWithTag:(XJHSegmentControlTag+_currSelectIndex)];
    if(lastBtn == button){
        [lastBtn setSelected:YES];
    }else{
        [lastBtn setSelected:NO];
    }
    _currSelectIndex = index;
    
    [UIView animateWithDuration:0.2 animations:^{
        self.lineV.frame = CGRectMake(button.frame.origin.x, 31, ScreenWidth/self.titles.count, 1);
    } completion:^(BOOL finished) {
        if(self.eventBlock){
            self.eventBlock(index,self);
        }
    }];
}

-(void)addLine
{
    self.lineV = [[UIView alloc]init];
    self.lineV.backgroundColor = RGB(254, 102, 0);
    [self addSubview:self.lineV];
}

@end
