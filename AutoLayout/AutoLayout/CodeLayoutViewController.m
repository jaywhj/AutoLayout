//
//  CodeLayoutViewController.m
//  AutoLayout
//
//  Created by JayWon on 14-11-14.
//  Copyright (c) 2014年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import "CodeLayoutViewController.h"

@interface CodeLayoutViewController ()

@end

@implementation CodeLayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
#pragma mark - 创建一组约束
    /*
    使用VFL创建一组约束，参数说明:
        第一个参数：使用VFL格式化的字符串，具体语法参考下面的官方链接
        第二个参数：指定VFL中所有对象的布局属性和方向。比如2个视图使用V布局，可以使用 NSLayoutFormatAlignAllLeft 让他们对齐
        第三个参数：度量、指标的字典，字典里面的key可以写在第一个参数中。编译器解析时，自动替换为metrics字典中的value
        第四个参数：指定约束的一个或多个视图
     
    NSArray *constrtArr = [NSLayoutConstraint
                                       constraintsWithVisualFormat:<#(NSString *)#>
                                       options:<#(NSLayoutFormatOptions)#>
                                       metrics:<#(NSDictionary *)#>
                                       views:<#(NSDictionary *)#>];
    */
    
    //可视化格式化语言Visual Format Language
    //https://developer.apple.com/library/ios/documentation/UserExperience/Conceptual/AutolayoutPG/VisualFormatLanguage/VisualFormatLanguage.html#//apple_ref/doc/uid/TP40010853-CH3-SW1
    /*
     语法总结：
     1、"H" 表示水平方向，"V" 表示垂直方向
     2、"|" 表示superview的边界
     3、"[]" 表示view，"()"表示尺寸数，可以多个条件组合，中间使用逗号分隔，如 view(>=70,<=100)
     4、"＠" 表示优先级。如V:|-50@750-[view(55)]，或者写到metrics里面更好
     */
    
    //用代码实现和上一个viewCtrl一样的效果。使用了autolayout就应该忘掉frame，设置了frame也没用
    UIView * leftView = [[UIView alloc] init];
    leftView.backgroundColor = [UIColor colorWithRed:0.720 green:1.000 blue:0.366 alpha:1.000];
    [self.view addSubview:leftView];
    
    UIView * rightView = [[UIView alloc] init];
    rightView.backgroundColor = [UIColor colorWithRed:1.000 green:0.928 blue:0.341 alpha:1.000];
    [self.view addSubview:rightView];
    
    UIView * bottomView = [[UIView alloc] init];
    bottomView.backgroundColor = [UIColor colorWithRed:0.401 green:0.698 blue:0.752 alpha:1.000];
    [self.view addSubview:bottomView];
    
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.backgroundColor = [UIColor grayColor];
    [backButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [backButton setTitle:@"返回" forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [bottomView addSubview:backButton];
    
    
    //关闭 autoresizingMask 转换成 约束
    [leftView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [rightView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [bottomView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [backButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    
    
    
    //设置VFL语言里面的变量和对应的view绑定。就是把所有和布局有关的view都放一起，用哪个取哪个
    NSDictionary *varViews = NSDictionaryOfVariableBindings(leftView, rightView, bottomView, backButton);
    //定义度量，会把VFL里面用到key的地方自动替换成对应的value。 水平方向间隙hSpace为20, 垂直方向间隙vSpace为20, 上边距加上电池条的高度为40
    NSDictionary *metrics = @{@"hSpace":@20, @"vSpace":@20, @"topSpace":@40};
    
    //创建水平方向leftView、rightView的约束：从左至右依次为 -> 在水平方向，边界往右20像素为leftView，leftView再往右20像素为rightView，rightView的宽等于leftView，rightView往右20像素为边界
    NSArray *hTopArr = [NSLayoutConstraint
                        constraintsWithVisualFormat:@"H:|-hSpace-[leftView]-hSpace-[rightView(==leftView)]-hSpace-|"
                        options:NSLayoutFormatDirectionLeadingToTrailing
                        metrics:metrics
                        views:varViews];
    
    //创建水平方向bottomView的约束：从左至右依次为 -> 在水平方向，边界往右20像素为bottomView，bottomView往右20像素为边界
    NSArray *hBottomArr = [NSLayoutConstraint
                           constraintsWithVisualFormat:@"H:|-hSpace-[bottomView]-hSpace-|"
                           options:NSLayoutFormatDirectionLeadingToTrailing
                           metrics:metrics
                           views:varViews];
    
    //创建竖直方向leftView、bottomView的约束：从上到下依次为 -> 在竖直方向上，边界往下40像素为leftView，leftView往下20像素为bottomView，bottomView的高等于leftView，bottomView再往下20像素为边界
    NSArray *vLeftArr = [NSLayoutConstraint
                         constraintsWithVisualFormat:@"V:|-topSpace-[leftView]-vSpace-[bottomView(==leftView)]-vSpace-|"
                         options:NSLayoutFormatDirectionLeadingToTrailing
                         metrics:metrics
                         views:varViews];
    
    //创建竖直方向rightView的约束：从上到下依次为 -> 在竖直方向上，边界往下40像素为rightView，rightView的高等于leftView
    NSArray *vRightArr = [NSLayoutConstraint
                          constraintsWithVisualFormat:@"V:|-topSpace-[rightView(==leftView)]"
                          options:NSLayoutFormatDirectionLeadingToTrailing
                          metrics:metrics
                          views:varViews];
    
    //创建一个存放约束的数组
    NSMutableArray * tempConstraints = [NSMutableArray array];
    [tempConstraints addObjectsFromArray:hTopArr];
    [tempConstraints addObjectsFromArray:hBottomArr];
    [tempConstraints addObjectsFromArray:vLeftArr];
    [tempConstraints addObjectsFromArray:vRightArr];
    
    //给视图添加约束
    [self.view addConstraints:tempConstraints];
    
    
    
#pragma mark - 属性解释
    /*
    typedef NS_ENUM(NSInteger, NSLayoutRelation) {
        NSLayoutRelationLessThanOrEqual = -1,          //小于等于
        NSLayoutRelationEqual = 0,                     //等于
        NSLayoutRelationGreaterThanOrEqual = 1,        //大于等于
    };
    typedef NS_ENUM(NSInteger, NSLayoutAttribute) {
        NSLayoutAttributeLeft = 1,                     //左侧
        NSLayoutAttributeRight,                        //右侧
        NSLayoutAttributeTop,                          //上方
        NSLayoutAttributeBottom,                       //下方
        NSLayoutAttributeLeading,                      //首部
        NSLayoutAttributeTrailing,                     //尾部
        NSLayoutAttributeWidth,                        //宽度
        NSLayoutAttributeHeight,                       //高度
        NSLayoutAttributeCenterX,                      //X轴中心
        NSLayoutAttributeCenterY,                      //Y轴中心
        NSLayoutAttributeBaseline,                     //文本底标线
        
        NSLayoutAttributeNotAnAttribute = 0            //没有属性
    };
    
    //NSLayoutAttributeLeft/NSLayoutAttributeRight 和 NSLayoutAttributeLeading/NSLayoutAttributeTrailing的区别是：left/right永远是指左右，而leading/trailing在某些从右至左习惯的地区（希伯来语等）会变成，leading是右边，trailing是左边
    */
    
    
#pragma mark - 创建一个约束
    
    //设置backButton垂直、水平居中（使用单个约束）
    /*
     1、函数的对照公式为: withItem.attr1 = toItem.attr2 * multiplier + constant
     2、如下翻译过来就是：backButton的中心点x 等于 bottomView的中心点x乘以1 再多0
     3、如果想设置的约束里不需要toItem，要将第四个参数设为nil，第五个参数设为NSLayoutAttributeNotAnAttribute
     */
    NSLayoutConstraint *xBtnLayout = [NSLayoutConstraint
                                      constraintWithItem:backButton
                                      attribute:NSLayoutAttributeCenterX
                                      relatedBy:NSLayoutRelationEqual
                                      toItem:bottomView attribute:NSLayoutAttributeCenterX
                                      multiplier:1
                                      constant:0];
    NSLayoutConstraint *yBtnLayout = [NSLayoutConstraint
                                      constraintWithItem:backButton
                                      attribute:NSLayoutAttributeCenterY
                                      relatedBy:NSLayoutRelationEqual
                                      toItem:bottomView attribute:NSLayoutAttributeCenterY
                                      multiplier:1
                                      constant:0];
    [bottomView addConstraints:@[xBtnLayout, yBtnLayout]];
    
}

#pragma mark - 自定义方法
-(void)backAction
{
    [self.navigationController popViewControllerAnimated:YES];
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
