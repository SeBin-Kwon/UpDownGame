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
    var maxNumber: Int?
    var minNumber = 1
    var selectNumber = 1
    lazy var totalList = Array(1...(maxNumber ?? 1))
    var answer = 0
    var remainingList = [Int]()
    var count = 0
    var countText: String {
        "시도 횟수: \(count)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        configureLabelUI()
        configureCollectionView()
        resultButton.configureButtonUI(.black, for: .normal)
        resultButton.configureButtonUI(.gray, for: .disabled)
        resultButton.isEnabled = false
        configureCollectionViewLayout()
        view.backgroundColor = .background
        answer = Int.random(in: 1...(maxNumber ?? 1))
        remainingList = totalList
    }
    
    
    @IBAction func resultButtonTapped(_ sender: UIButton) {
        if selectNumber < answer {
            titleLabel.text = "UP"
            updateRemainigList(min: selectNumber, max: maxNumber ?? 1)
            minNumber = selectNumber
        } else if selectNumber > answer {
            titleLabel.text = "DOWN"
            updateRemainigList(min: minNumber, max: selectNumber-1)
            maxNumber = selectNumber
        } else {
            titleLabel.text = "GOOD!"
            return
        }
        count += 1
        subLabel.text = countText
        resultButton.isEnabled = false
        collectionView.reloadData()
    }
    
    func updateRemainigList(min: Int, max: Int) {
        remainingList = Array(totalList[min..<max])
    }
    
    private func configureLabelUI() {
        subLabel.text = "시도 횟수: 0"
    }
    

}


// MARK: CollectionView
extension UpDownViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    private func configureCollectionView() {
        let id = UpDownCollectionViewCell.identifier
        let xib = UINib(nibName: id, bundle: nil)
        collectionView.register(xib, forCellWithReuseIdentifier: id)
        collectionView.backgroundColor = .background
    }
    
    private func configureCollectionViewLayout() {
        let cellSpacing: CGFloat = 10
        let minimumLineSpacing: CGFloat = 10
        let minimumInteritemSpacing: CGFloat = 5
        let cellCount: CGFloat = 6
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = minimumLineSpacing
        layout.minimumInteritemSpacing = minimumInteritemSpacing
        let width = UIScreen.main.bounds.width
        let cellWidth = width - (cellSpacing * (cellCount-1))
        layout.itemSize = CGSize(width: cellWidth / cellCount, height: cellWidth / cellCount)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        collectionView.collectionViewLayout = layout
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? UpDownCollectionViewCell else { return }
        cell.updateCell(false)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? UpDownCollectionViewCell else { return }
        cell.updateCell(true)
        selectNumber = remainingList[indexPath.item]
        resultButton.isEnabled = true
    }
    
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        remainingList.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UpDownCollectionViewCell.identifier, for: indexPath)
        guard let collectionCell = cell as? UpDownCollectionViewCell else { return cell }
        
        collectionCell.cellLabel.text = String(remainingList[indexPath.item])
        collectionCell.configureData(text: String(remainingList[indexPath.item]))
        collectionCell.layer.cornerRadius = collectionCell.frame.height / 2
        return collectionCell
    }
    
}
