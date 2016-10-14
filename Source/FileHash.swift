//
//  FileHash.swift
//  SwiftyHash
//
//  Created by 刘栋 on 2016/10/13.
//  Copyright © 2016年 anotheren.com. All rights reserved.
//

import Foundation

/// FileHash Object
public struct FileHash {
    
    private let path: String
    private let context = FileHashContext()
    
    /// initiate by file url
    ///
    /// - parameter url: file url
    ///
    /// - returns: FileHash Object
    public init(url: URL) {
        self.path = url.absoluteString
    }
    
    /// initiate by file path
    ///
    /// - parameter path: file path
    ///
    /// - returns: FileHash Object
    public init(path: String) {
        self.path = path
    }
    
    /// MD2 Message-Digest Algorithm
    public var md2: String? {
        return context.string(.md2, path: path)
    }
    
    /// MD4 Message-Digest Algorithm
    public var md4: String? {
        return context.string(.md4, path: path)
    }
    
    /// MD5 Message-Digest Algorithm
    public var md5: String? {
        return context.string(.md5, path: path)
    }
    
    /// SHA1 Secure Hash Algorithm
    public var sha1: String? {
        return context.string(.sha1, path: path)
    }
    
    /// SHA224 Secure Hash Algorithm
    public var sha224: String? {
        return context.string(.sha224, path: path)
    }
    
    /// SHA256 Secure Hash Algorithm
    public var sha256: String? {
        return context.string(.sha256, path: path)
    }
    
    /// SHA384 Secure Hash Algorithm
    public var sha384: String? {
        return context.string(.sha384, path: path)
    }
    
    /// SHA512 Secure Hash Algorithm
    public var sha512: String? {
        return context.string(.sha512, path: path)
    }
}

extension URL {
    
    /// FileHash Object
    public var sFileHash: FileHash {
        return FileHash(url: self)
    }
}

extension String {
    
    /// FileHash Object
    public var sFileHash: FileHash {
        return FileHash(path: self)
    }
}
