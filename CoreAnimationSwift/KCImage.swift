//
//  KCImage.swift
//  CoreAnimationSwift
//
//  Created by hsg on 2017/10/12.
//  Copyright © 2017年 com.zhiding8. All rights reserved.
//

import UIKit

class KCImage: UIView {
   //http://www.jianshu.com/p/fb1a91600468
    override init(frame: CGRect) {
        super.init(frame: frame)
        let image:UIImage! =  UIImage(named: "Icon180.png")
        backgroundColor =  UIColor.init(patternImage: image)
    }
    
    //https://stackoverflow.com/questions/33935566/custom-uiview-class-swift
    convenience init () {
        self.init(frame:CGRect.zero)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("KCImage touchesBegan")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("KCImage touchesEnded")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("KCImage touchesMoved")
     
    }
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("KCImage touchesCancelled")
    }

}
