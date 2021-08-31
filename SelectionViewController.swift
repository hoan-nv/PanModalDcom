//
//  SelectionViewController.swift
//  BottomPanModalDemo
//
//  Created by Mirabo on 8/30/21.
//

import Foundation
import UIKit
import PanModal
import SnapKit

protocol SelectionViewControllerDelegate: AnyObject {
    func selected(string: String, type: TypeRegister)
}

class SelectionViewController: UIViewController {
    // MARK: variable
    let heightSelectionCell:CGFloat = 40
    
    let widthButtonCancel: CGFloat = 70
    
    let heightViewSearch: CGFloat = 40
    
    let heightViewTitle: CGFloat = 50
    
    
    let arrString: [String] = ["1","2","3","4","5"]
    
    var type: TypeRegister = .gender
    
    
    weak var delegate: SelectionViewControllerDelegate?
    
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.rowHeight = heightSelectionCell
        table.backgroundColor = .clear
//        table.separatorStyle
        return table
    }()
    
    lazy var stackSearch: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        return stack
    }()
    
    let imgSearch: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(systemName: "magnifyingglass")
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    lazy var tfSearch: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .none
        tf.placeholder = "Seach"
        tf.textAlignment = .right
        tf.textColor = .lightGray
        tf.clearButtonMode = .whileEditing
        return tf
    }()
    
    lazy var btnCancelSearch: UIButton = {
        let btn = UIButton()
        btn.setTitle("Cancel", for: .normal)
        btn.setTitleColor(.systemBlue, for: .normal)
        btn.addTarget(self, action: #selector(tappedCancel), for: .touchUpInside)
        return btn
    }()
    
    lazy var vSearch: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 5
        return view
    }()
    
    lazy var vLineTop: UIView = {
       let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    lazy var vLineBottom: UIView = {
       let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    lazy var vTitle: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var lblTitle: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 20)
        return lbl
    }()
    
    var isShortFormEnabled = true
    
    var hideCancelButton = false {
        didSet {
            if hideCancelButton {
//                self.btnCancelSearch.isHidden = true
                vSearch.snp.updateConstraints { make in
                    make.right.equalToSuperview()
                }
            } else {
//                self.btnCancelSearch.isHidden = false
                vSearch.snp.updateConstraints { make in
                    make.right.equalToSuperview().inset(widthButtonCancel)
                }
            }
        }
    }
    
    // MARK: lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
    // MARK: sp func
    
    func setupView() {
        
        lblTitle.text = "Title"
        btnCancelSearch.setTitle("Cancel", for: .normal)
        
        view.backgroundColor = .lightGray
        
        tfSearch.delegate = self
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(SelectionCell.self, forCellReuseIdentifier: SelectionCell.cellId)
        tableView.isScrollEnabled = false
        
        tableView.tableFooterView = UIView()
        
        view.backgroundColor = .white
        
        //
        view.addSubview(stackSearch)
        //
        stackSearch.addSubview(vSearch)
        stackSearch.addSubview(btnCancelSearch)
        //
        vSearch.addSubview(imgSearch)
        vSearch.addSubview(tfSearch)
        //
        view.addSubview(vTitle)
        vTitle.addSubview(lblTitle)
        //
        view.addSubview(tableView)
        view.addSubview(vLineTop)
        view.addSubview(vLineBottom)
        
        hideCancelButton = true
    }
    
    func setupConstraints() {
        stackSearch.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(40)
        }
        
        btnCancelSearch.snp.makeConstraints { make in
            make.top.bottom.right.equalToSuperview()
            make.width.equalTo(widthButtonCancel)
        }

        vSearch.snp.makeConstraints { make in
            make.top.bottom.left.equalToSuperview()
            make.right.equalTo(btnCancelSearch.snp.left)
        }



        imgSearch.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.left.equalToSuperview().inset(10)
            make.width.equalTo(20)

        }

        tfSearch.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.left.equalTo(imgSearch.snp.right)
            make.right.equalToSuperview().inset(15)
        }
        
        lblTitle.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        vTitle.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.height.equalTo(50)
            make.top.equalTo(vSearch.snp.bottom)
        }
        
        tableView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.height.equalTo(heightSelectionCell * CGFloat(arrString.count))
            make.top.equalTo(vTitle.snp.bottom)
        }
        
        vLineTop.snp.makeConstraints { make in
            make.bottom.equalTo(tableView.snp.top)
            make.height.equalTo(1)
            make.left.right.equalTo(tableView)
        }
        
        vLineBottom.snp.makeConstraints { make in
            make.top.equalTo(tableView.snp.bottom).inset(1)
            make.height.equalTo(1)
            make.left.right.equalTo(tableView)
        }
        
    }
    
    func setupInfor(type: TypeRegister) {
        self.type = type
    }
    
    @objc func tappedCancel() {
        self.hideCancelButton = !self.hideCancelButton
        self.tfSearch.endEditing(true)
        self.tfSearch.text = ""
    }
    
}
// MARK: extension

extension SelectionViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrString.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard  let cell = tableView.dequeueReusableCell(withIdentifier: SelectionCell.cellId, for: indexPath) as? SelectionCell else {
            return UITableViewCell()
        }
        cell.lblLabel.text = arrString[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.reloadData()
        self.delegate?.selected(string: arrString[indexPath.row], type: self.type)
        dismiss(animated: true, completion: nil)
    }
    
}


extension SelectionViewController: PanModalPresentable {
    var panScrollable: UIScrollView? {
        return nil
    }
    
//    var longFormHeight: PanModalHeight {
//        return .maxHeightWithTopInset(0)
//    }
    
    

    var anchorModalToLongForm: Bool {
        return false
    }
    
    var shortFormHeight: PanModalHeight {
        return .contentHeight(heightSelectionCell * CGFloat(arrString.count) + heightViewTitle + heightViewSearch)
    }
}


extension SelectionViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        self.hideCancelButton = true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.hideCancelButton = false
    }
}
