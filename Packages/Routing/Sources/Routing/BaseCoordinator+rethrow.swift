//
// topstretching
// Copyright © 2021 Heads and Hands. All rights reserved.
//

import Coordinator
import Foundation

public extension BaseCoordinator {
    func rethrow(closure: @escaping () throws -> Void) -> VoidClosure {
        {
            do {
                try closure()
            } catch {
            }
        }
    }

    func rethrow<T>(closure: @escaping ThrowsClosure<T>) -> Closure<T> {
        { inputValue in
            do {
                try closure(inputValue)
            } catch {
            }
        }
    }

    func rethrow<T, U>(closure: @escaping ThrowsClosure2<T, U>) -> Closure2<T, U> {
        { fstValue, scdValue in
            do {
                try closure(fstValue, scdValue)
            } catch {
            }
        }
    }

    func rethrow<T, U, V>(closure: @escaping ThrowsClosure3<T, U, V>) -> Closure3<T, U, V> {
        { fstValue, scdValue, thdValue in
            do {
                try closure(fstValue, scdValue, thdValue)
            } catch {
            }
        }
    }
}
