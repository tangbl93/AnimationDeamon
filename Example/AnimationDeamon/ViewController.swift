//
//  ViewController.swift
//  AnimationDeamon
//
//  Created by tangbl93 on 03/03/2021.
//  Copyright (c) 2021 tangbl93. All rights reserved.
//

import UIKit

import ViewAnimator
import AnimationDeamon

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let red = UIView()
        red.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        red.backgroundColor = UIColor.red
        red.center = view.center
        self.view.addSubview(red)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2)) {
            Self.zoom(view: self.view, from: 0.8, to: 2.4, duration: 0.6, repeats: true)
        }
    }

    /// zoom
    public static func zoom(view: UIView,
                            from min: CGFloat = 0.8, to max: CGFloat = 1.5,
                            duration: TimeInterval = 0.6,
                            repeats: Bool = true) {
        
        let animations: [Animation] = [
            AnimationType.zoom(scale: min),
            AnimationType.zoom(scale: max),
            AnimationType.zoom(scale: 1.0),
        ]
        
        let options: UIView.AnimationOptions = [.repeat, .autoreverse, .curveLinear,
                                                .curveEaseInOut, .allowUserInteraction]
        
        view.animate(animations: animations, reversed: false,
                     initialAlpha: 1, finalAlpha: 1, delay: 0,
                     duration: duration, options: options) {}
        
        // Deamon Animation
        AnimationDeamon.deamon(view: view) { (view) in
            zoom(view: view, from: min, to: max, duration: duration, repeats: repeats)
        }
    }
}

