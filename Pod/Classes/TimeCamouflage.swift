//
//  TimeCamouflage.swift
//  Pods
//
//  Created by akirafukushima on 2015/09/20.
//
//

import Foundation


//
//  TimeCamouflage.swift
//  TimeCamouflage
//
//  Created by akirafukushima on 2015/09/20.
//  Copyright © 2015年 h3poteto. All rights reserved.
//

import Foundation


extension NSDate {
    class func travelDateWithTimeIntervalSinceNow(seconds: NSTimeInterval) {
        
    }
    
    // クラス変数として保存しておく値
    private struct ClassProperty {
        static var TravelTime = NSTimeInterval(0)
    }
    
    class var TravelTime: NSTimeInterval {
        get {
        return ClassProperty.TravelTime
        }
        set(travel) {
            ClassProperty.TravelTime = travel
        }
    }
    
    convenience init(travelTime: NSTimeInterval) {
        self.init()
        self.dynamicType.TravelTime = travelTime
        self.overrideClassMethod("dateWithTimeIntervalSinceNow:", new: "travelDateWithTimeIntervalSinceNow:")
        self.overrideInstanceMethod("timeIntervalSinceNow", new: "travelTimeIntervalSinceNow")
    }
    
    func overrideClassMethod(original: Selector, new: Selector) {
        let originalMethod = class_getClassMethod(self.dynamicType, original)
        let newMethod = class_getClassMethod(self.dynamicType, new)
        method_exchangeImplementations(originalMethod, newMethod)
    }
    func overrideInstanceMethod(original: Selector, new: Selector) {
        return self.overrideInstanceMethod(original, new: new, originalClass: self.dynamicType)
    }
    func overrideInstanceMethod(original: Selector, new: Selector, originalClass: AnyClass) {
        let originalMethod = class_getInstanceMethod(originalClass, original)
        let newMethod = class_getInstanceMethod(self.dynamicType, new)
        method_exchangeImplementations(originalMethod, newMethod)
    }
    
    func travelTimeIntervalSinceNow() {
        
    }
}
