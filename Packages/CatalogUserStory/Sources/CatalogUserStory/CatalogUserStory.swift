import UIKit

struct CatalogUserStory {
    var text = "Hello, World!"
}

public class CatalogViewController: UIViewController {
    public init?(coder: NSCoder, email: String) {
        print(email)
        super.init(coder: coder)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
