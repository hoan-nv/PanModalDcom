//
//  ViewController.swift
//  BottomPanModalDemo
//
//  Created by Mirabo on 8/30/21.
//

import Foundation
import UIKit
import SnapKit

enum TypeRegister {
    case nationality
    case gender
    case occupation
    case notificationMethod
    case provider
    case language
}


class ViewController: UIViewController {
    
    // MARK: variable
    
    let tagNation: Int = 1
    let tagGender: Int = 2
    let tagOccupation: Int = 3
    let tagNotificationMethod: Int = 4
    let tagProvider: Int = 5
    let tagLanguage: Int = 6
    
    let heightBtn = 40
    
    lazy var lblNation: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    lazy var btnNation: UIButton = {
        let btn = UIButton()
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .gray
        btn.setTitle("Nation", for: .normal)
        btn.tag = tagNation
        btn.addTarget(self, action: #selector(tapToGender(_:)), for: .touchUpInside)
        return btn
    }()
    
    lazy var lblGender: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    lazy var btnGender: UIButton = {
        let btn = UIButton()
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .gray
        btn.setTitle("Gender", for: .normal)
        btn.tag = tagGender
        btn.addTarget(self, action: #selector(tapToGender(_:)), for: .touchUpInside)
        return btn
    }()
    
    lazy var lblOccupation: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    lazy var btnOccupation: UIButton = {
        let btn = UIButton()
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .gray
        btn.setTitle("Occupation", for: .normal)
        btn.tag = tagOccupation
        btn.addTarget(self, action: #selector(tapToGender(_:)), for: .touchUpInside)
        return btn
    }()
    
    
    lazy var lblNotificationMethod: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    lazy var btnNotificationMethod: UIButton = {
        let btn = UIButton()
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .gray
        btn.setTitle("Noti", for: .normal)
        btn.tag = tagNotificationMethod
        btn.addTarget(self, action: #selector(tapToGender(_:)), for: .touchUpInside)
        return btn
    }()
    
    lazy var lblProvider: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    lazy var btnProvider: UIButton = {
        let btn = UIButton()
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .gray
        btn.setTitle("Provider", for: .normal)
        btn.tag = tagProvider
        btn.addTarget(self, action: #selector(tapToGender(_:)), for: .touchUpInside)
        return btn
    }()
    
    lazy var lblLanguage: UILabel = {
        let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    lazy var btnLanguage: UIButton = {
        let btn = UIButton()
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .gray
        btn.setTitle("Language", for: .normal)
        btn.tag = tagLanguage
        btn.addTarget(self, action: #selector(tapToGender(_:)), for: .touchUpInside)
        return btn
    }()
    
    // MARK: lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupContraints()
    }
    
    
    // MARK: sp func
    func setupView() {
        view.backgroundColor = .white
        
        lblNation.text = "Nation"
        lblGender.text = "Gender"
        lblProvider.text = "Provicer"
        lblOccupation.text = "Occupation"
        lblLanguage.text = "Language"
        lblNotificationMethod.text = "NotiMethod"
        
        view.addSubview(lblNation)
        view.addSubview(btnNation)
        view.addSubview(lblGender)
        view.addSubview(btnGender)
        view.addSubview(lblLanguage)
        view.addSubview(btnLanguage)
        view.addSubview(lblProvider)
        view.addSubview(btnProvider)
        view.addSubview(lblOccupation)
        view.addSubview(btnOccupation)
        view.addSubview(lblNotificationMethod)
        view.addSubview(btnNotificationMethod)
    }
    
    func setupContraints() {
        lblNation.snp.makeConstraints {
            $0.left.top.right.equalToSuperview().inset(30)
        }
        btnNation.snp.makeConstraints {
            $0.top.equalTo(lblNation.snp.bottom)
            $0.left.right.equalTo(lblNation)
            $0.height.equalTo(heightBtn)
        }
        
        lblGender.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(30)
            $0.top.equalTo(btnNation.snp.bottom)
        }
        btnGender.snp.makeConstraints {
            $0.top.equalTo(lblGender.snp.bottom)
            $0.left.right.equalTo(lblGender)
            $0.height.equalTo(heightBtn)
        }
        
        lblOccupation.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(30)
            $0.top.equalTo(btnGender.snp.bottom)
        }
        
        btnOccupation.snp.makeConstraints {
            $0.top.equalTo(lblOccupation.snp.bottom)
            $0.left.right.equalTo(lblOccupation)
            $0.height.equalTo(heightBtn)
        }

        lblNotificationMethod.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(30)
            $0.top.equalTo(btnOccupation.snp.bottom)
        }
        btnNotificationMethod.snp.makeConstraints {
            $0.top.equalTo(lblNotificationMethod.snp.bottom)
            $0.left.right.equalTo(lblNotificationMethod)
            $0.height.equalTo(heightBtn)
        }

        lblProvider.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(30)
            $0.top.equalTo(btnNotificationMethod.snp.bottom)
        }
        btnProvider.snp.makeConstraints {
            $0.top.equalTo(lblProvider.snp.bottom)
            $0.left.right.equalTo(lblProvider)
            $0.height.equalTo(heightBtn)
        }

        lblLanguage.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(30)
            $0.top.equalTo(btnProvider.snp.bottom)
        }
        btnLanguage.snp.makeConstraints {
            $0.top.equalTo(lblLanguage.snp.bottom)
            $0.left.right.equalTo(lblLanguage)
            $0.height.equalTo(heightBtn)
        }
        
       
    }
    
    @objc func tapToGender(_ button: UIButton) {
        let vc = SelectionViewController()
        switch button.tag {
        case tagGender:
            vc.setupInfor(type: .gender)
        case tagLanguage:
            vc.setupInfor(type: .language)
        case tagNation:
            vc.setupInfor(type: .nationality)
        case tagNotificationMethod:
            vc.setupInfor(type: .notificationMethod)
        case tagProvider:
            vc.setupInfor(type: .provider)
        case tagOccupation:
            vc.setupInfor(type: .occupation)
        default:
            return
        }
        vc.delegate = self
        presentPanModal(vc)
    }
    
}

extension ViewController: SelectionViewControllerDelegate {
    func selected(string: String, type: TypeRegister) {
        switch type {
        case .gender:
            lblGender.text = string
        case .nationality:
            lblNation.text = string
        case .language:
            lblLanguage.text = string
        case .notificationMethod:
            lblNotificationMethod.text = string
        case .occupation:
            lblOccupation.text = string
        case .provider:
            lblProvider.text = string
        }
    }
    
    
}
