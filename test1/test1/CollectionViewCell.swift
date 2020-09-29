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
        line.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    //имя
    var labelName: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "name:"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    //цена
    var labelPrice: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = UIColor(red: 0.459, green: 0.459, blue: 0.459, alpha: 1)
        label.text = "price:"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    var labelDescription: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = UIColor(red: 0.459, green: 0.459, blue: 0.459, alpha: 1)
        label.text = "description:"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        setup()
    }
    func setup(){
        contentView.addSubview(labelName)
        labelName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 3).isActive = true
        labelName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        labelName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        //labelName.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true

        contentView.addSubview(labelPrice)
        
        labelPrice.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 7).isActive = true
        labelPrice.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        labelPrice.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        //labelPrice.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true

        contentView.addSubview(labelDescription)
        labelDescription.topAnchor.constraint(equalTo: labelPrice.bottomAnchor, constant: 11).isActive = true
        labelDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        labelDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        labelDescription.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: labelDescription.bottomAnchor, constant: 20).isActive = true
        
        contentView.addSubview(line)
        //line.topAnchor.constraint(equalTo: labelPrice.bottomAnchor, constant: 11).isActive = true
        line.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        line.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        line.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        line.heightAnchor.constraint(equalToConstant: 1).isActive = true
        line.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
    
    lazy var width: NSLayoutConstraint = {
        let width = contentView.widthAnchor.constraint(equalToConstant: bounds.size.width)
        width.isActive = true
        return width
    }()
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        width.constant = bounds.size.width
        return contentView.systemLayoutSizeFitting(CGSize(width: targetSize.width, height: 10))
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

