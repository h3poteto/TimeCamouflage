//
//  TimeCamouflage.swift
//  Pods
//
//  Created by akirafukushima on 2015/09/20.
//
//

import Foundation

class TimeCamouflage {
    func Time() {
    }
}


extension NSDate {
    class func travelDateWithTimeIntervalSinceNow(seconds: NSTimeInterval) {
        
    }
    
    // クラス変数として保存しておく値
    private struct ClassProperty {
        static var TravelTime = NSTimeInterval(0)
        static var CurreentDate: NSDate?
    }
    
    class var TravelTime: NSTimeInterval {
        get {
            return ClassProperty.TravelTime
        }
        set(travel) {
            ClassProperty.TravelTime = travel
        }
    }
    class var CurrentDate: NSDate? {
        get {
            return ClassProperty.CurreentDate
        }
        set(date) {
            ClassProperty.CurreentDate = date
        }
     }
    
    class func TravelDate() -> NSDate {
        guard let date = CurrentDate else {
            return NSDate()
        }
        
        return date.dateByAddingTimeInterval(TravelTime)
    }
    
    convenience init(date: NSDate?, travelTime: NSTimeInterval) {
        self.init()
        self.dynamicType.TravelTime = travelTime
        if date == nil {
            self.dynamicType.CurrentDate = NSDate()
        } else {
            self.dynamicType.CurrentDate = date
        }
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
    
    func travelTimeIntervalSinceNow() -> NSTimeInterval {
        return self.timeIntervalSinceDate(self.dynamicType.TravelDate())
        
    }
    
    func travelDateFromString(dateString: String, timeZone: NSTimeZone) -> NSDate {
        let formatter = NSDateFormatter()
        let locale = NSLocale(localeIdentifier: "en_US")
        formatter.locale = locale
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        formatter.timeZone = timeZone
        return formatter.dateFromString(dateString)!
    }
}
