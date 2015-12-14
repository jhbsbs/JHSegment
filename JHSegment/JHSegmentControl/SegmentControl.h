//
//  SegmentControl.h
//  GameSearch
//
//  Created by MacBook Pro on 15-4-30.
//  Copyright (c) 2015年 JunHaoBsBs. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SegmentControl;

typedef void (^selectBlock)(NSInteger index,SegmentControl* control);

@interface SegmentControl : UIView

@property (nonatomic,strong) NSArray* titles;
@property (nonatomic,copy) selectBlock eventBlock;
@property (nonatomic,assign) NSInteger selectIndex;
@property (nonatomic,strong) UIView* lineV;
@property (nonatomic,assign) NSInteger secondClickTimes;
@property (nonatomic,assign) NSInteger thirdClickTimes;
@property (nonatomic,assign) NSInteger forthClickTimes;

-(void)setup;

-(id)initWithTitles:(NSArray*)titles frame:(CGRect)frame;

@end
