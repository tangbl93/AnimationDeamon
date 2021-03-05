# AnimationDeamon

[![Version](https://img.shields.io/cocoapods/v/AnimationDeamon.svg?style=flat)](https://cocoapods.org/pods/AnimationDeamon)
[![License](https://img.shields.io/cocoapods/l/AnimationDeamon.svg?style=flat)](https://cocoapods.org/pods/AnimationDeamon)
[![Platform](https://img.shields.io/cocoapods/p/AnimationDeamon.svg?style=flat)](https://cocoapods.org/pods/AnimationDeamon)

## 功能

防止循环动画在以下情况下被暂停播放: 

- UIApplication didEnterBackground
- UIViewController viewDidDisappear

## 示例项目

要运行示例项目, 请先下载, 然后从 `Example` 目录运行 `pod install`.

## 版本要求

iOS 9.0+

## 安装

### CocoaPods

将以下行添加到你的 `Podfile` 中:

```ruby
pod 'AnimationDeamon'
```


### Swift Package Manager

在Xcode中, 选择 `File > Swift Packages > Add Package Dependency` ，然后在文本框中输入 `https://github.com/tangbl93/AnimationDeamon.git`.

## 使用

```
AnimationDeamon.deamon(view: view) { (view) in
    // resume view animation
}
```

## 作者

tangbl93, tangbl93@gmail.com

## 许可证

AnimationDeamon is available under the MIT license. See the LICENSE file for more info.
