//
//  XCTestManifests.swift
//  XpenseModel
//
//  Created by Paul Schmiedmayer on 10/10/19.
//  Copyright © 2019 TUM LS1. All rights reserved.
//

// MARK: Imports
import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(XpenseModelTests.allTests),
    ]
}
#endif
