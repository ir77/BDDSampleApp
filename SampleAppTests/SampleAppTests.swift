//
//  SampleAppTests.swift
//  SampleAppTests
//
//  Created by yuchimur on 2018/11/26.
//  Copyright © 2018 内村　祐之. All rights reserved.
//

import XCTest
@testable import SampleApp

class SampleAppTests: XCTestCase {

    var viewController: ViewController!

    override func setUp() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        viewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController
    }

    func test_画面が表示されたら_プラスボタンが表示される() {
        let button = viewController.plusButton

        XCTAssertEqual(button?.titleLabel?.text, "＋")
    }

    func test_画面が表示されたら_マイナスボタンが表示される() {
        let button = viewController.minusButton

        XCTAssertEqual(button?.titleLabel?.text, "−")
    }

    func test_画面が表示されたら_ラベルに0が表示される() {
        let label = viewController.label

        XCTAssertEqual(label?.text, "0")
    }

    func test_プラスボタンがタップされるごとに_ラベルの数字が1つずつ増えていく() {
        let button = viewController.plusButton
        let label = viewController.label

        XCTAssertEqual(label?.text, "0")

        (1...3).forEach { index in
            button?.sendActions(for: .touchUpInside)

            XCTAssertEqual(label?.text, "\(index)")
        }
    }

    func test_マイナスボタンがタップされるごとに_ラベルの数字が1つずつ減っていく() {
        let button = viewController.minusButton
        let label = viewController.label

        XCTAssertEqual(label?.text, "0")

        (1...3).forEach { index in
            button?.sendActions(for: .touchUpInside)

            XCTAssertEqual(label?.text, "\(index * -1)")
        }
    }
}

extension ViewController {
    var plusButton: UIButton? {
        return view
            .subviews
            .filter({ $0.accessibilityIdentifier == "plusButton" })
            .compactMap({ $0 as? UIButton })
            .first
    }

    var minusButton: UIButton? {
        return view
            .subviews
            .filter({ $0.accessibilityIdentifier == "minusButton" })
            .compactMap({ $0 as? UIButton })
            .first
    }

    var label: UILabel? {
        return view
            .subviews
            .filter({ $0.accessibilityIdentifier == "label" })
            .compactMap({ $0 as? UILabel })
            .first
    }
}
