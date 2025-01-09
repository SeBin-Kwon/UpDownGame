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
    let totalList = Array(1...300)
    var maxNumber: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        configureCollectionView()
        resultButton.configureButtonUI()
    }
    
    private func configureCollectionView() {
        let id = UpDownCollectionViewCell.identifier
        let xib = UINib(nibName: id, bundle: nil)
        collectionView.register(xib, forCellWithReuseIdentifier: id)
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
        
        return collectionCell
    }
    
}
