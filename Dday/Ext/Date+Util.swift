//
//  Date+Util.swift
//  Dday
//
//  Created by Ko Minhyuk on 5/27/25.
//

import Foundation

extension Date {
    init(year: Int, month: Int, day: Int, hour: Int? = nil, minute: Int? = nil, second: Int? = nil) {
        let calendar = Calendar.current
        let components = DateComponents(year: year, month: month, day: day, hour: hour, minute: minute, second: second)
        
        self = calendar.date(from: components) ?? .now
    }
    
    func days(from date: Date) -> Int? {
        let calendar = Calendar.current
        let from = calendar.startOfDay(for: date) // yyyy mm dd hh:mm
        let to = calendar.startOfDay(for: self)
        
        return calendar.dateComponents([.day], from: from, to: to).day
    }
    
    static var today: Date {
        let calendar = Calendar.current
        return calendar.startOfDay(for: .now)
    }
}
