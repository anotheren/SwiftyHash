//
//  HashType.swift
//  SwiftyHash
//
//  Created by 刘栋 on 2016/7/11.
//  Copyright © 2016年 anotheren.com. All rights reserved.
//

import Foundation
import CommonCrypto

/// Hash 算法类别
internal enum HashType {
    
    case md2
    case md4
    case md5
    case sha1
    case sha224
    case sha256
    case sha384
    case sha512
    
    /// digest length in byte
    internal var digestLength: Int {
        switch self {
        case .md2:      return Int(CC_MD2_DIGEST_LENGTH)
        case .md4:      return Int(CC_MD4_DIGEST_LENGTH)
        case .md5:      return Int(CC_MD5_DIGEST_LENGTH)
        case .sha1:     return Int(CC_SHA1_DIGEST_LENGTH)
        case .sha224:   return Int(CC_SHA224_DIGEST_LENGTH)
        case .sha256:   return Int(CC_SHA256_DIGEST_LENGTH)
        case .sha384:   return Int(CC_SHA384_DIGEST_LENGTH)
        case .sha512:   return Int(CC_SHA512_DIGEST_LENGTH)
        }
    }
}

extension HashType {
    
    /**
     计算 Hash
     
     - Note:    Hash
     - parameter data: 需要求 Hash 的文件
     - returns: Hash 结果
     */
    internal func array(_ data: inout Data) -> [UInt8] {
        var hash = [UInt8](repeating: 0, count: digestLength)
        switch self {
        case .md2:
            CC_MD2(&data, CC_LONG(data.count), &hash)
        case .md4:
            CC_MD4(&data, CC_LONG(data.count), &hash)
        case .md5:
            CC_MD5(&data, CC_LONG(data.count), &hash)
        case .sha1:
            CC_SHA1(&data, CC_LONG(data.count), &hash)
        case .sha224:
            CC_SHA224(&data, CC_LONG(data.count), &hash)
        case .sha256:
            CC_SHA256(&data, CC_LONG(data.count), &hash)
        case .sha384:
            CC_SHA384(&data, CC_LONG(data.count), &hash)
        case .sha512:
            CC_SHA512(&data, CC_LONG(data.count), &hash)
        }
        return hash
    }
    
    /**
     生成 Hash 字符串
     
     - Note: 常见的 Hash 十六进制字符串表示, 与 Array<UInt8> 的对象可相互转化
     - parameter hashArray: 待编码的 hashArray
     - returns: Hash 字符串
     */
    internal func string(_ hashArray: [UInt8]) -> String {
        var string = ""
        for i in 0..<digestLength {
            string += String(format: "%02x", hashArray[i])
        }
        return string
    }
    
    /**
     生成 hash 字符串
     
     - Note: 常见的 hash 十六进制字符串表示, 与 Array<UInt8> 的对象可相互转化
     - parameter hashData: 待编码的 hashData
     - returns: hash 字符串
     */
    internal func string(_ hashData: inout Data) -> String {
        return string(array(&hashData))
    }
}
