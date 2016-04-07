

## TSIntro
### Basic Scrolling App Intro
This allows you to drag in a folder and instantly have an app intro.

./TSIntro.gif

### Installation


To install drag the Intro folder into your current project. 

Then copy the code below and paste where you would like the intro to be shown. The view controller you are presenting from must be inside a UINavigationController for the intro to be presented. 

```swift
let userDefaults = NSUserDefaults.standardUserDefaults()
        
        if !userDefaults.boolForKey("walkthroughPresented") {
            
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

### Adding Pages 

The line below is how you are able to add new pages to the intro. At the moment you are easily able to change the title, image, and content.

```swift     
    //Add the pages
    viewCon.addPage("First Page ", image: UIImage(named: "EmptyImage.png")!, content: "This is new content that should be displayed under the picture.")
}
```

<!-- 
## License

`TSIntro` is available under the MIT license. See the LICENSE file for more info.

Copyright 2015 Tyler Schultz -->
