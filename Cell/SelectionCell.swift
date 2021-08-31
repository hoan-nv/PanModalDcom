//
//  SelectionCell.swift
//  BottomPanModalDemo
//
//  Created by Mirabo on 8/30/21.
//

import Foundation
import UIKit
import SnapKit

class SelectionCell: UITableViewCell {
    // MARK: variable
    static let cellId = "SelectionCell"
    
    let lblLabel: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .left
        return lbl
    } ()
    
    //MARK: init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: setup func
    
    
    func setupUI() {
        contentView.backgroundColor = .clear
        contentView.addSubview(lblLabel)
        setupContraints()
    }
    
    func setupContraints() {
        lblLabel.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(30)
            $0.centerY.equalToSuperview()
        }
    }
}
