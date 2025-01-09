//
//  UpDownViewController.swift
//  UpDownGame
//
//  Created by Sebin Kwon on 1/9/25.
//

import UIKit

class UpDownViewController: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subLabel: UILabel!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var resultButton: UIButton!
    static let identifier = "UpDownViewController"
    var maxNumber: Int?
    var beforeSelected = Cell(number: 0, isSelected: false)
    var selectNumber = 1
    lazy var totalList = Array(1...(maxNumber ?? 1))
    var answer = 0
    var cellList: [Cell] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        configureCollectionView()
        resultButton.configureButtonUI()
        configureCollectionViewLayout()
        view.backgroundColor = .background
        answer = Int.random(in: 1...(maxNumber ?? 1))
        totalList.forEach {
            cellList.append(Cell(number: $0, isSelected: false))
        }
    }
    
    
    @IBAction func resultButtonTapped(_ sender: UIButton) {
        guard let max = maxNumber else { return }
//        if selectNumber < answer {
//            titleLabel.text = "UP"
//        } else if selectNumber > answer {
//
//        } else {
//            titleLabel.text = "GOOD"
//        }
//        collectionView.reloadData()
    }
    
    private func configureCollectionView() {
        let id = UpDownCollectionViewCell.identifier
        let xib = UINib(nibName: id, bundle: nil)
        collectionView.register(xib, forCellWithReuseIdentifier: id)
        collectionView.backgroundColor = .background
    }
    
    func configureCollectionViewLayout() {
        let cellSpacing: CGFloat = 5
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let width = UIScreen.main.bounds.width
        let cellWidth = width - (cellSpacing * 5)
        layout.itemSize = CGSize(width: cellWidth / 6, height: cellWidth / 6)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView.collectionViewLayout = layout
    }
    
}




extension UpDownViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if beforeSelected.number != cellList[indexPath.item].number && beforeSelected.isSelected { return }
        cellList[indexPath.item].isSelected.toggle()
        selectNumber = cellList[indexPath.item].number
        beforeSelected = cellList[indexPath.item]
        collectionView.reloadData()
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        totalList.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UpDownCollectionViewCell.identifier, for: indexPath)
        guard let collectionCell = cell as? UpDownCollectionViewCell else { return cell }
//        let range = selectNumber...(maxNumber ?? 1)
        
        collectionCell.cellLabel.text = String(cellList[indexPath.item].number)
        collectionCell.updateCell(isSelected: cellList[indexPath.item].isSelected)
        collectionCell.layer.cornerRadius = collectionCell.frame.height / 2
        return collectionCell
    }
    
}
