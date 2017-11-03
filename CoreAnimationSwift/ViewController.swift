//
//  ViewController.swift
//  CoreAnimationSwift
//
//  Created by user on 2017/10/8.
//  Copyright © 2017年=. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet weak var goButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewController viewDidLoad")
       let _ = goButton.rx.controlEvent(UIControlEvents.touchUpInside)
            .subscribe(onNext: { () in
                print("clicked")
            });
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("ViewController viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("ViewController viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("ViewController viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("ViewController viewDidDisappear")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("ViewController didReceiveMemoryWarning")
        // Dispose of any resources that can be recreated.
    }

    

}

