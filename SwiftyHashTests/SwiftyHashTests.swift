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
    
    private func prepareTestPath() -> String {
        guard let path = Bundle(for: SwiftyHashTests.self).path(forResource: "Github", ofType: "png") else {
            fatalError("Fail to find the image 'Github.png'")
        }
        return path
    }
    
    private func prepareTestData() -> Data {
        guard let data = FileManager.default.contents(atPath: prepareTestPath()) else {
            fatalError("Fail to load the image 'Github.png'")
        }
        return data
    }
    
    // MARK: Conversion test
    
    func testHexString() {
        let example: Array<UInt8> = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
        let result = HashType.md5.string(example)
        let expect = "000102030405060708090a0b0c0d0e0f"
        XCTAssert(result == expect)
    }
    
    // MARK: md5 test
    
    func testHashDataMD5() {
        let result = prepareTestData().digest.md5
        let expect = "f20f4adb92446d62197d300dc1a7d22e"
        XCTAssert(result == expect, "Fail to pass Hash.Data.md5 Test, result = \(result), but expect \(expect)")
    }
    
    func testHashStringMD5() {
        let result = "The quick brown fox jumps over the lazy dog".digest.md5
        let expect = "9e107d9d372bb6826bd81d3542a419d6"
        XCTAssert(result == expect, "Fail to pass Hash.String.md5 Test, result = \(result), but expect \(expect)")
    }

    func testFilePathHashMD5() {
        let result = prepareTestPath().fileDigest.md5
        let expect = "f20f4adb92446d62197d300dc1a7d22e"
        XCTAssert(result == expect, "Fail to pass FileHash.Path.md5 Test, result = \(result), but expect \(expect)")
    }
    
    // MARK: sha1 test
    
    func testHashDataSHA1() {
        let result = prepareTestData().digest.sha1
        let expect = "7e6087e1c2475a12882b4ff5b51600ecdca9db1f"
        XCTAssert(result == expect, "Fail to pass Hash.Data.sha1 Test, result = \(result), but expect \(expect)")
    }
    
    func testHashStringSHA1() {
        let result = "The quick brown fox jumps over the lazy dog".digest.sha1
        let expect = "2fd4e1c67a2d28fced849ee1bb76e7391b93eb12"
        XCTAssert(result == expect, "Fail to pass Hash.String.sha1 Test, result = \(result), but expect \(expect)")
    }
    
    func testFilePathHashSHA1() {
        let result = prepareTestPath().fileDigest.sha1
        let expect = "7e6087e1c2475a12882b4ff5b51600ecdca9db1f"
        XCTAssert(result == expect, "Fail to pass FileHash.Path.sha1 Test, result = \(result), but expect \(expect)")
    }
    
    // MARK: sha224 test
    
    func testHashDataSHA224() {
        let result = prepareTestData().digest.sha224
        let expect = "45025f33de02376cfe37072910256ce4c04b2bb625dd694182aa7acf"
        XCTAssert(result == expect, "Fail to pass Hash.Data.sha224 Test, result = \(result), but expect \(expect)")
    }
    
    func testHashStringSHA224() {
        let result = "The quick brown fox jumps over the lazy dog".digest.sha224
        let expect = "730e109bd7a8a32b1cb9d9a09aa2325d2430587ddbc0c38bad911525"
        XCTAssert(result == expect, "Fail to pass Hash.String.sha224 Test, result = \(result), but expect \(expect)")
    }
    
    func testFilePathHashSHA224() {
        let result = prepareTestPath().fileDigest.sha224
        let expect = "45025f33de02376cfe37072910256ce4c04b2bb625dd694182aa7acf"
        XCTAssert(result == expect, "Fail to pass FileHash.Path.sha224 Test, result = \(result), but expect \(expect)")
    }
    
    // MARK: sha256 test
    
    func testHashDataSHA256() {
        let result = prepareTestData().digest.sha256
        let expect = "95fb0d4c3478795a8763721bf48af1c90f7568a81642e6a0786532649bc5d235"
        XCTAssert(result == expect, "Fail to pass Hash.Data.sha256 Test, result = \(result), but expect \(expect)")
    }
    
    func testHashStringSHA256() {
        let result = "The quick brown fox jumps over the lazy dog".digest.sha256
        let expect = "d7a8fbb307d7809469ca9abcb0082e4f8d5651e46d3cdb762d02d0bf37c9e592"
        XCTAssert(result == expect, "Fail to pass Hash.String.sha256 Test, result = \(result), but expect \(expect)")
    }
    
    func testFilePathHashSHA256() {
        let result = prepareTestPath().fileDigest.sha256
        let expect = "95fb0d4c3478795a8763721bf48af1c90f7568a81642e6a0786532649bc5d235"
        XCTAssert(result == expect, "Fail to pass FileHash.Path.sha256 Test, result = \(result), but expect \(expect)")
    }
    
    // MARK: sha384 test
    
    func testHashDataSHA384() {
        let result = prepareTestData().digest.sha384
        let expect = "22a254281ebada4a371b78b1d9c51298dce9d501f4bdb192b14692c98530497223f728fb0b96c4d63648ad7361b801ba"
        XCTAssert(result == expect, "Fail to pass Hash.Data.sha384 Test, result = \(result), but expect \(expect)")
    }
    
    func testHashStringSHA384() {
        let result = "The quick brown fox jumps over the lazy dog".digest.sha384
        let expect = "ca737f1014a48f4c0b6dd43cb177b0afd9e5169367544c494011e3317dbf9a509cb1e5dc1e85a941bbee3d7f2afbc9b1"
        XCTAssert(result == expect, "Fail to pass Hash.String.sha384 Test, result = \(result), but expect \(expect)")
    }
    
    func testFilePathHashSHA384() {
        let result = prepareTestPath().fileDigest.sha384
        let expect = "22a254281ebada4a371b78b1d9c51298dce9d501f4bdb192b14692c98530497223f728fb0b96c4d63648ad7361b801ba"
        XCTAssert(result == expect, "Fail to pass FileHash.Path.sha384 Test, result = \(result), but expect \(expect)")
    }
    
    // MARK: sha512 test
    
    func testHashDataSHA512() {
        let result = prepareTestData().digest.sha512
        let expect = "f7acaa3454bddcd90d4c4c2bc377d0a3ab73e5ff33bf6bc7d0f23d1b2062c5a0e409e819d2a87df146a1ea92cd636bb149d0bf61ace97e53cbd77a41b373948a"
        XCTAssert(result == expect, "Fail to pass Hash.Data.sha512 Test, result = \(result), but expect \(expect)")
    }
    
    func testHashStringSHA512() {
        let result = "The quick brown fox jumps over the lazy dog".digest.sha512
        let expect = "07e547d9586f6a73f73fbac0435ed76951218fb7d0c8d788a309d785436bbb642e93a252a954f23912547d1e8a3b5ed6e1bfd7097821233fa0538f3db854fee6"
        XCTAssert(result == expect, "Fail to pass Hash.String.sha512 Test, result = \(result), but expect \(expect)")
    }
    
    func testFilePathHashSHA512() {
        let result = prepareTestPath().fileDigest.sha512
        let expect = "f7acaa3454bddcd90d4c4c2bc377d0a3ab73e5ff33bf6bc7d0f23d1b2062c5a0e409e819d2a87df146a1ea92cd636bb149d0bf61ace97e53cbd77a41b373948a"
        XCTAssert(result == expect, "Fail to pass FileHash.Path.sha512 Test, result = \(result), but expect \(expect)")
    }
}
