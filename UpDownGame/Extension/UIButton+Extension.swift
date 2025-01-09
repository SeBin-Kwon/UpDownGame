//
//  UIViewController+Extension.swift
//  UpDownGame
//
//  Created by Sebin Kwon on 1/9/25.
//

import UIKit

extension UIButton {
    func configureButtonUI() {
        self.backgroundColor = .black
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
    }
}
