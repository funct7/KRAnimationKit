# KRTimingFunction

[![CI Status](http://img.shields.io/travis/Joshua Park/KRTimingFunction.svg?style=flat)](https://travis-ci.org/Joshua Park/KRTimingFunction)
[![Version](https://img.shields.io/cocoapods/v/KRTimingFunction.svg?style=flat)](http://cocoapods.org/pods/KRTimingFunction)
[![License](https://img.shields.io/cocoapods/l/KRTimingFunction.svg?style=flat)](http://cocoapods.org/pods/KRTimingFunction)
[![Platform](https://img.shields.io/cocoapods/p/KRTimingFunction.svg?style=flat)](http://cocoapods.org/pods/KRTimingFunction)

## Intro
**KRTimingFunction** is a set of timing functions, ported from a [JQuery timing function](http://gsgd.co.uk/sandbox/jquery/easing/jquery.easing.1.3.js).

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

KRTimingFunction is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'KRTimingFunction', :git => 'https://github.com/BridgeTheGap/KRTimingFunction.git'
```
## Usage
###### List of Functions
> linear
> 
> easeInSine
> easeOutSine
> easeInOutSine
> 
> easeInQuad
> easeOutQuad
> easeInOutQuad
> 
> easeInCubic
> easeOutCubic
> easeInOutCubic
> 
> easeInQuart
> easeOutQuart
> easeInOutQuart
> 
> easeInQuint
> easeOutQuint
> easeInOutQuint
> 
> easeInExpo
> easeOutExpo
> easeInOutExpo
> 
> easeInCirc
> easeOutCirc
> easeInOutCirc
> 
> easeInElastic
> easeOutElastic
> easeInOutElastic
> 
> easeInBack
> easeOutBack
> easeInOutBack
> 
> easeInBounce
> easeOutBounce
> easeInOutBounce

More explanation and a visual representation of these functions can be found at [Easings](http://easings.net/).


###### How to Use
Most timing functions can be called through the following syntax:

```swift
// TimingFunction.(functionName)(rt: Double, b: Double, c: Double)
TimingFunction.linear(rt: 0.5, b: 0.0, c: 100.0)
```
- `rt`: Relative time (the progress in relation to the whole duration of animation that you would calculate the value for.) In the example above, if the whole duration of the animation is 2 seconds, the function will be giving back the value for the 1 second marker, which is 0.5 of the whole animation time.

- `b`: Beginning value. In the example above, if the animation was animating the origin.x of a view, the view would be starting from 0.0.
- `c`: Change in value (the end value - beginning value). In the example above, if the animation was animating the origin.x of a view, the view would be ending at 100.0.

- (The reason why KRTimingFunction uses relative time instead of absolute duration and absolute current time is that it was originally intended to be used in conjunction with `UIView.addKeyframeWithRelativeStartTime(_:, relativeDuration:, animations:)`. Also, the original JQuery function converts the absolute duration and absolute current time to relative time for most functions anyway.)

The exceptions are `elastic` functions: `easeInElastic`, `easeOutElastic`, and `easeInOutElastic`. These require the absolute duration in addition to the above-mentioned parameters:

```swift
// TimingFunction.(functionName)(rt: Double, b: Double, c: Double, d: Double)
TimingFunction.easeInElastic(rt: 0.5, b: 0.0, c: 100.0, d: 2.0)
```
- `d`: Absolute duration in seconds. If the animation has a duration of 2.0 seconds, `2.0` should be passed as the parameter.


## Author

Josh Woomin Park, wmpark@knowre.com

## License

KRTimingFunction is available under the MIT license. See the LICENSE file for more info.
