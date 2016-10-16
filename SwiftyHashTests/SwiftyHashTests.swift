//
//  SwiftyHashTests.swift
//  SwiftyHashTests
//
//  Created by 刘栋 on 2016/10/14.
//  Copyright © 2016年 anotheren.com. All rights reserved.
//

import XCTest
import Foundation
@testable import SwiftyHash

class SwiftyHashTests: XCTestCase {
    
    // MARK: Helps
    
    private func prepateTestPath() -> String {
        guard let path = Bundle(for: SwiftyHashTests.self).path(forResource: "Github", ofType: "png") else {
            fatalError("Fail to find the image 'Github.png'")
        }
        return path
    }
    
    private func prepateTestData() -> Data {
        guard let data = FileManager.default.contents(atPath: prepateTestPath()) else {
            fatalError("Fail to load the image 'Github.png'")
        }
        return data
    }
    
    // MARK: Conversion test
    
    func testHexString() {
        let example: Array<UInt8> = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
        let result = HashType.md5.string(example)
        let expect = "000102030405060708090a0b0c0d0e0f"
        XCTAssert(result == expect)
    }
    
    // MARK: md5 test
    
    func testHashDataMD5() {
        let result = prepateTestData().digest.md5
        let expect = "f20f4adb92446d62197d300dc1a7d22e"
        XCTAssert(result == expect, "Fail to pass Hash.Data.md5 Test, result = \(result), but expect \(expect)")
    }
    
    func testHashStringMD5() {
        let result = "The quick brown fox jumps over the lazy dog".digest.md5
        let expect = "9e107d9d372bb6826bd81d3542a419d6"
        XCTAssert(result == expect, "Fail to pass Hash.String.md5 Test, result = \(result), but expect \(expect)")
    }

    func testFilePathHashMD5() {
        let result = prepateTestPath().fileDigest.md5
        let expect = "f20f4adb92446d62197d300dc1a7d22e"
        XCTAssert(result == expect, "Fail to pass FileHash.Path.md5 Test, result = \(result), but expect \(expect)")
    }
}
