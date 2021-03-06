# AnimationDeamon

[![Version](https://img.shields.io/cocoapods/v/AnimationDeamon.svg?style=flat)](https://cocoapods.org/pods/AnimationDeamon)
[![License](https://img.shields.io/cocoapods/l/AnimationDeamon.svg?style=flat)](https://cocoapods.org/pods/AnimationDeamon)
[![Platform](https://img.shields.io/cocoapods/p/AnimationDeamon.svg?style=flat)](https://cocoapods.org/pods/AnimationDeamon)

[中文文档](./README_CN.md)

## Features

Prevent looping animation from being paused in the following situations: 

- UIApplication didEnterBackground
- UIViewController viewDidDisappear

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

iOS 9.0+

## Installation

### CocoaPods

Simply add the following line to your Podfile:

```ruby
pod 'AnimationDeamon'
```


### Swift Package Manager

To add a package dependency to your Xcode project, select File > Swift Packages > Add Package Dependency and enter https://github.com/tangbl93/AnimationDeamon.git to the text field.

## Usage

```
AnimationDeamon.deamon(view: view) { (view) in
    // resume view animation
}
```

## Author

tangbl93, tangbl93@gmail.com

## License

AnimationDeamon is available under the MIT license. See the LICENSE file for more info.
