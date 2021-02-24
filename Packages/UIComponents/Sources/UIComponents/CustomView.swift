//
//  File.swift
//  
//
//  Created by basalaev on 23.02.2021.
//

import UIKit

public class CustomView: UIView {
    public static func make() -> Self {
        let nib = UINib(nibName: String(describing: self), bundle: .module)

        guard let view = nib.instantiate(withOwner: nil, options: nil).first as? Self else {
          fatalError("The nib \(nib) expected its root view to be of type \(self)")
        }
        return view
    }
}
