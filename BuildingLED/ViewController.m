//
//  ViewController.m
//  BuildingLED
//
//  Created by Văn Tiến Tú on 7/28/15.
//  Copyright (c) 2015 Văn Tiến Tú. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    CGFloat _margin;
    CGFloat _ballDiameter;
}

- (void)viewDidLoad {
    _margin=40;
    _ballDiameter=32;
    [super viewDidLoad];
    //[self atX:100 andY:100 withTag:1];
    //[self numberOfBall:8 andY:100];
    [self testNumberBalls];
    [self themNdongBall:5  andNumberOfBalls:10 andY:50];
}
-(void) themNdongBall: (int) n
     andNumberOfBalls:(int) numberBalls
                 andY:(CGFloat)y{
    for(int i=0;i<n;i++){
        [self numberOfBall:numberBalls andY:y=y+50];
    }
}
-(void) atX: (CGFloat) x
       andY:(CGFloat)y
    withTag:(int) tag{
    UIImageView *ball=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"green"]];
    ball.center= CGPointMake(x, y);
    ball.tag=tag;
    [self.view addSubview:ball];
}
-(CGFloat) spaceBetweenBallvsSpace: (int) n{
    return (self.view.bounds.size.width-2*_margin)/(n-1);
}
-(void) numberOfBall: (int) numberOfBall
                andY: (CGFloat) y{
    CGFloat space=[self spaceBetweenBallvsSpace:numberOfBall];
    for (int i=0; i<numberOfBall; i++) {
        [self atX:_margin+i*space
             andY:y
          withTag:i+100];
    }
}
-(void) testNumberBalls{
    int stop=false;
    int n=3;
    while (!stop) {
        CGFloat space=[self spaceBetweenBallvsSpace:n];
        if(space<_ballDiameter){
            NSLog(@"Number of Balls %d between space %3.0f",n,space);
        }else{
            stop=true;
        }
        n++;
    }
}
@end
