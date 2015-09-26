//
//  ViewController.swift
//  TimeCamouflage
//
//  Created by h3poteto on 09/20/2015.
//  Copyright (c) 2015 h3poteto. All rights reserved.
//

import UIKit
import TimeCamouflage

class ViewController: UIViewController {
    @IBOutlet var TimeLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let calendar = NSCalendar(identifier: NSCalendarIdentifierGregorian)
        let utcDateFormatter = NSDateFormatter()
        utcDateFormatter.calendar = calendar
        utcDateFormatter.dateStyle = NSDateFormatterStyle.LongStyle
        utcDateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
        utcDateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        utcDateFormatter.timeZone = NSTimeZone(forSecondsFromGMT: 0)

        
        let current = NSDate(timeIntervalSinceNow: 0)
        let today = utcDateFormatter.stringFromDate(current)
        self.TimeLabel.text = today
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

