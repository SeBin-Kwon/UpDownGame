//
//  UIViewController+Extension.swift
//  UpDownGame
//
//  Created by Sebin Kwon on 1/10/25.
//

import UIKit

extension UIViewController {
    
    static var identifier: String {
        String(describing: self)
    }
    
    func displayAlert(_ title: String) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .cancel)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    func checkNumber(_ num: Int) -> Bool {
        if num < 1 {
            displayAlert("1 이상으로 입력해 주세요")
            return false
        } else if num > 300 {
            displayAlert("300 이하로 입력해 주세요")
            return false
        }
        return true
    }
    
}
