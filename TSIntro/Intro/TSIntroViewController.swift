//
//  TSIntroViewController.swift
//  
//
//  Created by Ty Schultz on 4/7/16.
//
//

import UIKit

class TSIntroViewController: UIViewController, UIScrollViewDelegate {

    var scroll : TSIntroScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Initialize the scrollview
        scroll                     = TSIntroScrollView(frame: self.view.frame)
        scroll.introViewController = self
        scroll.delegate            = self
        self.view.addSubview(scroll)
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //Calls the scrollview to add a new page to the contentView
    func addPage(title : String, image : UIImage, content : String){
        scroll.addPage(title, image: image, content: content)
    }
    
    //Closes the tutorial view and goes back to the viewcontroller which called the tutorial
    func dismissTutorial() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    /**
      Controls how the pages move their contents
      When scrolling the images move at different rates then the descriptions below
     **/
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        var count                 = 0
        let width                 = self.view.frame.width
        let scrollSpeed : CGFloat = 2.0// divide by 2 to slow down the scrolling
        for page in scroll.pages{
            //Creates the same offset for each page so scrolling is consistent
            let offset = (scroll.contentOffset.x - (CGFloat(count) * width)) / scrollSpeed
            print (offset)
            page.moveContent(offset)
            count += 1
        }
        
        //Keep the skip, left, and right buttons on screen
        scroll.moveElements(scroll.contentOffset.x)
    }
}
