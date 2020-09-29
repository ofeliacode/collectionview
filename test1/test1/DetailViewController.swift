//
//  DetailViewController.swift
//  test1
//
//  Created by Офелия Баширова on 28.09.2020.
//  Copyright © 2020 Офелия Баширова. All rights reserved.
//

import UIKit
import SnapKit
class DetailViewController: UIViewController {
    
    //let detailViewController = DetailViewController()
    var labelName = ""
    var labelPrice = ""
    var labelDescription = ""
    
    
    
    fileprivate lazy var scrollView: UIScrollView = {
        let scrollview = UIScrollView()
        scrollview.frame =  CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        scrollview.backgroundColor = .white
        scrollview.contentSize = CGSize(width: self.view.frame.size.width, height: 400)
        scrollview.isScrollEnabled = true
        return scrollview
    }()
    
    //линия
    let line: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)
        line.translatesAutoresizingMaskIntoConstraints = false
        return line
    }()
    
    //имя
    var labelName2: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = labelName
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    //цена
    var labelPrice2: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = UIColor(red: 0.459, green: 0.459, blue: 0.459, alpha: 1)
        label.text = "price: \(labelPrice)"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    var labelDescription2: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = UIColor(red: 0.459, green: 0.459, blue: 0.459, alpha: 1)
        label.text = "description: \(labelDescription)"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    func mainStackView() -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: [labelName2, labelPrice2, labelDescription2])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 0
        return stackView
    }
    @objc func goBack(sender:UIBarButtonItem){
        self.navigationController?.popToRootViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        self.title = labelName
        // var image = UIImage(named: "arrow")
        //image = image?.withRenderingMode(.alwaysOriginal)
        //let item = UIBarButtonItem(image: image, style:.plain, target: nil, action: nil)
        //navigationController?.navigationItem.backBarButtonItem =  item
        
        
        self.navigationController?.navigationBar.barTintColor = .white
        
        let stackView = mainStackView()
        view.addSubview(stackView)
        view.addSubview(labelName2)
        view.addSubview(labelPrice2)
        view.addSubview(labelDescription2)
        view.snp.makeConstraints { make in
            make.edges.equalTo(self.view)
        }
        stackView.snp.makeConstraints { make in
            make.bottom.equalTo(-623)
            make.left.equalTo(12)
            make.right.equalTo(-12)
            make.height.equalTo(150)
            make.centerX.equalTo(self.view)
        }
    }
    
    
}
