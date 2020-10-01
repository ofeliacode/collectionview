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

    // MARK: Nested types

    private enum Style {
        static let contentInsets = UIEdgeInsets(top: 12, left: 16, bottom: 0, right: 16)
        static let spacingBetweenNameAndDescription: CGFloat = 0
        static let spacingBetweenNameAndPrice: CGFloat = 4
        static let spacingBetweenDescriptionAndSeparator: CGFloat = 4
        static let separatorHeight: CGFloat = 1

        static let priceFont = UIFont.systemFont(ofSize: 16, weight: .bold)
        static let nameFont = UIFont.systemFont(ofSize: 16, weight: .regular)
        static let descriptionFont = UIFont.systemFont(ofSize: 16, weight: .regular)
    }

    // MARK: Subviews
    
    //линия
    private let separatorView: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)
        return line
    }()
    
    //имя
    private lazy var nameLabel: UILabel = Self.makeNameLabel()
    //цена
    private lazy var priceLabel: UILabel = Self.makePriceLabel()
    private lazy var descriptionLabel: UILabel = Self.makeDescriptionLabel()

    // MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)

        setupSubviews()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Setup

    private func setupSubviews() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(separatorView)
    }

    // MARK: Public

    func setup(name: String, price: String, description: String) {
        nameLabel.text = name
        priceLabel.text = price
        descriptionLabel.text = description
    }

    // MARK: Lifecycle

    override func layoutSubviews() {
        super.layoutSubviews()

        priceLabel.sizeToFit()
        priceLabel.frame.origin = CGPoint(x: bounds.width - priceLabel.frame.width, y: Style.contentInsets.top)

        let nameLabelSize = nameLabel.sizeThatFits(CGSize(width: bounds.width - priceLabel.frame.width, height: .greatestFiniteMagnitude))
        nameLabel.frame.size = nameLabelSize
        nameLabel.frame.origin = CGPoint(x: 0, y: Style.contentInsets.top)

        let descriptionLabelSize = descriptionLabel.sizeThatFits(CGSize(width: bounds.width, height: .greatestFiniteMagnitude))
        descriptionLabel.frame.size = descriptionLabelSize
        descriptionLabel.frame.origin = CGPoint(
            x: 0,
            y: max(nameLabel.frame.maxY, priceLabel.frame.maxY)
        )

        separatorView.frame = CGRect(x: 0, y: bounds.height - Style.separatorHeight, width: bounds.width, height: Style.separatorHeight)
    }

    // MARK: Subview factories

    static func makeNameLabel() -> UILabel {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "name:"
        label.font = Style.nameFont
        label.numberOfLines = 0
        return label
    }

    static func makePriceLabel() -> UILabel {
        let label = UILabel()
        label.textAlignment = .left
        label.font = Style.priceFont
        // TODO: move to Style
        label.textColor = UIColor(red: 0.459, green: 0.459, blue: 0.459, alpha: 1)
        label.text = "price:"
        return label
    }

    static func makeDescriptionLabel() -> UILabel {
        let label = UILabel()
        label.textAlignment = .left
        label.font = Style.descriptionFont
        // TODO: move to Style
        label.textColor = UIColor(red: 0.459, green: 0.459, blue: 0.459, alpha: 1)
        label.text = "description:"
        label.numberOfLines = 0
        return label
    }

    // MARK: Layout calculation

    static func calculateSize(fittingSize: CGSize, name: String, price: String, description: String) -> CGSize {
        let nameLabel = makeNameLabel()
        let priceLabel = makePriceLabel()
        let descriptionLabel = makeDescriptionLabel()

        let width = fittingSize.width - Style.contentInsets.left - Style.contentInsets.right

        nameLabel.text = name
        priceLabel.text = price
        descriptionLabel.text = description

        let priceSize = priceLabel.sizeThatFits(CGSize(width: width, height: fittingSize.height))
        let nameSize = nameLabel.sizeThatFits(CGSize(width: width - priceSize.width, height: fittingSize.height))
        let descriptionSize = descriptionLabel.sizeThatFits(CGSize(width: width, height: fittingSize.height))

        let height = Style.contentInsets.top
            + max(priceSize.height, nameSize.height)
            + descriptionSize.height
            + Style.spacingBetweenDescriptionAndSeparator
            + Style.separatorHeight

        return CGSize(
            width: width,
            height: height
        )
    }
}

