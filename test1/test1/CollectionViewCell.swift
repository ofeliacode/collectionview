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
    var labelDescription: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = UIColor(red: 0.459, green: 0.459, blue: 0.459, alpha: 1)
        label.text = "description:"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        //addSubview(line)
        setup()
    }
    func setup(){
        
        labelName.translatesAutoresizingMaskIntoConstraints = false
        labelPrice.translatesAutoresizingMaskIntoConstraints = false
        labelDescription.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(labelName)
        
        labelName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 3).isActive = true
        labelName.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        labelName.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        contentView.addSubview(labelPrice)
        
        labelPrice.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 7).isActive = true
        labelPrice.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        labelPrice.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        contentView.addSubview(labelDescription)
        
        labelDescription.topAnchor.constraint(equalTo: labelPrice.bottomAnchor, constant: 11).isActive = true
        labelDescription.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        labelDescription.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        if let lastSubview = contentView.subviews.last {
            contentView.bottomAnchor.constraint(equalTo: lastSubview.bottomAnchor, constant: 10).isActive = true
        }
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

