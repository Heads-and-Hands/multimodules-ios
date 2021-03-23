//
//  File.swift
//  
//
//  Created by basalaev on 23.03.2021.
//

import UIKit

class MainScreen: UIViewController {
    var openProfile: (() -> Void)?
    var openAfisha: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        let profileButton = UIButton()
        profileButton.backgroundColor = .blue
        profileButton.translatesAutoresizingMaskIntoConstraints = false
        profileButton.addTarget(self, action: #selector(pressProfile), for: .touchUpInside)
        profileButton.setTitle("Профиль", for: .normal)
        view.addSubview(profileButton)

        let afishaButton = UIButton()
        afishaButton.backgroundColor = .red
        afishaButton.translatesAutoresizingMaskIntoConstraints = false
        afishaButton.addTarget(self, action: #selector(pressProfile), for: .touchUpInside)
        afishaButton.setTitle("Афиша", for: .normal)
        view.addSubview(afishaButton)

        NSLayoutConstraint.activate([
            profileButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -80),
            afishaButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            afishaButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 80),
        ])
    }

    @objc
    func pressProfile() {
        openProfile?()
    }

    @objc
    func pressAfisha() {
        openAfisha?()
    }
}
