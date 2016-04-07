//
//  TSIntroScrollView.swift
//  
//
//  Created by Ty Schultz on 4/7/16.
//
//

import UIKit

class TSIntroScrollView: UIScrollView{

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

    private var leftButton : UIButton!
    private var rightButton : UIButton!
    private var closeButton : UIButton!
    
    var introViewController : TSIntroViewController?
    
    var pages : [TSIntroPage] = []
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        setup()
    }
    
    func setup() {
        
        self.backgroundColor = UIColor.clearColor()
        
        leftButton = UIButton(frame: CGRectMake(0, self.frame.size.height - 80, 50, 50))
        leftButton.setImage(UIImage(named: "leftButton"), forState: UIControlState.Normal)
        leftButton.setTitle("", forState: UIControlState.Normal)
        leftButton.tag = 0
        leftButton.addTarget(self, action: #selector(TSIntroScrollView.scrollButtonPressed(_:)) , forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(leftButton)
        
        rightButton = UIButton(frame: CGRectMake(self.frame.width - 50, self.frame.size.height - 80, 50, 50))
        rightButton.setImage(UIImage(named: "rightButton"), forState: UIControlState.Normal)
        rightButton.setTitle("", forState: UIControlState.Normal)
        rightButton.tag = 1
        rightButton.addTarget(self, action: #selector(TSIntroScrollView.scrollButtonPressed(_:)) , forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(rightButton)
        
        closeButton = UIButton(frame: CGRectMake(self.frame.width - 50, 20, 50, 50))
        closeButton.setImage(UIImage(named: "closeButton"), forState: UIControlState.Normal)
        closeButton.setTitle("", forState: UIControlState.Normal)
        closeButton.addTarget(self, action: #selector(TSIntroScrollView.dismissTutorial(_:)) , forControlEvents: UIControlEvents.TouchUpInside)
        self.addSubview(closeButton)
        
        self.contentSize = CGSizeMake(0, self.bounds.height)
        self.pagingEnabled = true
        self.scrollEnabled = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Creates a page and inserts into the scrollview
    func addPage(title : String, image : UIImage, content : String){

        let pageFrame    = CGRectMake(self.contentSize.width, 0, self.frame.width, self.bounds.height)
        let page         = TSIntroPage(frame: pageFrame)
        page.delegate    = introViewController
        page.initializeContent(title,image: image, content: content)
        self.addSubview(page)
        
        //Grow the content size of the scrollview
        self.contentSize = CGSizeMake(self.contentSize.width + self.frame.width, self.contentSize.height)
        
        //change all the other pages to not have the end button
        for page in pages {
            page.removeLastPage()
        }
        //Add the close button to this page
        page.setupLastPage()
        pages.append(page)
        self.sendSubviewToBack(page)
    }
    
    func scrollButtonPressed(sender : UIButton){
        let xOffset = self.contentOffset.x
        print(xOffset + self.frame.width)
        let tag = sender.tag
        if tag == 0 { //Left button Tapped
            self.scrollRectToVisible(CGRectMake(xOffset - self.frame.width, 0, self.frame.width, self.frame.height), animated: true)
        }else if tag == 1 { // right Button Tapped
            self.scrollRectToVisible(CGRectMake(xOffset + self.frame.width, 0, self.frame.width, self.frame.height), animated: true)
        }
    }

    //hides the tutorial
    func dismissTutorial(sender : UIButton) {
        introViewController?.dismissTutorial()
    }
    
    //keeps the elements on screen that need to move with the tutorial
    //left button, right button, close button
    func moveElements(xPosition : CGFloat){
        
        var leftFrame = leftButton.frame
        leftFrame.origin.x = xPosition
        leftButton.frame = leftFrame
        
        var rightFrame = rightButton.frame
        rightFrame.origin.x = xPosition + self.frame.width - 50
        rightButton.frame = rightFrame
        
        var closeFrame = closeButton.frame
        closeFrame.origin.x = xPosition + self.frame.width - 50
        closeButton.frame = closeFrame
    }
   
}
