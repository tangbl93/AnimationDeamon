//
//  AnimationDeamon.swift
//  
//
//  Created by tangbl93 on 2021/2/25.
//

import UIKit

// https://github.com/airbnb/lottie-ios/issues/481
// https://gist.github.com/grzegorzkrukowski/a5ed8b38bec548f9620bb95665c06128

public final class AnimationDeamon {
    fileprivate let isEnabled: Bool = true
    fileprivate let swizzledDeamon: Bool = true
    fileprivate static var shared: AnimationDeamon = AnimationDeamon()
    
    private var displayLink:Timer!
    private var isActive: Bool = true
    
    private var items: [AnimationDeamonItem] = []
    
    private init() {
        if swizzledDeamon {
            UIViewController.swizzledDeamon
        } else {
            self.startDisplayLink()
        }
        
        self.startObserverGCD()
    }
    
    deinit {
        if swizzledDeamon {} else {
            self.stopDisplayLink()
        }
        
        self.removeObserverGCD()
    }
}

// MARK: Timer Deamon: switch ViewController will freeze animation
private extension AnimationDeamon {
    
    func startDisplayLink() {
        
        displayLink = nil
        displayLink = Timer.init(timeInterval: 0.5, target: self,
                                 selector: #selector(processDisplayLink), userInfo: nil, repeats: true)
        RunLoop.current.add(displayLink, forMode: .common)
    }
    
    func stopDisplayLink() {
        displayLink.invalidate()
    }
    
    @objc func processDisplayLink() {
        if isActive {} else {
            return
        }
        
        for item in items {
            item.process()
        }
    }
}

// MARK: Observer Deamon: didEnterBackground will freeze animation
private extension AnimationDeamon {
    
    private func startObserverGCD() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(didBecomeActive), name: UIApplication.willEnterForegroundNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(willResignActive), name: UIApplication.didEnterBackgroundNotification, object: nil)
    }
    
    private func removeObserverGCD() {
        
        NotificationCenter.default.removeObserver(self)
    }
        
    @objc private func didBecomeActive() {
        isActive = true
        
        for item in items {
            item.resume()
        }
    }
    
    @objc private func willResignActive() {
        isActive = false
        
        for item in items {
            item.freeze()
        }
    }
}

// MARK: Manage Deamon Item
public extension AnimationDeamon {
    
    static func deamon(view: UIView, action: @escaping AnimationDeamonAction) {
        // distinct deamon
        for item in shared.items where item.view == view {
            return
        }
        
        let item = AnimationDeamonItem(view: view, action: action)
        shared.items.append(item)
    }
    
    static func remove(_ item: AnimationDeamonItem) {
        shared.items.removeAll { (object:AnimationDeamonItem?) -> Bool in
            return object == item
        }
    }
}

// MARK: UIViewController swizzled_viewDidAppear(_:)
private extension UIViewController {
    static let swizzledDeamon: Void = {
        guard let originalMethod = class_getInstanceMethod(UIViewController.self, #selector(viewDidAppear(_:))),
              let swizzledMethod = class_getInstanceMethod(UIViewController.self, #selector(swizzled_viewDidAppear(_:))) else { return }
        method_exchangeImplementations(originalMethod, swizzledMethod)
    }()
    
    @objc func swizzled_viewDidAppear(_ animated: Bool) {
        swizzled_viewDidAppear(animated)
        AnimationDeamon.shared.processDisplayLink()
    }
}
