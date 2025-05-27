//
//  Event.swift
//  Dday
//
//  Created by Ko Minhyuk on 5/27/25.
//

import Foundation
import UIKit

struct Event {
    // TODO: CaseIterable 복습하기
    enum Category: String, CaseIterable {
        case birthday
        case business
        case diet
        case wedding
        case travel
        case exam
        case love
        case football
        case baseball
        case basketball
        
        var title: String {
            switch self {
            case .birthday:
                return "생일"
            case .business:
                return "업무"
            case .diet:
                return "다이어트"
            case .wedding:
                return "결혼"
            case .travel:
                return "여행"
            case .exam:
                return "시험"
            case .love:
                return "연애"
            case .football:
                return "축구"
            case .baseball:
                return "야구"
            case .basketball:
                return "농구"
            }
        }
    }
    
    let date: Date
    let title: String
    let backgroundColor: UIColor
    let textColor: UIColor
    let icon: String
    
    var daysString: String?
    var dateString: String?
    var iconImage: UIImage?
    
    init(
        date: Date,
        title: String,
        backgroundColor: UIColor,
        textColor: UIColor,
        icon: String
    ) {
        self.date = date
        self.title = title
        self.backgroundColor = backgroundColor
        self.textColor = textColor
        self.icon = icon
        
        if let day = date.days(from: Date.today) {
            daysString = if day >= 0 { "D-\(abs(day))" } else { "D+\(abs(day))" }
        } else {
            daysString = nil
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        dateString = formatter.string(from: date)
        
        iconImage = UIImage(named: icon)
    }
    
    init(data: ComposeData) {
        self.init(date: data.date!, title: data.title!, backgroundColor: data.backgroundColor!, textColor: data.textColor!, icon: data.category!.rawValue)
    }
}


var events = [
    Event(date: Date(year: 2002, month: 5, day: 31), title: "한일 월드컴", backgroundColor: .systemBlue, textColor: .white, icon: "football"),
    Event(date: Date(year: 2022, month: 11, day: 20), title: "카타르 월드컴", backgroundColor: .brown, textColor: .white, icon: "football"),
    Event(date: Date(year: 2026, month: 6, day: 11), title: "북중미 월드컴", backgroundColor: .green, textColor: .black, icon: "football"),
    Event(date: Date(year: 1997, month: 07, day: 09), title: "햄쮸탄신일", backgroundColor: .orange, textColor: .white, icon: "hamster"),
    Event(date: Date(year: 2022, month: 11, day: 12), title: "우리 이제 썸 그만타요", backgroundColor: .systemPink, textColor: .white, icon: "")
]
