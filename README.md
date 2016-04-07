

## TSIntro
### Basic Scrolling App Intro
This allows you to drag in a folder and instantly have an app intro.

### Installation


To install download the repo and drag the Intro folder into your project. 

Then all you have to do is paste the code below into your view controller

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
