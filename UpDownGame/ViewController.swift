//
//  ViewController.swift
//  UpDownGame
//
//  Created by Sebin Kwon on 1/9/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subLabel: UILabel!
    @IBOutlet var textField: UITextField!
    @IBOutlet var startButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.configureButtonUI()
        configureTextField()
        setupKeyboardEvent()
    }
    
    
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        guard let number = textField.text else { return }
        let vc = storyboard?.instantiateViewController(withIdentifier: UpDownViewController.identifier) as? UpDownViewController
        guard let vc else { return }
        vc.maxNumber = Int(number)
        view.endEditing(true)
        navigationController?.pushViewController(vc, animated: true)
    }
    
}


extension ViewController {
    private func configureTextField() {
        textField.borderStyle = .none
        textField.keyboardType = .numberPad
        textField.backgroundColor = .none
        textField.textColor = .black
        textField.font = .boldSystemFont(ofSize: 20)
        let centeredParagraphStyle = NSMutableParagraphStyle()
        centeredParagraphStyle.alignment = .center
        textField.attributedPlaceholder = NSAttributedString(string: "최대 숫자를 입력해주세요", attributes: [
            .foregroundColor: UIColor.black,
            .font: UIFont.systemFont(ofSize: 20, weight: .semibold),
            .paragraphStyle: centeredParagraphStyle
        ])
        let border = CALayer()
        border.frame = CGRect(x: 0, y: textField.frame.size.height-2, width: textField.frame.width, height: 1)
        border.backgroundColor = UIColor.white.cgColor
        textField.layer.addSublayer(border)
        textField.textAlignment = .center
    }
    
    private func setupKeyboardEvent() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(_ sender: Notification) {
        guard let keyboardFrame = sender.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        let keyboardHeight = keyboardFrame.cgRectValue.height
        if view.frame.origin.y == 0 {
            view.frame.origin.y -= keyboardHeight
        }
    }
    
    @objc private func keyboardWillHide(_ sender: Notification) {
        if view.frame.origin.y != 0 {
            view.frame.origin.y = 0
        }
    }
}
