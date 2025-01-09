//
//  UpDownCollectionViewCell.swift
//  UpDownGame
//
//  Created by Sebin Kwon on 1/9/25.
//

import UIKit

class UpDownCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var cellLabel: UILabel!
    @IBOutlet var cellBackground: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureLabelUI()
    }
    
    func updateCell(_ isSelected: Bool) {
        cellBackground.backgroundColor = isSelected ? .black : .white
        cellLabel.textColor = isSelected ? .white : .black
    }
    
    private func configureLabelUI() {
        cellLabel.font = .systemFont(ofSize: 13, weight: .bold)
        cellLabel.textAlignment = .center
        cellBackground.backgroundColor = .white
    }
    
    func configureData(text: String) {
        cellLabel.text = text
        cellLabel.textColor = .black
        cellBackground.backgroundColor = .white
    }
    
}
