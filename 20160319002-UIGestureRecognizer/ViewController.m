//
//  ViewController.m
//  20160319002-UIGestureRecognizer
//
//  Created by Rainer on 16/3/19.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "ViewController.h"

/**
 *  使用手势时需要注意：想同时使用多个手势时需要设置手势代理，并且实现代理方法：- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
 */
@interface ViewController () <UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    [self setUpTapGestureRecognizer];
    
//    [self setUpLongPressGestureRecognizer];

//    [self setUpSwipeGestureRecognizer];
    
    [self setUpPanGestureRecognizer];
    
    [self setUpPinchGestureRecognizer];
    
    [self setUpRotationGestureRecognizer];
}

#pragma mark - 添加手势
#pragma mark -- 轻拍手势
/**
 *  添加点击手势
 */
- (void)setUpTapGestureRecognizer {
    // 1.创建一个单击事件并添加监听事件
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureRecognizerAction:)];
    
    // 2.控制点击的次数(默认为1),在这里设置不回会有一次单击触发
//    tapGestureRecognizer.numberOfTapsRequired = 2;
    tapGestureRecognizer.delegate = self;
    
    // 3.将手指操作添加到图片视图上
    [self.imageView addGestureRecognizer:tapGestureRecognizer];
}

/**
 *  手势单击事件处理
 */
- (void)tapGestureRecognizerAction:(UITapGestureRecognizer *)tapGestureRecognizer {
    // 控制点击的次数,在这里设置会有一次单击触发
//    tapGestureRecognizer.numberOfTapsRequired = 2;
    
    NSLog(@"%s", __func__);
}

#pragma mark -- 长按手势

/**
 *  添加长按手势
 */
- (void)setUpLongPressGestureRecognizer {
    // 1.创建长按手势并添加监听事件
    UILongPressGestureRecognizer *longPressGestureRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressGestureRecognizerAction:)];
    
    // 2.将长按手势添加到图片视图上
    [self.imageView addGestureRecognizer:longPressGestureRecognizer];
}

/**
 *  长按手势处理事件
 *  长按手势一般会执行2次，我们需要判断长按手势的状态，在手势抬起时执行操作
 */
- (void)longPressGestureRecognizerAction:(UILongPressGestureRecognizer *)longPressGestureRecognizer {
    // 判断手势的状态
    if (longPressGestureRecognizer.state == UIGestureRecognizerStateEnded) {
        NSLog(@"%s", __func__);
    }
}

#pragma mark -- 轻扫手势
/**
 *  添加轻扫手势
 *  注意：如果要想实现多个方向的轻扫需要添加过个轻扫手势
 */
- (void)setUpSwipeGestureRecognizer {
    // 1.添加向右轻扫的手势
    // 1.1.创建轻扫手势并且添加监听事件
    UISwipeGestureRecognizer *swipeGestureRecognizerRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGestureRecognizerRightAction:)];
    
    // 1.2.设置轻扫手势的方向
    swipeGestureRecognizerRight.direction = UISwipeGestureRecognizerDirectionRight;
    
    // 1.3.将轻扫手势添加到图片视图上
    [self.imageView addGestureRecognizer:swipeGestureRecognizerRight];
    
    // 2.添加向左轻扫的手势
    // 2.1.创建轻扫手势并且添加监听事件
    UISwipeGestureRecognizer *swipeGestureRecognizerUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGestureRecognizerUpAction:)];
    
    // 2.2.设置轻扫手势的方向
    swipeGestureRecognizerUp.direction = UISwipeGestureRecognizerDirectionUp;
    
    // 2.3.将轻扫手势添加到图片视图上
    [self.imageView addGestureRecognizer:swipeGestureRecognizerUp];
}

/**
 *  向右轻扫手势事件处理
 */
- (void)swipeGestureRecognizerRightAction:(UISwipeGestureRecognizer *)swipeGestureRecognizer {
    NSLog(@"%s", __func__);
}

/**
 *  向上轻扫手势事件处理
 */
- (void)swipeGestureRecognizerUpAction:(UISwipeGestureRecognizer *)swipeGestureRecognizer {
    NSLog(@"%s", __func__);
}

#pragma mark -- 拖拽手势
/**
 *  添加拖拽手势
 */
- (void)setUpPanGestureRecognizer {
    // 1.创建拖拽手势并添加监听事件
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognizerAction:)];
    
    // 2.将拖拽手势添加到图片视图上
    [self.imageView addGestureRecognizer:panGestureRecognizer];
}

/**
 *  拖拽手势事件处理
 */
- (void)panGestureRecognizerAction:(UIPanGestureRecognizer *)panGestureRecognizer {
    // 获取当前手势的触摸点
//    CGPoint currentPoint = [panGestureRecognizer locationInView:self.imageView];
    
    // 1.获取当前手势移动的点
    CGPoint movePoint = [panGestureRecognizer translationInView:self.imageView];
    
    // 2.将移动点复位（便于视图在原来的基础上进行点的移动）
    [panGestureRecognizer setTranslation:CGPointZero inView:self.imageView];
    
    // 3.设置图片视图的位移属性，使其移动
    self.imageView.transform = CGAffineTransformTranslate(self.imageView.transform, movePoint.x, movePoint.y);
}

#pragma mark -- 捏合手势
/**
 *  添加捏合手势
 */
- (void)setUpPinchGestureRecognizer {
    // 1.创建一个捏合手势，并且添加监听事件
    UIPinchGestureRecognizer *pinGestureRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinGestureRecognizerAction:)];
    
    // 2.设置旋转手势代理（这里主要用来满足多手势支持）
    pinGestureRecognizer.delegate = self;
    
    // 3.将捏合手势添加到图片视图上
    [self.imageView addGestureRecognizer:pinGestureRecognizer];
}

/**
 *  捏合手势事件处理
 */
- (void)pinGestureRecognizerAction:(UIPinchGestureRecognizer *)pinGestureRecognizer {
    // 1.获取捏合的值
    CGFloat scale = pinGestureRecognizer.scale;
    
    // 2.根据捏合值设置图片视图的形变属性
    self.imageView.transform = CGAffineTransformScale(self.imageView.transform, scale, scale);
    
    // 3.将捏合值复位（便于视图在原来的基础上进行形变）
    pinGestureRecognizer.scale = 1;
}

#pragma mark -- 旋转手势
/**
 *  添加旋转手势
 */
- (void)setUpRotationGestureRecognizer {
    // 1.创建一个旋转手势并且添加监听事件
    UIRotationGestureRecognizer *rotationGestureRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotationGestureRecognierAction:)];
    
    // 2.设置旋转手势代理（这里主要用来满足多手势支持）
    rotationGestureRecognizer.delegate = self;
    
    // 3.将旋转手势添加到图片视图上
    [self.imageView addGestureRecognizer:rotationGestureRecognizer];
}

/**
 *  旋转手势处理事件
 */
- (void)rotationGestureRecognierAction:(UIRotationGestureRecognizer *)rotationGestureRecognizer {
    // 1.获取手势旋转的值
    CGFloat rotation = rotationGestureRecognizer.rotation;
    
    // 2.设置图片视图旋转属性
    self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, rotation);
    
    // 3.将旋转值复位（便于视图在原来的基础上进行旋转）
    rotationGestureRecognizer.rotation = 0;
}

#pragma mark - 手势代理

/**
 *  返回是否开始手势操作（默认返回YES）
 */
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    return YES;
}

/**
 *  返回是否可以多种手势操作（不实现则返回NO）
 */
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    
    return YES;
}


/**
 *  返回是否允许接收手指触摸点
 *  这里实现当用户点击图片视图左边时不触发单击事件，点击右边时触发单击事件
 */
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
//    // 1.获取当前手势的触摸点
//    CGPoint currentPoint = [touch locationInView:self.imageView];
//    
//    // 2.判断手势触摸点和图片视图的中点：如果在中点的左边则不允许接收手势事件，如果在右边则接收手势事件
//    if (currentPoint.x > self.imageView.bounds.size.width * 0.5) {
//        return YES;
//    } else {
//        return NO;
//    }
    
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
