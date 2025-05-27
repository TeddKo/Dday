//
//  CategoryViewController.swift
//  Dday
//
//  Created by Ko Minhyuk on 5/27/25.
//

import UIKit

class CategoryViewController: UIViewController {
    
    var data = ComposeData()
    
    @IBOutlet weak var CategoryCollcetionView: UICollectionView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UICollectionViewCell, let indexPath = CategoryCollcetionView.indexPath(for: cell) {
            if let vc = segue.destination as? DateSelectionViewController {
                data.category = Event.Category.allCases[indexPath.item]
                
                vc.data = data
            }
        }
        print(#function)
    }
    
    func setupLayout() {
        let size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.33), heightDimension: .estimated(120))
        let item = NSCollectionLayoutItem(layoutSize: size)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(120))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = .flexible(20)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
        section.interGroupSpacing = 20
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        CategoryCollcetionView.collectionViewLayout = layout
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        isModalInPresentation = true
        CategoryCollcetionView.delegate = self
    }
}

extension CategoryViewController: UICollectionViewDataSource {
    func collectionView( _ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(#function)
        return Event.Category.allCases.count
    }

    func collectionView( _ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CategoryCollectionViewCell.self), for: indexPath) as! CategoryCollectionViewCell

        let target = Event.Category.allCases[indexPath.item] // row 대신 item!!!!!!!!!
        cell.categoryTitleLabel.text = target.title
        cell.categoryImage.image = UIImage(named: target.rawValue)

        return cell
    }
}

extension CategoryViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(#function)
    }
}
