//
//  MessageCallViewController.swift
//  MessageView
//
//  Created by 김기현 on 2023/02/28.
//

import UIKit

class MessageCallViewController: UIViewController {

    fileprivate let button: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.setTitle("편집", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        let vc1 = UINavigationController(rootViewController: MessageCallViewController())
        let nav1 = UINavigationController(rootViewController: vc1)
        nav1.tabBarItem.image = UIImage(systemName: "square.and.pencil")


//        setViewControllers([nav1], animated: true)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.title = "메시지"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    
}


