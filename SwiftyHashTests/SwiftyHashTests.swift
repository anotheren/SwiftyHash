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
        let result = "A Swifty wrapper for CommonCrypto".digest.md5
        let expect = "6a0b4b4a2aba9abf25888a2709a9be35"
        XCTAssert(result == expect, "Fail to pass Hash.String.md5 Test, result = \(result), but expect \(expect)")
    }

    func testFilePathHashMD5() {
        let result = prepareTestPath().fileDigest.md5
        let expect = "f20f4adb92446d62197d300dc1a7d22e"
        XCTAssert(result == expect, "Fail to pass FileHash.Path.md5 Test, result = \(String(describing: result)), but expect \(expect)")
    }
    
    // MARK: sha1 test
    
    func testHashDataSHA1() {
        let result = prepareTestData().digest.sha1
        let expect = "7e6087e1c2475a12882b4ff5b51600ecdca9db1f"
        XCTAssert(result == expect, "Fail to pass Hash.Data.sha1 Test, result = \(result), but expect \(expect)")
    }
    
    func testHashStringSHA1() {
        let result = "A Swifty wrapper for CommonCrypto".digest.sha1
        let expect = "b4b842908da2d98d1aeeab9bd57be9b0c94ad6d1"
        XCTAssert(result == expect, "Fail to pass Hash.String.sha1 Test, result = \(result), but expect \(expect)")
    }
    
    func testFilePathHashSHA1() {
        let result = prepareTestPath().fileDigest.sha1
        let expect = "7e6087e1c2475a12882b4ff5b51600ecdca9db1f"
        XCTAssert(result == expect, "Fail to pass FileHash.Path.sha1 Test, result = \(String(describing: result)), but expect \(expect)")
    }
    
    // MARK: sha224 test
    
    func testHashDataSHA224() {
        let result = prepareTestData().digest.sha224
        let expect = "45025f33de02376cfe37072910256ce4c04b2bb625dd694182aa7acf"
        XCTAssert(result == expect, "Fail to pass Hash.Data.sha224 Test, result = \(result), but expect \(expect)")
    }
    
    func testHashStringSHA224() {
        let result = "A Swifty wrapper for CommonCrypto".digest.sha224
        let expect = "60d596cb5fddb2cd971302427cf704fab086bf2bda91f399a43621d0"
        XCTAssert(result == expect, "Fail to pass Hash.String.sha224 Test, result = \(result), but expect \(expect)")
    }
    
    func testFilePathHashSHA224() {
        let result = prepareTestPath().fileDigest.sha224
        let expect = "45025f33de02376cfe37072910256ce4c04b2bb625dd694182aa7acf"
        XCTAssert(result == expect, "Fail to pass FileHash.Path.sha224 Test, result = \(String(describing: result)), but expect \(expect)")
    }
    
    // MARK: sha256 test
    
    func testHashDataSHA256() {
        let result = prepareTestData().digest.sha256
        let expect = "95fb0d4c3478795a8763721bf48af1c90f7568a81642e6a0786532649bc5d235"
        XCTAssert(result == expect, "Fail to pass Hash.Data.sha256 Test, result = \(result), but expect \(expect)")
    }
    
    func testHashStringSHA256() {
        let result = "A Swifty wrapper for CommonCrypto".digest.sha256
        let expect = "0a319692d439882a6eaab2c2fcffbbf2d27194146b13d9c477e530034592352d"
        XCTAssert(result == expect, "Fail to pass Hash.String.sha256 Test, result = \(result), but expect \(expect)")
    }
    
    func testFilePathHashSHA256() {
        let result = prepareTestPath().fileDigest.sha256
        let expect = "95fb0d4c3478795a8763721bf48af1c90f7568a81642e6a0786532649bc5d235"
        XCTAssert(result == expect, "Fail to pass FileHash.Path.sha256 Test, result = \(String(describing: result)), but expect \(expect)")
    }
    
    // MARK: sha384 test
    
    func testHashDataSHA384() {
        let result = prepareTestData().digest.sha384
        let expect = "22a254281ebada4a371b78b1d9c51298dce9d501f4bdb192b14692c98530497223f728fb0b96c4d63648ad7361b801ba"
        XCTAssert(result == expect, "Fail to pass Hash.Data.sha384 Test, result = \(result), but expect \(expect)")
    }
    
    func testHashStringSHA384() {
        let result = "A Swifty wrapper for CommonCrypto".digest.sha384
        let expect = "a3fcfc988882426f111d91769eec4625e30462550b28e7ad3f50d754003857e8a0dfb5e99e65aefa976837000eb0003c"
        XCTAssert(result == expect, "Fail to pass Hash.String.sha384 Test, result = \(result), but expect \(expect)")
    }
    
    func testFilePathHashSHA384() {
        let result = prepareTestPath().fileDigest.sha384
        let expect = "22a254281ebada4a371b78b1d9c51298dce9d501f4bdb192b14692c98530497223f728fb0b96c4d63648ad7361b801ba"
        XCTAssert(result == expect, "Fail to pass FileHash.Path.sha384 Test, result = \(String(describing: result)), but expect \(expect)")
    }
    
    // MARK: sha512 test
    
    func testHashDataSHA512() {
        let result = prepareTestData().digest.sha512
        let expect = "f7acaa3454bddcd90d4c4c2bc377d0a3ab73e5ff33bf6bc7d0f23d1b2062c5a0e409e819d2a87df146a1ea92cd636bb149d0bf61ace97e53cbd77a41b373948a"
        XCTAssert(result == expect, "Fail to pass Hash.Data.sha512 Test, result = \(result), but expect \(expect)")
    }
    
    func testHashStringSHA512() {
        let result = "A Swifty wrapper for CommonCrypto".digest.sha512
        let expect = "0fe48b141643328d8827a0c2d30f858f5649d6a4f2514e4b6271f104ea097ab2be1ac6753120de19eda1f479f99778047d79d6863e7ac089709dfd5594f01db0"
        XCTAssert(result == expect, "Fail to pass Hash.String.sha512 Test, result = \(result), but expect \(expect)")
    }
    
    func testFilePathHashSHA512() {
        let result = prepareTestPath().fileDigest.sha512
        let expect = "f7acaa3454bddcd90d4c4c2bc377d0a3ab73e5ff33bf6bc7d0f23d1b2062c5a0e409e819d2a87df146a1ea92cd636bb149d0bf61ace97e53cbd77a41b373948a"
        XCTAssert(result == expect, "Fail to pass FileHash.Path.sha512 Test, result = \(String(describing: result)), but expect \(expect)")
    }
}
