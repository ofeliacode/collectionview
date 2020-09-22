//  ViewController.swift
//  test1
//
//  Created by Офелия Баширова on 26.08.2020.
//  Copyright © 2020 Офелия Баширова. All rights reserved.

import UIKit
import SnapKit

class CustomViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
   var collectionView: UICollectionView?
   var dataArray = [Datas]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        //layout.minimumLineSpacing = 2
        layout.itemSize = CGSize(width: view.frame.size.width, height: view.frame.size.height)
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
          flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView?.register(CustomViewCell.self, forCellWithReuseIdentifier: CustomViewCell.identifier)
        collectionView?.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        collectionView?.dataSource = self
        collectionView?.delegate = self
        view.addSubview(collectionView!)
        //data
        let urlString = "https://gorest.co.in/public-api/products"
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
        guard let data = data else {return}
        guard error == nil else {return}
            do {
                let dataProp = try JSONDecoder().decode(Response.self, from: data)
                
                print(dataProp.data[0])
                
                DispatchQueue.main.async {
                    self.collectionView?.reloadData()
                }
                } catch let error {
                  print(error)
                }
          
    }.resume()
}
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView?.frame = view.bounds
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  7
       }
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomViewCell.identifier, for: indexPath) as! CustomViewCell
            //линия
            let line: UIView = {
                 let line = UIView(frame: CGRect(x: 0, y: 48, width:  (view.frame.width) - 17 , height: 1 / UIScreen.main.scale))
                line.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.4)
                 return line
             }()
            //имя
            let labelName: UILabel = {
                let label = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 21))
                label.textAlignment = .left
                label.text = "name"
                return label
            }()
            //цена
            let labelPrice: UILabel = {
                let label = UILabel(frame: CGRect(x: 0, y: 25, width: view.frame.width, height: 21))
                label.textAlignment = .left
                label.textColor = UIColor(red: 0.459, green: 0.459, blue: 0.459, alpha: 1)
                label.text = "price"
                return label
            }()
            cell.addSubview(labelName)
            cell.addSubview(labelPrice)
            cell.addSubview(line)
            return cell
       }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width) - 17, height: 99)
    }

}

