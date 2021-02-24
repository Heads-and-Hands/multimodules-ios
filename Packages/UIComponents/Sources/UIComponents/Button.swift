//
//  File.swift
//  
//
//  Created by basalaev on 23.02.2021.
//

import UIKit
import CommonAssets

public class Button: UIButton {
    public override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = Colors.base
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
