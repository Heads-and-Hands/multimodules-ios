//
//  File.swift
//  
//
//  Created by basalaev on 23.02.2021.
//

import ApiClient
import UIKit
import UIComponents

public class AuthViewController: UIViewController {
    var apiProvider: ApiProvider!

    private let customView = CustomView.make()

    public override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightGray

        let button = Button()
        button.setTitle("Button", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)

        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 60),
        ])

        customView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(customView)

        NSLayoutConstraint.activate([
            customView.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 10),
            customView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            customView.widthAnchor.constraint(equalToConstant: 300),
            customView.heightAnchor.constraint(equalToConstant: 300),
        ])
    }

    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        apiProvider.load { [weak self] in
            self?.customView.text = $0
        }
    }
}
