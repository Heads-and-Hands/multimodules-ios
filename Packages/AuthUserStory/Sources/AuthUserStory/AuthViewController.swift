//
//  File.swift
//  
//
//  Created by basalaev on 23.02.2021.
//

import UIKit
import UIComponents
import ApiClient

public class AuthViewController: UIViewController {

    public var apiClient: ApiClient?

    public override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightGray

        let button = Button()
        button.setTitle("Button api", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(apiButtonTap), for: .touchUpInside)
        view.addSubview(button)

        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 60),
        ])

        let customView = CustomView.make()
        customView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(customView)

        NSLayoutConstraint.activate([
            customView.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 10),
            customView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            customView.widthAnchor.constraint(equalToConstant: 300),
            customView.heightAnchor.constraint(equalToConstant: 300),
        ])
    }

    // MARK: - Actions

    @objc
    private func apiButtonTap() {
        apiClient?.authDevice(id: UIDevice.current.identifierForVendor?.uuidString ?? "") { result in
            switch result {
            case let .success(model):
                print("Model: \(model)")
            case let .failure(error):
                print("Error: \(error)")
            }
        }
    }
}
