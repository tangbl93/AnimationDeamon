//
//  AnimationDeamonItem.swift
//  
//
//  Created by tangbl93 on 2021/2/25.
//

import UIKit

public typealias AnimationDeamonAction = (_ view: UIView)->Void

public class AnimationDeamonItem {
    
    weak var view: UIView?
    var action: AnimationDeamonAction?
    var isPaused: Bool = false
    
    // init() {}
    convenience init(view: UIView?, action: AnimationDeamonAction?) {
        self.init()
        
        self.view = view
        self.action = action
    }
}

extension AnimationDeamonItem: Equatable {
    public static func == (lhs: AnimationDeamonItem, rhs: AnimationDeamonItem) -> Bool {
        return lhs.view == rhs.view
    }
}

extension AnimationDeamonItem {
    
    func deamon() -> UIView? {
        // clear
        guard let view = view else {
            AnimationDeamon.remove(self)
            return nil
        }
        return view
    }
    
    func process() {
        guard let view = deamon() else { return }
        
        var contains: Bool = false
        if let _ = view.window {
            contains = true
        } else {
            isPaused = true
        }

        if isPaused && contains {
            resume()
        }
    }
    
    func freeze() {
        
        isPaused = true
    }
    
    func resume() {
        isPaused = false
        
        guard let view = deamon() else { return }
        action?(view)
    }
}

