

## TSIntro
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
let userDefaults = NSUserDefaults.standardUserDefaults()
        
        if !userDefaults.boolForKey("walkthroughPresentede") {
            
            let viewCon = TSIntroViewController()
            //Show the tutorial
            //The current viewController you are presenting from needs to be within navigation controller
            self.presentViewController(viewCon, animated: true, completion: nil )
            //Change the background of the tutorial
            viewCon.view.backgroundColor = UIColor.whiteColor()
            //Add the pages
            viewCon.addPage("First Page ", image: UIImage(named: "EmptyImage.png")!, content: "This is new content that should be displayed under the picture.")
            viewCon.addPage("Second Page", image: UIImage(named: "EmptyImage.png")!, content: "This is new content that should be displayed under the picture.")
            viewCon.addPage("Last Page  ", image: UIImage(named: "EmptyImage.png")!, content: "This is new content that should be displayed under the picture.")
            
            userDefaults.setBool(true, forKey: "walkthroughPresented")
            userDefaults.synchronize()
        }
}
```

<!-- 
## License

`TSIntro` is available under the MIT license. See the LICENSE file for more info.

Copyright 2015 Tyler Schultz -->
