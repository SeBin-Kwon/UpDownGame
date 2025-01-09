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
    let totalList = Array(1...300)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        configureCollectionView()
        resultButton.configureButtonUI()
        configureCollectionViewLayout()
        view.backgroundColor = .background
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

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        totalList.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UpDownCollectionViewCell.identifier, for: indexPath)
        guard let collectionCell = cell as? UpDownCollectionViewCell else { return cell }

        collectionCell.cellLabel.text = String(totalList[indexPath.item])
        collectionCell.backgroundColor = .white
        
        collectionCell.layer.cornerRadius = collectionCell.frame.height / 2
        return collectionCell
    }
    
}
