//
//  GoldMiningPlayGame.m
//  GoldMining
//
//  Created by 機器 王 on 12/7/4.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "GoldMiningPlayGame.h"

@interface GoldMiningPlayGame ()

- (void)setGame:(int)level ;    // 初始化
- (void)putTimer:(int)level ;   // 設定Timer
- (void)putButton:(int)level ;  // 放按鈕
- (IBAction)clickGamePause:(id)sender ; //按下暫停按鈕

- (void)updateCounter:(NSTimer *)theTimer ;  // UpdateTimer
- (IBAction) buttonClicked:(id)sender ;  // 踩踩樂

- (void)gameOver:(int)score ;  // 顯示成績之類
- (void)saveScore:(NSString *)name: (int)score ;    // 記錄成績

@end

@implementation GoldMiningPlayGame
@synthesize timerLabel;
@synthesize GamePauseBtn;
@synthesize levelSelect;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [self setGame:[levelSelect intValue]];  // 設定難度
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setTimerLabel:nil];
    [self setGamePauseBtn:nil];
    // 記得清掉所有產生的button
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)setGame:(int)level
{
    [self putTimer:level];  // 放TImer
    [self putButton:level]; // 放Button
}

- (void)putTimer:(int)level
{
    self.timerLabel.text = @"\t2:\t00";
    ispause=NO;
    time_count=120;
	[NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(updateCounter:) userInfo:nil repeats:YES];
}

- (void)putButton:(int)level
{
    int Row = 10, Col = 13, btnSize = 30;
    
#define START_TOP 100   /* 按鈕開始高度 */
#define START_LEFT 10   /* 按鈕開始寬度 */
    
    // 產生Button
    for(int i = 0; i < Row; i++)
    {
        for(int j = 0; j < Col; j++)
        {
            //动态添加一个按钮
            CGRect frame = CGRectMake(i * btnSize + START_LEFT, j * btnSize + START_TOP, btnSize, btnSize); // x, y, width, height
            UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            button.frame = frame;
            [button setTitle:@"？" forState: UIControlStateNormal];  
            button.backgroundColor = [UIColor clearColor];  
            button.tag = (j + 1) * 10000 + (i + 1) * 100; // Y座標 X座標 值
            [button setImage:[UIImage imageNamed:@"b.png"] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:button];}
    }
}

- (IBAction)clickGamePause:(id)sender//按下暫停按鈕
{
    ispause = YES;
    // addSubView 繼續 選難度 重來
    // 繼續 -> 清掉subview 計時器繼續
    // 選難度 -> 回到SelectLevel 並清掉此View所有產生的東西
    // 重來 -> 清掉所有產生的東西 重新配置
}

- (void)updateCounter:(NSTimer *)theTimer {
	//static int count = 120;
    if(time_count==0||ispause!=NO)
    {
        //時間到暫停遊戲
    }
    else
    {
        time_count--;
        NSString *s = [[NSString alloc]
                       initWithFormat:@"\t%d:\t%d", time_count/60 ,time_count%60];
        self.timerLabel.text = s;
    }
	
}

//这个是新按钮的响应函数
- (IBAction) buttonClicked:(id)sender {
    UIButton* btn = sender;
    NSString* strA = @"你已經死了";
    NSString* strB = [NSString stringWithFormat:@"%@\n%d", strA, btn.tag];
    
    [[[UIAlertView alloc] initWithTitle:@"遊戲結束" message:strB delegate:self cancelButtonTitle:@"確定" otherButtonTitles:nil] show];        // GameOver Alert
}

- (void)gameOver:(int)score
{
    // 顯示成績 儲存成績之類
    // addSubView (?) 打星星
    // 主畫面 選難度 下一難度
}

- (void)saveScore:(NSString *)name: (int)score
{
    // 成績扔到SQLite
}

@end
