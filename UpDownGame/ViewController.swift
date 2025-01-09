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
    @IBOutlet var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBackButton()
        imageView.image = UIImage(named: "emotion1")
        startButton.configureButtonUI(.black, for: .normal)
        configureTextField()
        setupKeyboardEvent()
    }

    @IBAction func startButtonTapped(_ sender: UIButton) {
        guard let number = textField.text else { return }
        guard let num = Int(number) else {
            displayAlert("숫자를 입력해 주세요")
            return
        }
        guard checkNumber(num) else { return }
        let vc = storyboard?.instantiateViewController(withIdentifier: UpDownViewController.identifier) as? UpDownViewController
        guard let vc else { return }
        vc.maxNumber = Int(number)
        view.endEditing(true)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func tapGestureTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    private func configureBackButton() {
        let backButton = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        backButton.tintColor = .black
        navigationItem.backBarButtonItem = backButton
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        textField.text = ""
        let num = Int.random(in: 1...5)
        imageView.image = UIImage(named: "emotion\(num)")
    }
    
}


// MARK: TextField
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
}
