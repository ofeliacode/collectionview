//  ViewController.swift
//  test1
//
//  Created by Офелия Баширова on 26.08.2020.
//  Copyright © 2020 Офелия Баширова. All rights reserved.

import UIKit

class CustomViewController: UIViewController {
    // MARK: Subviews

    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 15.0, left: 0.0, bottom: 0.0, right: 0.0)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CustomViewCell.self, forCellWithReuseIdentifier: CustomViewCell.identifier)
        collectionView.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        return collectionView
    }()

    // MARK: Private properties

    private var dataArray = [Datas]()

    // MARK: UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Products"

        setupSubviews()
        fetchProducts()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }

    // MARK: Private

    private func setupSubviews() {
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
    }

    private func fetchProducts() {
        let urlString = "https://gorest.co.in/public-api/products"
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let self = self else { return }
            guard let data = data else {return}
            guard error == nil else {return}
            do {
                let dataProp = try JSONDecoder().decode(Response.self, from: data)
                self.dataArray = dataProp.data
                print(dataProp.data[0])
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            } catch let error {
                print(error)
            }
        }.resume()
    }
}

// MARK: UICollectionViewDataSource & UICollectionViewDelegateFlowLayout

extension CustomViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomViewCell.identifier, for: indexPath) as! CustomViewCell
        cell.labelName.text = "name: \(dataArray[indexPath.item].name)"
        cell.labelPrice.text = "price: \(dataArray[indexPath.item].price)"
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (view.frame.width)-17, height: 50)
    }
}
