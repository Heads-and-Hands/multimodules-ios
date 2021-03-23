//
//  File.swift
//  
//
//  Created by basalaev on 23.03.2021.
//

import UIKit

public protocol ProfileDataProvider {
    var title: String { get }
}

class ProfileDataProviderImp: ProfileDataProvider {
    var title: String {
        "СМ Профиль"
    }
}

class ProfileScreen: UIViewController {
    init(dataProvider: ProfileDataProvider) {
        self.dataProvider = dataProvider
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .green

        let label = UILabel()
        label.text = dataProvider.title
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)

        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

    private let dataProvider: ProfileDataProvider
}
