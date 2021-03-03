//
//  File.swift
//  
//
//  Created by basalaev on 23.02.2021.
//

import CatalogUserStory
import UIKit
import UIComponents

public class AuthViewController: UIViewController {
    public override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightGray

        let button = Button()
        button.setTitle("Button", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(showCatalog), for: .touchUpInside)
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

    @objc
    private func showCatalog() {
        performSegue(withIdentifier: "catalog", sender: self)
        return
    }

    @IBSegueAction
    func catalog(_ coder: NSCoder) -> UIViewController? {
        CatalogViewController(coder: coder, email: "aa@aa.aa")
    }
}
