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
    /*
     创建一个约束，参数说明:
         第一个参数:指定约束左边的视图view1
         第二个参数:指定view1的属性attr1，具体见上面的 NSLayoutAttribute。
         第三个参数:指定左右两边的视图的关系relation，具体见上面的 NSLayoutRelation。
         第四个参数:指定约束右边的视图view2
         第五个参数:指定view2的属性attr2，具体见上面的 NSLayoutAttribute。
         第六个参数:指定一个与view2属性相乘的乘数multiplier
         第七个参数:指定一个与view2属性相加的浮点数constant

    NSLayoutConstraint *constraint = [NSLayoutConstraint
                                     constraintWithItem:<#(id)#>
                                     attribute:<#(NSLayoutAttribute)#>
                                     relatedBy:<#(NSLayoutRelation)#>
                                     toItem:<#(id)#>
                                     attribute:<#(NSLayoutAttribute)#>
                                     multiplier:<#(CGFloat)#>
                                     constant:<#(CGFloat)#>];

    //这个函数的对照公式为: view1.attr1 = view2.attr2 * multiplier + constant
    //如下面翻译过来就是：view1的左侧 等于 view2的右侧乘以1 再多10个点 的地方。
    [NSLayoutConstraint constraintWithItem:view1
                             attribute:NSLayoutAttributeLeft
                             relatedBy:NSLayoutRelationEqual
                             toItem:view2
                             attribute:NSLayoutAttributeRight
                             multiplier:1
                             constant:10];
    */
    
    //如果你想设置的约束里不需要第二个view，要将第四个参数设为nil，第五个参数设为NSLayoutAttributeNotAnAttribute
    
    

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
    
    //用代码实现和上一个ViewCtrl一样的效果。正常的创建按钮，但不用设置按钮的Frame
    UIButton * leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.backgroundColor = [UIColor colorWithRed:0.720 green:1.000 blue:0.366 alpha:1.000];
    [leftButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:leftButton];
    
    UIButton * rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.backgroundColor = [UIColor colorWithRed:1.000 green:0.928 blue:0.341 alpha:1.000];
    [rightButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:rightButton];
    
    UIButton * bottomButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [bottomButton setBackgroundColor:[UIColor lightGrayColor]];
    [bottomButton setTitle:@"返回" forState:UIControlStateNormal];
    [bottomButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [bottomButton.titleLabel setFont:[UIFont boldSystemFontOfSize:24]];
    [bottomButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    bottomButton.backgroundColor = [UIColor colorWithRed:0.401 green:0.698 blue:0.752 alpha:1.000];
    [self.view addSubview:bottomButton];
    
    //关闭 autoresizingMask 转换成 约束
    [leftButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [rightButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    [bottomButton setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    
    //创建一个存放约束的数组
    NSMutableArray * tempConstraints = [NSMutableArray array];
    
    //创建水平方向leftButton、rightButton的约束：从左至右依次为 -> 在水平方向，边界往右20像素为leftButton，leftButton再往右20像素为rightButton，rightButton的宽等于leftButton，rightButton往右20像素为边界
    [tempConstraints addObjectsFromArray:[NSLayoutConstraint
        constraintsWithVisualFormat:@"H:|-20-[leftButton]-20-[rightButton(==leftButton)]-20-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(leftButton, rightButton)]];
    
    //创建水平方向bottomButton的约束：从左至右依次为 -> 在水平方向，边界往右20像素为bottomButton，bottomButton往右20像素为边界
    [tempConstraints addObjectsFromArray:[NSLayoutConstraint
        constraintsWithVisualFormat:@"H:|-20-[bottomButton]-20-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(bottomButton)]];

    //创建竖直方向leftButton、bottomButton的约束：从上到下依次为 -> 在竖直方向上，边界往下40像素为leftButton，leftButton往下20像素为bottomButton，bottomButton的高等于leftButton，bottomButton再往下20像素为边界
    [tempConstraints addObjectsFromArray:[NSLayoutConstraint
        constraintsWithVisualFormat:@"V:|-40-[leftButton]-20-[bottomButton(==leftButton)]-20-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(leftButton, bottomButton)]];
    
    //创建竖直方向rightButton的约束：从上到下依次为 -> 在竖直方向上，边界往下40像素为rightButton，rightButton的高等于leftButton
    [tempConstraints addObjectsFromArray:[NSLayoutConstraint
        constraintsWithVisualFormat:@"V:|-40-[rightButton(==leftButton)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(rightButton,leftButton)]];
    
    
    //给视图添加约束
//    [self.view addConstraint:<#(NSLayoutConstraint *)#>];
    [self.view addConstraints:tempConstraints];
}

#pragma mark -
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
