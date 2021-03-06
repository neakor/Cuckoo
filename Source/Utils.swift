//
//  Utils.swift
//  Cuckoo
//
//  Created by Tadeas Kriz on 13/01/16.
//  Copyright © 2016 Brightify. All rights reserved.
//

internal func getterName(_ property: String) -> String {
    return property + "#get"
}

internal func setterName(_ property: String) -> String {
    return property + "#set"
}

public func wrap<M: Matchable, IN>(matchable: M, mapping: @escaping (IN) -> M.MatchedType) -> ParameterMatcher<IN> {
    return ParameterMatcher {
        return matchable.matcher.matches(mapping($0))
    }
}

public typealias SourceLocation = (file: StaticString, line: UInt)

public func escapingStub<IN, OUT>(for closure: (IN) -> OUT) -> (IN) -> OUT {
    return { _ in
        fatalError("This is a stub! It's not supposed to be called!")
    }
}

public func escapingStub<IN, OUT>(for closure: (IN) throws -> OUT) -> (IN) throws -> OUT {
    return { _ in
        fatalError("This is a stub! It's not supposed to be called!")
    }
}
