// https://github.com/Quick/Quick

import Quick
import Nimble
import NSDateMSAdditions

class NSDateMSAdditionsSpec: QuickSpec {
    override func spec() {
        describe("ms_startOfDay tests") {

            it("should have the time 00:00:00") {
                
                let dateComponents = NSCalendarUnit.CalendarUnitHour |
                    NSCalendarUnit.CalendarUnitMinute |
                    NSCalendarUnit.CalendarUnitSecond
                
                if let date = NSDate().ms_startOfDay() {
                    let dateParts = NSCalendar.currentCalendar().components(dateComponents, fromDate: date)
                
                    expect(dateParts.hour) == 0
                    expect(dateParts.minute) == 0
                    expect(dateParts.second) == 0
                } else {
                    fail()
                }
            }
        }

        context("ms_endOfDay tests") {

            it("should have the time 23:59:59") {
                
                let dateComponents = NSCalendarUnit.CalendarUnitHour |
                    NSCalendarUnit.CalendarUnitMinute |
                    NSCalendarUnit.CalendarUnitSecond
                
                if let date = NSDate().ms_endOfDay() {
                    let dateParts = NSCalendar.currentCalendar().components(dateComponents, fromDate: date)
                    
                    expect(dateParts.hour) == 23
                    expect(dateParts.minute) == 59
                    expect(dateParts.second) == 59
                } else {
                    fail()
                }
            }
        }
    }
}
