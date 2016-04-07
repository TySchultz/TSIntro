

## TSIntro?
### Basic Scrolling App Intro
This allows you to drag in a folder and instantly have an app intro.

## Installation

### Carthage

`RazzleDazzle` is available through [Carthage](https://github.com/Carthage/Carthage). To install
it, simply add the following line to your `Cartfile`:



### Interpolatable Types

`RazzleDazzle` can animate any type that conforms to the `Interpolatable` protocol. It comes pre-cooked to support animating `CGFloats`, `CGPoints`, `CGSizes`, `CGRects`, and `UIColors`.

If the property you'd like to animate is of a different type, just extend that type to conform to `Interpolatable` by adding a static function `interpolateFrom(fromValue: toValue: withProgress:)` that returns an instance of that type between two other instances of the same type.

```swift
extension CGPoint : Interpolatable {
    public static func interpolateFrom(fromValue: CGPoint, to toValue: CGPoint, withProgress progress: CGFloat) -> CGPoint {
        assert((0 <= progress) && (progress <= 1), "Progress must be between 0 and 1")
        let interpolatedX = CGFloat.interpolateFrom(fromValue.x, to: toValue.x, withProgress: progress)
        let interpolatedY = CGFloat.interpolateFrom(fromValue.y, to: toValue.y, withProgress: progress)
        return CGPointMake(interpolatedX, interpolatedY)
    }
}
```

If your property is a `CGFloat` or one of the other built-in interpolatable types, you only need to create an animation type that tells `RazzleDazzle` how to apply the keyframe values to your view, as above.

## Notes

An animator can only handle one animation per type per view. If you want multiple animations of the same type on a view, use keyframes of a single animation instead of two separate animations.

`RazzleDazzle` is written in Swift 2.0, so it will only compile in Xcode 7 and up. If you want to use a library like this that will integrate with an older version of Swift, you can use [`JazzHands`](https://github.com/IFTTT/JazzHands), which is written in Objective-C, and use a bridging header to access the methods from your Swift 1.2 classes.

Looking for libraries to build awesome keyframe animations like RazzleDazzle on Android? Check out [`SparkleMotion`](https://github.com/IFTTT/SparkleMotion).

## Contributors

* [Laura Skelton](https://github.com/lauraskelton), creator.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/RazzleDazzle/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

`RazzleDazzle` is available under the MIT license. See the LICENSE file for more info.

Copyright 2015 IFTTT Inc.
