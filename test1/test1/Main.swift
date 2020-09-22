//
//  Main.swift
//  test1
//
//  Created by Офелия Баширова on 09.09.2020.
//  Copyright © 2020 Офелия Баширова. All rights reserved.
//

import UIKit

class Main: UIViewController {

    @IBOutlet weak var btn: UIButton!
    @IBAction func clickBtn(_ sender: UIButton) {
        let page = CustomViewController()
        page.modalPresentationStyle = .fullScreen
        present(page, animated: true, completion: nil)
    }
}
