//
//  ViewController.swift
//  Dday
//
//  Created by Ko Minhyuk on 5/27/25.
//

import UIKit

class ViewController: UIViewController {
    
    // 셀에 있는 뷰와 아웃렛을 연결할 때는 셀 클래스와 연결해야 한다.
    // 테이블 뷰는 셀의 높이를 자동으로 계산하고 필요한 높이로 표시해준다 > Self-sizing
    // 

    @IBOutlet weak var eventTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(forName: .eventDidInsert, object: nil, queue: .main) { [weak self] _ in
            self?.eventTableView.reloadData()
        }
    }
}



extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: EventTableViewCell.self), for: indexPath) as! EventTableViewCell
        
        let target = events[indexPath.row]
        
        cell.iconImageView.image = target.iconImage
        cell.titleLabel.text = target.title
        cell.dateLabel.text = target.dateString
        cell.daysLabel.text = target.daysString
        
        cell.containerView.backgroundColor = target.backgroundColor
        cell.titleLabel.textColor = target.textColor
        cell.dateLabel.textColor = target.textColor
        cell.daysLabel.textColor = target.textColor
        
        return cell
    }
}
