//
//  UpDownViewController.swift
//  UpDownGame
//
//  Created by Sebin Kwon on 1/9/25.
//

import UIKit

class UpDownViewController: UIViewController {

    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var resultButton: UIButton!
    let totalList = Array(1...300)
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        resultButton.configureButtonUI()
    }
    
    private func configureCollectionView() {
        let id = UpDownCollectionViewCell.identifier
        let xib = UINib(nibName: id, bundle: nil)
        collectionView.register(xib, forCellWithReuseIdentifier: id)
    }
    
    

}

//
//extension UIViewController: UICollectionViewDelegate, UICollectionViewDataSource {
//    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        <#code#>
//    }
//    
//    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        <#code#>
//    }
//    
//}
