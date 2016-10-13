//
//  Hash.swift
//  SwiftyHash
//
//  Created by 刘栋 on 2016/10/13.
//  Copyright © 2016年 anotheren.com. All rights reserved.
//

import Foundation

/// 计算 Hash
public class Hash {
    
    private var data: Data
    
    public init(data: Data) {
        self.data = data
    }
    
    /// MD2 消息摘要算法
    public var md2: String {
        return HashType.md2.string(&data)
    }
    
    /// MD4 消息摘要算法
    public var md4: String {
        return HashType.md4.string(&data)
    }
    
    /// MD5 消息摘要算法
    public var md5: String {
        return HashType.md5.string(&data)
    }
    
    /// SHA1 安全散列算法
    public var sha1: String {
        return HashType.sha1.string(&data)
    }
    
    /// SHA224 安全散列算法
    public var sha224: String {
        return HashType.sha224.string(&data)
    }
    
    /// SHA256 安全散列算法
    public var sha256: String {
        return HashType.sha256.string(&data)
    }
    
    /// SHA384 安全散列算法
    public var sha384: String {
        return HashType.sha384.string(&data)
    }
    
    /// SHA512 安全散列算法
    public var sha512: String {
        return HashType.sha512.string(&data)
    }
}

extension Data {
    
    /// 内存对象 Hash
    public var hash: Hash {
        return Hash(data: self)
    }
}

extension String {
    
    /// 内存对象 Hash, 如非 UTF8 字符请先转换
    public var hash: Hash {
        let hashData = data(using: String.Encoding.utf8) ?? Data()
        return Hash(data: hashData)
    }
}
