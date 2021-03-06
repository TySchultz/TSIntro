//
//  ViewController.swift
//  TSIntro
//
//  Created by Ty Schultz on 4/7/16.
//  Copyright © 2016 Ty Schultz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        if !userDefaults.boolForKey("walkthroughPresentede") {
            let introView = TSIntroViewController()
            //Show the tutorial
            //The current viewController you are presenting from needs to be within navigation controller
            self.presentViewController(introView, animated: true, completion: nil )
            //Change the background of the tutorial
            introView.view.backgroundColor = UIColor.whiteColor()
            //Add the pages
            introView.addPage("First Page ", image: UIImage(named: "emptyImage.png")!, content: "This is new content that should be displayed under the picture.")
            introView.addPage("Second Page", image: UIImage(named: "emptyImage.png")!, content: "This is new content that should be displayed under the picture.")
            introView.addPage("Last Page  ", image: UIImage(named: "emptyImage.png")!, content: "This is new content that should be displayed under the picture.")
            
            userDefaults.setBool(true, forKey: "walkthroughPresented")
            userDefaults.synchronize()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

