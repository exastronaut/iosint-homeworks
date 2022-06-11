//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Артем Свиридов on 17.03.2022.
//
import UIKit
import SnapKit

class ProfileHeaderView: UIView {

    //MARK: - Properties

    private var statusText: String?

    let avatarImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "avatar")
        image.clipsToBounds = true
        image.layer.cornerRadius = 50
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.white.cgColor
        image.isUserInteractionEnabled = true
        return image
    }()

    private let fullNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.text = "Zhong Xina"
        label.textColor = .black
        return label
    }()

    private let statusLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.text = "Waiting for something..."
        label.textColor = .gray
        return label
    }()

    private lazy var statusTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        textField.clearButtonMode = .whileEditing
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.ident(size: 10)
        textField.delegate = self
        textField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        return textField
    }()

    private lazy var statusButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()

    let backView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .black
        view.alpha = 0
        return view
    }()

    let closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.alpha = 0
        return button
    }()

    //MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)

        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    
    @objc func buttonPressed() {
        guard let text = statusTextField.text, !text.isEmpty else {
            statusLabel.text = "Waiting for something..."
            return
        }
        statusLabel.text = statusText
        statusTextField.text = ""
    }

    @objc func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text
    }

    private func layout() {
        [avatarImageView, statusButton, fullNameLabel, statusLabel, statusTextField, backView, closeButton].forEach { addSubview($0) }

        backView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.height.equalTo(Constants.heightScreen)
        }

        closeButton.snp.makeConstraints { make in
            make.top.equalTo(backView.snp.top).offset(LayoutConstants.offset8)
            make.trailing.equalTo(backView.snp.trailing).offset(-LayoutConstants.offset8)
        }

        avatarImageView.snp.makeConstraints { make in
            make.width.height.equalTo(LayoutConstants.height100)
            make.leading.top.equalToSuperview().offset(LayoutConstants.offset16)
        }

        fullNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(LayoutConstants.offset16)
            make.leading.equalToSuperview().offset(LayoutConstants.offset138)
            make.trailing.equalToSuperview().offset(-LayoutConstants.offset16)
        }

        statusLabel.snp.makeConstraints { make in
            make.top.equalTo(fullNameLabel.snp.bottom).offset(LayoutConstants.offset16)
            make.leading.trailing.equalTo(fullNameLabel)
        }

        statusTextField.snp.makeConstraints { make in
            make.height.equalTo(LayoutConstants.height40)
            make.leading.trailing.equalTo(statusLabel)
            make.top.equalTo(statusLabel.snp.bottom).offset(LayoutConstants.offset8)
        }

        statusButton.snp.makeConstraints { make in
            make.top.equalTo(statusTextField.snp.bottom).offset(LayoutConstants.offset16)
            make.trailing.leading.equalToSuperview().inset(LayoutConstants.inset16)
            make.height.equalTo(LayoutConstants.height50)
        }
    }

}

//MARK: - UITextFieldDelegate

extension ProfileHeaderView: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEditing(true)
    }

}

//MARK: - Constants

extension ProfileHeaderView {

    enum Constants {
        static let heightScreen: CGFloat = UIScreen.main.bounds.height
    }

}
