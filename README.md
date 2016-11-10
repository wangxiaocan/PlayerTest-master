# PlayerTest

![image](https://github.com/wangxiaocan/PlayerTest-master/raw/master/PlayerTest/imagsSource/9A2AB0559EBB65143CF96ED7036253B9.png)
![image](https://github.com/wangxiaocan/PlayerTest-master/blob/master/PlayerTest/imagsSource/0846CAA8FBC1D7EF520398982F3235D4.png)
</br>
#使用方法</br>
    _playerView = [[XCAVPlayerView alloc]init];
    UIView *playBgView = [[UIView alloc]initWithFrame:CGRectMake(0, 20.0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width * 0.58)];
    [self.view addSubview:playBgView];
    self.playerView.frame = playBgView.bounds;
    [playBgView addSubview:self.playerView];
    self.playerView.playerUrl = [NSURL URLWithString:@"http://api.feixiong.tv/Api/Base/getShortM3u8?params=%7B%22data%22%3A%7B%22id%22%3A281%2C%22stream_type%22%3A%22hd2%22%2C%22ykss%22%3A%22%22%7D%7D"];
    [self.playerView play];
