//
//  DetailViewController.swift
//  test1
//
//  Created by Офелия Баширова on 28.09.2020.
//  Copyright © 2020 Офелия Баширова. All rights reserved.
//

import UIKit
//import SnapKit
class DetailViewController: UIViewController {
    
    var labelName = ""
    var labelPrice = ""
    var labelDescription = ""
    //var data: dataArray?
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
        label.numberOfLines = 0
        return label
    }()
    //цена
    var labelPrice2: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = UIColor(red: 0.459, green: 0.459, blue: 0.459, alpha: 1)
        label.numberOfLines = 0
        return label
    }()
    var labelDescription2: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = UIColor(red: 0.459, green: 0.459, blue: 0.459, alpha: 1)
        label.numberOfLines = 0
        return label
    }()
    func mainStackView() -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: [labelName2, labelPrice2, labelDescription2])
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
       stackView.spacing = 0
        return stackView
    }
    @objc func goBack(sender:UIBarButtonItem){
        self.navigationController?.popToRootViewController(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        let stackView = mainStackView()
        
        stackView.frame = view.frame
        view.addSubview(stackView)
        self.title = labelName
       labelName2.text = "name: \(labelName)"
        labelPrice2.text = "Price: \(labelPrice)"
        labelDescription2.text = "Description: \(labelDescription)"
        // var image = UIImage(named: "arrow")
        //image = image?.withRenderingMode(.alwaysOriginal)
        //let item = UIBarButtonItem(image: image, style:.plain, target: nil, action: nil)
        //navigationController?.navigationItem.backBarButtonItem =  item
        
        self.navigationController?.navigationBar.barTintColor = .white
         stackView.translatesAutoresizingMaskIntoConstraints = false
     labelName2.translatesAutoresizingMaskIntoConstraints = false
     labelPrice2.translatesAutoresizingMaskIntoConstraints = false
     labelDescription2.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true

        stackView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -70).isActive = true
        stackView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant:16).isActive = true
        stackView.rightAnchor.constraint(equalTo: self.view.rightAnchor,constant:-16).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: view.frame.height/2 ).isActive = true
       
        view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        view.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant:0).isActive = true
        view.rightAnchor.constraint(equalTo: self.view.rightAnchor,constant:0).isActive = true
        view.heightAnchor.constraint(equalToConstant: view.frame.height/2).isActive = true
        
    }
 
}
