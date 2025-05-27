//
//  ComposeViewController.swift
//  Dday
//
//  Created by Ko Minhyuk on 5/27/25.
//

import UIKit

extension Notification.Name {
    static let eventDidInsert = Notification.Name("eventDidInsert")
}

class ComposeViewController: UIViewController {
    
    var data: ComposeData?
    
    @IBOutlet weak var backgroundColorCollectionView: UICollectionView!
    @IBOutlet weak var textColorCollectionView: UICollectionView!
    @IBOutlet weak var titleField: UITextField!
    
    @IBAction func save(_ sender: Any) {
        guard let text = titleField.text else { return }
        
        
        data?.title = text
        // 데이터 검증
        if let data {
            let event = Event(data: data)
            events.append(event)
        }
        
        NotificationCenter.default.post(name: .eventDidInsert, object: nil)
        dismiss(animated: true)
    }
    
    let colors: [UIColor] = [
        .systemRed,
        .systemOrange,
        .systemYellow,
        .systemGreen,
        .systemBlue,
        .systemPurple,
        .systemPink,
        .systemTeal,
        .systemIndigo,
        .systemGray,
        .black,
        .white
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
}

extension ComposeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ColorCollectionViewCell.self), for: indexPath) as! ColorCollectionViewCell
        
        if colors.count == indexPath.item {
            cell.colorImageView.image = UIImage(named: "color-picker")
            cell.colorImageView.tintColor = nil
        } else {
            // TODO: 템플릿 이미지 조사해보기
            cell.colorImageView.image = UIImage(named: "color-picker")?.withRenderingMode(.alwaysTemplate)
            cell.colorImageView.tintColor = colors[indexPath.item]
        }
        
        return cell
    }
}

extension ComposeViewController: UICollectionViewDelegate {
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        
        if indexPath.item == colors.count {
            let colorPicker = UIColorPickerViewController()
            colorPicker.title = collectionView == backgroundColorCollectionView ? "배경색" : "글자색"
            colorPicker.supportsAlpha = false
            colorPicker.delegate = self
            
            
            present(colorPicker, animated: true)
        } else {
            let selectedColor = colors[indexPath.item]
            
            if collectionView == backgroundColorCollectionView {
                data?.backgroundColor = selectedColor
            } else {
                data?.textColor = selectedColor
            }
            
            dump(data)
        }
    }
}

extension ComposeViewController: UIColorPickerViewControllerDelegate {
    func colorPickerViewControllerDidFinish( _ viewController: UIColorPickerViewController) {
        
    }
    
    func colorPickerViewController( _ viewController: UIColorPickerViewController, didSelect color: UIColor, continuously: Bool) {
        if !continuously {
            if !continuously {
                if viewController.title == "배경색" {
                    data?.backgroundColor = color
                } else {
                    data?.textColor = color
                }
            }
            print(data?.backgroundColor)
            print(data?.textColor)
        }
    }
}
