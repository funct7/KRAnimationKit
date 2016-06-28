# KRAnimationKit

**KRAnimationKit** is a library that makes animation easy for Swift developers.

[![CI Status](http://img.shields.io/travis/Joshua Park/KRAnimationKit.svg?style=flat)](https://travis-ci.org/Joshua Park/KRAnimationKit)
[![Version](https://img.shields.io/cocoapods/v/KRAnimationKit.svg?style=flat)](http://cocoapods.org/pods/KRAnimationKit)
[![License](https://img.shields.io/cocoapods/l/KRAnimationKit.svg?style=flat)](http://cocoapods.org/pods/KRAnimationKit)
[![Platform](https://img.shields.io/cocoapods/p/KRAnimationKit.svg?style=flat)](http://cocoapods.org/pods/KRAnimationKit)

## Intro
**KRAnimationKit** is a powerful animation kit that will allow you to implement complex animations very easily.

Inspired by [JHChainableAnimations](https://github.com/jhurray/JHChainableAnimations), KRAnimationKit provides a more structured and yet more powerful experience with animations.

Not only chaining animations, but chaining simultaneous animations, and even chaining simultaneous for multiple views has become easy with KRAnimationKit.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
KRAnimationKit adopts an extensive amount of Swift 2.2 syntax and features.
The library syntax or even certain features may not be available in Objective-C.

## Installation

KRAnimationKit is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'KRAnimationKit', :git => 'https://github.com/BridgeTheGap/KRAnimationKit.git'
```

## Syntax

###### Basic Animations
For simple animation without chaining:

```swift
import KRAnimationKit

// Default
viewBox.animateX(50.0, duration: 1.0)

// + timing function
viewBox.animateX(50.0, duration: 1.0, function: .EaseInQuad)

// + reverse
viewBox.animateX(50.0, duration: 1.0, reverses: true)

// + repeat
viewBox.animateX(50.0, duration: 1.0, repeatCount: 10)

// + completion
viewBox.animateX(50.0, duration: 1.0) {
    print("COMPLETION")
}
```

The parameters `reverses`, `repeatCount`, and `completion` are default parameters, so fill them in as you deem necessary.

###### Delayed Animations
In order to delay the beginning of an animation, use `after(_: Double)`. The parameter is in seconds.

```swift
viewBox.after(0.5).animateY(200.0, duration: 1.0, function: .EaseInCubic)
```


###### Chained Animations
Chaining animations can be done for the same view as well as different views like so:

```swift
// Use `KRAnimation.chain()` static method
// For views, use chain functions instead of animate functions

// Basic chaining with two views
KRAnimation.chain(
    // animate viewBox
    viewBox.chainY(300.0, duration: 1.0, function: .EaseInQuad),
    viewBox.chainY(0.0, duration: 1.0, function: .EaseOutQuad),

    // animate viewBox2
    viewBox2.chainX(bottomY, duration: 1.0, function: .EaseInOutQuad)
)

// + reverses, repeatCount, completion
KRAnimation.chain(
    viewBox.chainY(bottomY, duration: 1.0, function: .EaseInBounce),
    viewBox.chainY(0.0, duration: 1.0, function: .EaseOutBounce),
    viewBox2.chainY(58.0, duration: 1.0, function: .EaseInOutBounce),
    
    reverses: false, repeatCount: 1
) {
    print("COMPLETION")
}
```


###### Simultaneously Chained Animations
To have two or more animations chained simultaneously, simply use `+` like so:

```swift
KRAnimation.chain(
    // Simultaneously applying four animations on two different views
    viewBox.chainX(300.0, duration: 1.0) + viewBox.chainBackgroundColor(UIColor.blueColor(), duration: 1.0) + viewBox2.chainAlpha(0.5, duration: 1.0) + viewBox2.chainBackgroundColor(UIColor.cyanColor(), duration: 1.0),

    viewBox.chainX(0.0, duration: 1.0, function: .EaseInOutCubic) + viewBox.chainBackgroundColor(UIColor.redColor(), duration: 1.0),
)
```

## Timing Functions
KRAnimationKit uses [KRTimingFunction](https://github.com/BridgeTheGap/KRTimingFunction), a Swift-ported version of [JQuery timing functions](http://gsgd.co.uk/sandbox/jquery/easing/jquery.easing.1.3.js).

The supported timing functions are as follows:

>Linear

>EaseInSine
>EaseOutSine
>EaseInOutSine

>EaseInQuad
>EaseOutQuad
>EaseInOutQuad

>EaseInCubic
>EaseOutCubic
>EaseInOutCubic

>EaseInQuart
>EaseOutQuart
>EaseInOutQuart

>EaseInQuint
>EaseOutQuint
>EaseInOutQuint

>EaseInExpo
>EaseOutExpo
>EaseInOutExpo

>EaseInCirc
>EaseOutCirc
>EaseInOutCirc

>EaseInBack
>EaseOutBack
>EaseInOutBack

>EaseInElastic
>EaseOutElastic
>EaseInOutElastic

>EaseInBounce
>EaseOutBounce
>EaseInOutBounce

More explanation and a visual representation of these functions can be found at [Easings](http://easings.net/)

## Animatable Properties
KRAnimationKit supports most CALayer animatable properties as listed in [Core Animation Programming Guide](https://developer.apple.com/library/ios/documentation/Cocoa/Conceptual/CoreAnimation_guide/AnimatableProperties/AnimatableProperties.html).

The list of properties that are currently unavailable are as listed below:

- anchorPoint ?
- backgroundFilters ?
- compositingFilter ?
- contents ?
- contentsRect ?
- filters?
- hidden X
- mask *
- masksToBounds *
- shadowPath *
- sublayers ?
- sublayerTransform ?
- transform *
- zPosition *

==============================================================
- *: properties that are planned to be supported later.
- ?: properties that are not set to be supported at the moment.
- X: properties that won't be supported.


## Caveat
Since KRAnimationKit uses a layer-based animation--it uses `CAAnimation`, certain `UIView` subviews might not work as expected like the following scenario:

According to this [StackOverflow post](http://stackoverflow.com/questions/15597956/ios-layer-background-color-not-showing-when-view-background-color-is-clear-colo), the `backgroundColor` property of `UILabel` and its `layer` are not the same. Animation is applied to the layer level only, so animating a `UILabel` instance with different colors for the view and layer might result in unexpected behavior.


## Author

Josh Woomin Park, wmpark@knowre.com

## License

KRAnimationKit is available under the MIT license. See the LICENSE file for more info.
