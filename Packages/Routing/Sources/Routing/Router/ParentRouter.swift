//
// topstretching
// Copyright © 2021 Heads and Hands. All rights reserved.
//

import UIKit

public protocol ParentRouter: AnyObject {
    func set(screen: UIViewController, animated: Bool)
}
