//
//  CollectionViewCell.swift
//  test1
//
//  Created by Офелия Баширова on 20.09.2020.
//  Copyright © 2020 Офелия Баширова. All rights reserved.
//

import UIKit

class CustomViewCell: UICollectionViewCell {
    static let identifier = "customCellIdentifier"
    //линия
    let line: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.4)
        return line
    }()
    //имя
    var labelName: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "name:"
        return label
    }()
    //цена
    var labelPrice: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = UIColor(red: 0.459, green: 0.459, blue: 0.459, alpha: 1)
        label.text = "price:"
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        line.frame = CGRect(x: 0, y: 48, width:  (self.frame.width) - 17 , height: 1 / UIScreen.main.scale)
        labelName.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: 21)
        labelPrice.frame = CGRect(x: 0, y: 25, width: self.frame.width, height: 21)
        
        addSubview(labelName)
        addSubview(labelPrice)
        addSubview(line)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

