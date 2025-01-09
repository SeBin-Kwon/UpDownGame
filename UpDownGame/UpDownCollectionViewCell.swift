//
//  UpDownCollectionViewCell.swift
//  UpDownGame
//
//  Created by Sebin Kwon on 1/9/25.
//

import UIKit

class UpDownCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "UpDownCollectionViewCell"
    @IBOutlet var cellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureLabelUI()
    }
    
    private func configureLabelUI() {
        cellLabel.font = .systemFont(ofSize: 13, weight: .bold)
        cellLabel.textAlignment = .center
    }

}
