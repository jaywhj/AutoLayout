//
//  ViewController.h
//  AutoLayout
//
//  Created by JayWon on 14-11-13.
//  Copyright (c) 2014年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

//图形化工具 storyboard/xib 自动布局


//频繁变更的视图最好直接使用代码书写布局，因为在图形化工具里面一旦你勾选了autolayout，那么storyboard中的所有视图都将autolayout。而当你需要变更视图布局时，则必须使用以下语句来避免为你的视图新增默认autolayout约束。
/*
[view setTranslatesAutoresizingMaskIntoConstraints:NO];
[superview setTranslatesAutoresizingMaskIntoConstraints:NO];
*/

@end

