import UIKit

let worldCup2002Date = Date(year: 2002, month: 5, day: 31)
Date.today.days(from: worldCup2002Date)
Date.today

let event = Event(date: worldCup2002Date, title: "2002 월드컵 개막일", backgroundColor: .red, textColor: .white, icon: "")
event.dayString

// ============================================================

// 구조체 날짜 타입
Date()
Date.now

// 클래스 날짜 타입
NSDate()
NSDate.now

// 달력타입
// 구조체
Calendar.current
// 클래스
NSCalendar.current

TimeZone.current

NSTimeZone.local

let nsDate = Date.now as NSDate
// Toll-free bridged Type

let now = Date()
print(now)
// 콘솔에서는 항상 UTC 시간으로 출력

// 날짜타입 내부에는 기준 날짜로부터 몇 초가 지났는지

var dt = Date(timeIntervalSinceReferenceDate: 60 * 60)

print(dt)

dt = Date(timeIntervalSinceReferenceDate: 60 * 60 * -1)
print(dt)

// 날짜와 시간 처리의 기본 단위는 TimeInterval(1초)

let oneMilliseconds = TimeInterval(0.001)
// 1분
let oneMinute = TimeInterval(60)
// 한시간
let oneHour = TimeInterval(oneMinute * 60)
// 하루
let oneDay = oneHour * 24
// 일주일
let oneWeek = oneDay * 7


let after24Hour = Date(timeIntervalSinceNow: oneDay)
print(after24Hour)

//Date(timeIntervalSince1970: TimeInterval)

// 1970-01-01 00:00:00 Unix Epoch 유닉스의 기준 날짜

// 달력
// 양력, 음력, 히브리역
Calendar.Identifier.gregorian

Calendar.current    // 변경 추적X
Calendar.autoupdatingCurrent    // 변경 추적O

// 날짜 계산/조작하려면 항상 Calendar가 필요

// DateComponents
// 컴포넌트 : 날짜와 시간을 구성하는 개별 요소 Ex) y, m, d, h, m, s
//DateComponents
//NSDateComponents

let calendar = Calendar.current
var comps = calendar.dateComponents([.year, .month, .day], from: now)

comps.year
comps.month
comps.day

calendar.component(.year, from: now)


// 날짜 계산
// 오늘 기준으로 +100
let today = calendar.startOfDay(for: .now)

var day100comps = DateComponents()
day100comps.day = 100

calendar.date(byAdding: day100comps, to: today)


// Date Formatter

let formatter = DateFormatter()

formatter.dateStyle = .full
formatter.timeStyle = .medium
formatter.locale = Locale(identifier: "ko_KR")

var result = formatter.string(from: now)
print(result)

//formatter.string(from: <#T##Date#>)
//formatter.string(for: <#T##Any?#>)

formatter.locale = Locale(identifier: "en_us")
formatter.setLocalizedDateFormatFromTemplate("yyyyMMMMdE")
result = formatter.string(from: now)
print(result)

formatter.locale = Locale(identifier: "ko_kr")
formatter.setLocalizedDateFormatFromTemplate("yyyyMMMMdE")
result = formatter.string(from: now)
print(result)

let yesterday = now.addingTimeInterval(3600 * -24)
let tomorrow = now.addingTimeInterval(3600 * 24)

formatter.locale = Locale(identifier: "ko_KR")
formatter.dateStyle = .full
formatter.timeStyle = .none
formatter.doesRelativeDateFormatting = true

print(formatter.string(from: now))
print(formatter.string(from: yesterday))
print(formatter.string(from: tomorrow))


let weekdaySymbols = ["☀️", "🌕", "🔥", "💧", "🌲", "🥇", "🌏"]
let am = "🌅"
let pm = "🌇"


formatter.dateStyle = .full
formatter.timeStyle = .full

formatter.amSymbol = am
formatter.pmSymbol = pm
formatter.weekdaySymbols = weekdaySymbols

print(formatter.string(from: now))
print(formatter.string(from: yesterday))
print(formatter.string(from: tomorrow))


// 문자열 -> Date
let str = "2017-09-02T09:30:00Z"

formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"

if let date = formatter.date(from: str) {
   formatter.dateStyle = .full
   formatter.timeStyle = .full

   print(formatter.string(from: date))
} else {
   print("invalid format")
}


// 범위 포맷팅
// 안쓰는 방식/플랜B 방식
let startDate = Date()
let endDate = startDate.addingTimeInterval(3600 * 24 * 30)

formatter.locale = Locale(identifier: "ko_KR")
formatter.dateStyle = .long
formatter.timeStyle = .short

print("\(formatter.string(from: startDate)) - \(formatter.string(from: endDate))")

let intervalFormatter = DateIntervalFormatter()
intervalFormatter.locale = Locale(identifier: "ko_KR")
//intervalFormatter.dateStyle = .long
//intervalFormatter.timeStyle = .short

intervalFormatter.dateTemplate = "yyyyMMdE"


print(intervalFormatter.string(from: startDate, to: endDate))


// 컴포넌트 포맷팅

let componentsFormatter = DateComponentsFormatter()
componentsFormatter.unitsStyle = .full
componentsFormatter.calendar?.locale = Locale(identifier: "ko_Kr")

if let result = componentsFormatter.string(from: startDate, to: endDate) {
    print(result)
}

comps = DateComponents()
comps.hour = 1
comps.minute = 30
comps.second = 12

componentsFormatter.unitsStyle = .positional
componentsFormatter.zeroFormattingBehavior = .pad
componentsFormatter.string(from: comps)

componentsFormatter.string(from: comps)

componentsFormatter.allowedUnits = [.minute]

componentsFormatter.string(from: comps)

componentsFormatter.includesApproximationPhrase = true
componentsFormatter.includesTimeRemainingPhrase = true
componentsFormatter.string(from: comps)
