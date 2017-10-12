//
//  KCImageViewController.swift
//  CoreAnimationSwift
//
//  Created by hsg on 2017/10/12.
//  Copyright © 2017年 com.zhiding8. All rights reserved.
//

import UIKit

class KCImageViewController: UIViewController {
   
    //OS开发系列--触摸事件、手势识别、摇晃事件、耳机线控 http://www.cnblogs.com/kenshincui/p/3950646.html
    var imageView:KCImage!;  //Classes and structures must set all of their stored properties to an appropriate initial value by the time an instance of that class or structure is created. Stored properties cannot be left in an indeterminate state.
    
    //You can set an initial value for a stored property within an initializer, or by assigning a default property value as part of the property’s definition.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView = KCImage.init(frame: CGRect(origin: CGPoint(x:150,y:150), size: CGSize(width: 200 , height: 200)))
        //imageView.image = UIImage(named: "Icon180.png")
        view.addSubview(imageView)
        // Do any additional setup after loading the view.
        
        let panGetsture:UIGestureRecognizer = UIPanGestureRecognizer(target: self, action:#selector(handlePan(_:)))
        //pan conflict whith swipe
        view.addGestureRecognizer(panGetsture)
        
        let swipe = UISwipeGestureRecognizer(target:self, action:#selector(swipe(_:)))
        swipe.direction = .left //从左开始滑动
        self.view.addGestureRecognizer(swipe)
        
        panGetsture.require(toFail: swipe)//swipe fail and then  panGesture
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func swipe(_ recognizer: UIPanGestureRecognizer) {
        if recognizer.state == .began {
            print("swipe UIGestureRecognizerStateBegan" )
        } else if recognizer.state == .changed {
            print("swipe UIGestureRecognizerStateChanged" )
        }
        else if recognizer.state == .ended {
            print("swipe UIGestureRecognizerStateEnded" )
        }
    }
    
   @objc func handlePan(_ recognizer: UIPanGestureRecognizer) {
        if recognizer.state == .began {
            print("handlePan UIGestureRecognizerStateBegan" )
        } else if recognizer.state == .changed {
            print("handlePan UIGestureRecognizerStateChanged" )
        }
        else if recognizer.state == .ended {
            print("handlePan UIGestureRecognizerStateEnded" )
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesBegan")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesEnded")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesMoved")
        //touches.anyObject!
        let currentTouch:UITouch = touches.first!
        let currentPoint:CGPoint = currentTouch.location(in: view)
        let previousPoint:CGPoint = currentTouch.previousLocation(in: view)
        print(currentPoint)
        print(previousPoint)
        let center:CGPoint  = imageView.center
        let offset:CGPoint = CGPoint(x:(currentPoint.x - previousPoint.x) , y: (currentPoint.y - previousPoint.y))
        imageView.center = CGPoint(x:center.x+offset.x,y:center.y+offset.y)
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesCancelled")
    }
    //史上最详细的iOS之事件的传递和响应机制-原理篇 http://www.jianshu.com/p/2e074db792ba
}
