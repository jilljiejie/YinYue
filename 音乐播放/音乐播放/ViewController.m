//
//  ViewController.m
//  音乐播放
//
//  Created by qianfeng on 16/1/6.
//  Copyright © 2016年 wj. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
@interface ViewController ()<AVAudioPlayerDelegate>
@property(nonatomic,strong)AVAudioPlayer *audioPlayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor cyanColor];
    [self customUI];
}
-(void)customUI{
    _audioPlayer = [[AVAudioPlayer alloc]initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://cdn.thenbapps.com/music/da/c3e1d161ac2e39ceda4211a82c1a9a.mp3"]] error:nil];
    //设置代理
    _audioPlayer.delegate = self;
    //设置播放音量
    _audioPlayer.volume = 0.5;//0~1之间
    //设置当前的播放进度
    _audioPlayer.currentTime = 0;
    //设置循环次数
    _audioPlayer.numberOfLoops = -1;//负数表示无限循环播放，0表示只播放一次，正数是几就播放几次
    //只读属性
    // _player.isPlaying //是否正在播放
    //_player.numberOfChannels //声道数
    //_player.duration //持续时间
    
    //预播放，将播放资源添加到播放器中，播放器自己分配播放队列
    [_audioPlayer prepareToPlay];
    
    UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake(50, 100, 50, 50)];
    [button setBackgroundColor:[UIColor greenColor]];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"开始" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
    
//    UIButton *button2=[[UIButton alloc]initWithFrame:CGRectMake(50, 200, 50, 50)];
//    [button2 setBackgroundColor:[UIColor greenColor]];
//    [button2 setTitle:@"暂停" forState:UIControlStateNormal];
//    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [button2 addTarget:self action:@selector(buttonPause) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:button2];
    
}
-(void)buttonAction{
    if (_audioPlayer.isPlaying) {
        //暂停
        NSLog(@"点击了暂停");
        [_audioPlayer pause];
    }
    else{
        NSLog(@"开始");
        [_audioPlayer play];
    }
   
}

-(void)buttonPause{
    //暂停
    NSLog(@"暂停");
    [self.audioPlayer pause];
//    [self.audioPlayer stop];
}
//-(AVAudioPlayer *)audioPlayer{
////    _audioPlayer = [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"蓝莲花" ofType:@"mp3"]] error:nil];
//    
////    NSString *urlString=@"http://cdn.thenbapps.com/music/da/c3e1d161ac2e39ceda4211a82c1a9a.mp3";
////    NSURL *url=[NSURL URLWithString:urlString];
////    NSData *data=[NSData dataWithContentsOfURL:url];
////    NSString *docPath=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
////    NSString *filePath=[docPath stringByAppendingPathComponent:@"temp.mp3"];
////    NSURL *fileURL=[NSURL fileURLWithPath:filePath];
////    _audioPlayer=[[AVAudioPlayer alloc]initWithContentsOfURL:fileURL error:nil];
////    [_audioPlayer prepareToPlay];
//    
//    
//    _audioPlayer = [[AVAudioPlayer alloc]initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://cdn.thenbapps.com/music/da/c3e1d161ac2e39ceda4211a82c1a9a.mp3"]] error:nil];
//    //设置代理
//    _audioPlayer.delegate = self;
//    //设置播放音量
//    _audioPlayer.volume = 0.5;//0~1之间
//    //设置当前的播放进度
//    _audioPlayer.currentTime = 0;
//    //设置循环次数
//    _audioPlayer.numberOfLoops = -1;//负数表示无限循环播放，0表示只播放一次，正数是几就播放几次
//    //只读属性
//    // _player.isPlaying //是否正在播放
//    //_player.numberOfChannels //声道数
//    //_player.duration //持续时间
//    
//    //预播放，将播放资源添加到播放器中，播放器自己分配播放队列
//    [_audioPlayer prepareToPlay];
//    return _audioPlayer;
//}
-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    if (flag) {
        NSLog(@"正常播放");
    }
    NSLog(@"错误播放，解码错误");
}
-(void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError *)error{
    NSLog(@"对音频文件解码错误");
    NSLog(@"====%@",error);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
