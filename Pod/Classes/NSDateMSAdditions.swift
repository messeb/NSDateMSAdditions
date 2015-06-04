//
//  NSDate-MSAdditions.swift
//
//  Created by messeb on 04.06.15.
//
//

import Foundation

@objc public protocol NSDateMSAdditions {

    /**
    * Returns a new date with the time 00:00:00
    */
    func ms_startOfDay() -> NSDate?

    /**
    * Returns a new date with the time 23:59:59
    */
    func ms_endOfDay() -> NSDate?
    
    /**
    * Checks if the current date is on the same day as the given date
    */
    func ms_isSameDayAsDate(date: NSDate ) -> Bool

    /**
    * Create a new date with the given day, month and year with time 00:00:00
    */
    static func ms_dateForDay(date: NSInteger, month: NSInteger, year: NSInteger) -> NSDate?
    
}

extension NSDate : NSDateMSAdditions {
    
    public func ms_startOfDay() -> NSDate? {
        let date = NSDate(timeIntervalSince1970: self.timeIntervalSince1970)
        let calendar = NSCalendar.currentCalendar()
        let dateComponents = NSCalendarUnit.CalendarUnitYear |
            NSCalendarUnit.CalendarUnitMonth |
            NSCalendarUnit.CalendarUnitDay |
            NSCalendarUnit.CalendarUnitHour |
            NSCalendarUnit.CalendarUnitMinute |
            NSCalendarUnit.CalendarUnitSecond
        
        let parts = calendar.components(dateComponents, fromDate: date)
        parts.hour = 0
        parts.minute = 0
        parts.second = 0
        
        return calendar.dateFromComponents(parts)
    }
    
    public func ms_endOfDay() -> NSDate? {
        let date = NSDate(timeIntervalSince1970: self.timeIntervalSince1970)
        let calendar = NSCalendar.currentCalendar()
        let dateComponents = NSCalendarUnit.CalendarUnitYear |
            NSCalendarUnit.CalendarUnitMonth |
            NSCalendarUnit.CalendarUnitDay |
            NSCalendarUnit.CalendarUnitHour |
            NSCalendarUnit.CalendarUnitMinute |
            NSCalendarUnit.CalendarUnitSecond
        
        let parts = calendar.components(dateComponents, fromDate: date)
        parts.hour = 23
        parts.minute = 59
        parts.second = 59
        
        return calendar.dateFromComponents(parts)
    }
    
    public func ms_isSameDayAsDate(date: NSDate ) -> Bool {
        let calendar = NSCalendar.currentCalendar()
        
        let dateComponents = NSCalendarUnit.CalendarUnitYear |
            NSCalendarUnit.CalendarUnitMonth |
            NSCalendarUnit.CalendarUnitDay
        
        let comp1 = calendar.components(dateComponents, fromDate:self)
        let comp2 = calendar.components(dateComponents, fromDate:date)
        
        let isEqual = comp1.day == comp2.day &&
            comp1.month == comp2.month &&
            comp1.year == comp2.year
        
        return isEqual
    }
    
    public static func ms_dateForDay(day: NSInteger, month: NSInteger, year: NSInteger) -> NSDate? {
        
        let calendar = NSCalendar.currentCalendar();
        let dateComponents = NSDateComponents();
        dateComponents.day = day
        dateComponents.month = month
        dateComponents.year = year
        dateComponents.hour = 0
        dateComponents.minute = 0
        dateComponents.second = 0
        
        return calendar.dateFromComponents(dateComponents)
    }
    
}
