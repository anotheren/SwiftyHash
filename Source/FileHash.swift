//
//  FileHash.swift
//  SwiftyHash
//
//  Created by 刘栋 on 2016/10/13.
//  Copyright © 2016年 anotheren.com. All rights reserved.
//

import Foundation

/// 计算文件 Hash
public struct FileHash {
    
    private let path: String
    private let context = FileHashContext()
    
    public init(url: URL) {
        self.path = url.absoluteString
    }
    
    public init(path: String) {
        self.path = path
    }
    
    /// MD2 消息摘要算法
    public var md2: String? {
        return context.string(.md2, path: path)
    }
    
    /// MD4 消息摘要算法
    public var md4: String? {
        return context.string(.md4, path: path)
    }
    
    /// MD5 消息摘要算法
    public var md5: String? {
        return context.string(.md5, path: path)
    }
    
    /// SHA1 安全散列算法
    public var sha1: String? {
        return context.string(.sha1, path: path)
    }
    
    /// SHA224 安全散列算法
    public var sha224: String? {
        return context.string(.sha224, path: path)
    }
    
    /// SHA256 安全散列算法
    public var sha256: String? {
        return context.string(.sha256, path: path)
    }
    
    /// SHA384 安全散列算法
    public var sha384: String? {
        return context.string(.sha384, path: path)
    }
    
    /// SHA512 安全散列算法
    public var sha512: String? {
        return context.string(.sha512, path: path)
    }
}

extension URL {
    
    /// 文件对象 Hash
    public var fileHash: FileHash {
        return FileHash(url: self)
    }
}

extension String {
    
    /// 文件对象 Hash
    public var fileHash: FileHash {
        return FileHash(path: self)
    }
}
