//
//  TSIntroPage.swift
// 
//
//  Created by Ty Schultz on 4/7/16.
//
//

import UIKit

class TSIntroPage: UIView {

  
    //FIXME: change the color to white by changing to false.
    private let BLACKTEXT = true
    private let TITLESIZE :CGFloat = 26.0
    private let CONTENTSIZE :CGFloat = 16.0
    
    private var topImage : UIImageView!
    private var topTitle : UILabel!
    private var bottomContent : UILabel!
    private var closeButton : UIButton!

    var delegate : TSIntroViewController?
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
    
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func initializeContent(title : String?, image : UIImage, content : String)
    {
        topTitle.text      = title ?? " "
        topImage.image     = image
        bottomContent.text = content
    }
    
    
    private func setup () {
        
        initializeInterface()
        
        self.backgroundColor = UIColor.clearColor()

        changeTextColor()

    }
    
    //Set up in the interface
    private func initializeInterface(){
        //values
        let percentage :CGFloat     = 10.0/100.0// 10 percent of the screen ... 20 percent of the screen will be left open
        let xStart :CGFloat         = self.frame.width * percentage
        let yStartImage : CGFloat   = self.frame.height * 0.2
        let yStartContent : CGFloat = self.frame.height - self.frame.height * 0.3
        let contentWidth : CGFloat  = self.frame.width - 2*(self.frame.width * percentage)

        topImage                     = UIImageView(frame: CGRectMake(xStart, yStartImage, contentWidth, self.frame.height * 0.4))
        topImage.contentMode         = .ScaleAspectFit
        topImage.layer.masksToBounds = true

        topTitle               = UILabel(frame: CGRectMake(0, 40, self.frame.width, 50))
        topTitle.text          = ""
        topTitle.textAlignment = .Center
        topTitle.font          = UIFont(name: "Avenir Medium", size: TITLESIZE)
        
        bottomContent               = UILabel(frame: CGRectMake(xStart, yStartContent, contentWidth, 90))
        bottomContent.font          = UIFont(name: "Avenir Book", size: CONTENTSIZE)
        bottomContent.numberOfLines = 0
        bottomContent.textAlignment = .Center

        self.addSubview(topTitle)
        self.addSubview(topImage)
        self.addSubview(bottomContent)
    }
    
    func changeTextColor(){
        var color = UIColor.blackColor()

        if BLACKTEXT{
            //change all to black 
            color = UIColor.blackColor()
        }else{
            color = UIColor.whiteColor()
        }
        topTitle.textColor = color
        bottomContent.textColor = color
    }
    
    func setupLastPage(){
        
        closeButton = UIButton(frame: CGRectMake(40, self.frame.size.height - 80, self.frame.width - 80, 50))
        //FIXME: Name of the close Button
        closeButton.setTitle("Start!", forState: UIControlState.Normal)
        closeButton.layer.cornerRadius = 8.0
        closeButton.titleLabel?.font = UIFont(name: "Avenir Book", size: 20.0)
        if BLACKTEXT {
            closeButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        }else{
            closeButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        }
        self.addSubview(closeButton)
        //adds the button press to call dismiss view
        closeButton.addTarget(self, action: #selector(TSIntroPage.dismissView(_:)), forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func removeLastPage(){
        closeButton.removeFromSuperview()
    }
    
    func dismissView(sender :UIButton ){
        delegate!.dismissTutorial()
    }
    
    func moveContent(xPosition : CGFloat){

        let percentage :CGFloat    = 10.0/100.0
        let xStart :CGFloat        = self.frame.width * percentage
        let yStart : CGFloat       = self.frame.height - 100
        let contentWidth : CGFloat = self.frame.width - 2*(self.frame.width * percentage)

        //Image will start half way on the screen and move the other half when scrolling
        var imageFrame      = topImage.frame
        imageFrame.origin.x = xStart - xPosition
        topImage.frame      = imageFrame
        
        //content will start a
        var contentFrame      = bottomContent.frame
        contentFrame.origin.x = xStart - xPosition/2
        bottomContent.frame   = contentFrame
    }
}
