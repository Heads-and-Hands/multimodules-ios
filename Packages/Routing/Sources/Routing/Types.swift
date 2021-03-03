//
// topstretching
// Copyright © 2021 Heads and Hands. All rights reserved.
//

import Foundation

public typealias VoidClosure = () -> Void

public typealias VoidThrowsClosure = () throws -> Void
public typealias ThrowsClosure<T> = (T) throws -> Void
public typealias ThrowsClosure2<A, B> = (A, B) throws -> Void
public typealias ThrowsClosure3<A, B, C> = (A, B, C) throws -> Void

public typealias Closure<T> = (T) -> Void
public typealias Closure2<A, B> = (A, B) -> Void
public typealias Closure3<A, B, C> = (A, B, C) -> Void

// MARK: - Types

enum Types {}
