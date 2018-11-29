//
//  ViewController.swift
//  SampleApp
//
//  Created by yuchimur on 2018/11/26.
//  Copyright © 2018 内村　祐之. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var label: UILabel!

    @IBAction func plusButtonAction(_ sender: UIButton) {
//        let number = Int(label.text!)!
//        label.text = String(number + 1)
        label.text = calc(label, sign: +)
    }

    @IBAction func minusButtonAction(_ sender: UIButton) {
//        let number = Int(label.text!)!
//        label.text = String(number - 1)
        label.text = calc(label, sign: -)
    }

    private func calc(_ label: UILabel, sign: (Int, Int) -> Int) -> String {
        return String(sign(Int(label.text!)!, 1))
    }
}

