import UIKit

// 날짜 파싱

var str = "2017-09-02T09:30:00Z"

let formatter = ISO8601DateFormatter()

if let date = formatter.date(from: str) {
    print(date)
} else {
    print("fail")
}


str = "2017-09-02"

//formatter.formatOptions = [.withYear, .withMonth, .withDay, .withDashSeparatorInDate]

formatter.formatOptions = [.withFullDate]

if let date = formatter.date(from: str) {
    print(formatter.string(from: date))
} else {
    print("fail")
}
