//
//  FileHashCotext.swift
//  SwiftyHash
//
//  Created by 刘栋 on 2016/7/28.
//  Copyright © 2016年 anotheren.com. All rights reserved.
//

import Foundation
import CommonCrypto

internal struct FileHashContext {
    
    /// 每次读取的数据长度 4096 字节
    private let sizeForReadingData: Int = 4096
    
    /// 计算文件 Hash
    ///
    /// - parameter type:     Hash 算法类别
    /// - parameter filePath: 文件路径
    ///
    /// - returns: Hash 字符串
    internal func string(_ type: HashType, path filePath: String) -> String? {
        guard let array: Array<UInt8> = array(type, path: filePath) else { return nil }
        return type.string(array)
    }
    
    /// 计算文件 Hash
    ///
    /// - parameter type:     Hash 算法类别
    /// - parameter filePath: 文件路径
    ///
    /// - returns: Hash
    internal func array(_ type: HashType, path filePath: String) -> Array<UInt8>? {
        guard
            FileManager.default.fileExists(atPath: filePath),
            let fileURL = CFURLCreateWithFileSystemPath(kCFAllocatorDefault, filePath as CFString, .cfurlposixPathStyle, false),
            let readStream = CFReadStreamCreateWithFile(kCFAllocatorDefault, fileURL),
            CFReadStreamOpen(readStream)
            else {
                return nil
        }
        
        var digest = Array<UInt8>(repeating: 0, count: type.digestLength)
        let didSuccess: Bool
        switch type {
        case .md2:
            didSuccess = hashOfFileMD2(pointer: &digest, stream: readStream)
        case .md4:
            didSuccess = hashOfFileMD4(pointer: &digest, stream: readStream)
        case .md5:
            didSuccess = hashOfFileMD5(pointer: &digest, stream: readStream)
        case .sha1:
            didSuccess = hashOfFileSHA1(pointer: &digest, stream: readStream)
        case .sha224:
            didSuccess = hashOfFileSHA224(pointer: &digest, stream: readStream)
        case .sha256:
            didSuccess = hashOfFileSHA256(pointer: &digest, stream: readStream)
        case .sha384:
            didSuccess = hashOfFileSHA384(pointer: &digest, stream: readStream)
        case .sha512:
            didSuccess = hashOfFileSHA512(pointer: &digest, stream: readStream)
        }
        CFReadStreamClose(readStream)
        
        return didSuccess ? digest : nil
    }
    
    /// 计算文件的 md2
    ///
    /// - parameter digestPointer: Hash 指针
    /// - parameter readStream:    读取的文件流
    ///
    /// - returns: 计算是否成功
    private func hashOfFileMD2(pointer digestPointer: UnsafeMutablePointer<UInt8>, stream readStream: CFReadStream) -> Bool {
        var hashObject = CC_MD2_CTX()
        CC_MD2_Init(&hashObject)
        var hasMoreData = true
        while hasMoreData {
            var buffer = Array<UInt8>(repeating: 0, count: sizeForReadingData)
            let readBytesCount = CFReadStreamRead(readStream, &buffer, sizeForReadingData)
            if readBytesCount == -1 {
                break
            } else if readBytesCount == 0 {
                hasMoreData = false
            } else {
                CC_MD2_Update(&hashObject, &buffer, CC_LONG(readBytesCount))
            }
        }
        if hasMoreData { return false }
        CC_MD2_Final(digestPointer, &hashObject)
        return true
    }
    
    /// 计算文件的 md4
    ///
    /// - parameter digestPointer: Hash 指针
    /// - parameter readStream:    读取的文件流
    ///
    /// - returns: 计算是否成功
    private func hashOfFileMD4(pointer digestPointer: UnsafeMutablePointer<UInt8>, stream readStream: CFReadStream) -> Bool {
        var hashObject = CC_MD4_CTX()
        CC_MD4_Init(&hashObject)
        var hasMoreData = true
        while hasMoreData {
            var buffer = Array<UInt8>(repeating: 0, count: sizeForReadingData)
            let readBytesCount = CFReadStreamRead(readStream, &buffer, sizeForReadingData)
            if readBytesCount == -1 {
                break
            } else if readBytesCount == 0 {
                hasMoreData = false
            } else {
                CC_MD4_Update(&hashObject, &buffer, CC_LONG(readBytesCount))
            }
        }
        if hasMoreData { return false }
        CC_MD4_Final(digestPointer, &hashObject)
        return true
    }
    
    /// 计算文件的 md5
    ///
    /// - parameter digestPointer: Hash 指针
    /// - parameter readStream:    读取的文件流
    ///
    /// - returns: 计算是否成功
    private func hashOfFileMD5(pointer digestPointer: UnsafeMutablePointer<UInt8>, stream readStream: CFReadStream) -> Bool {
        var hashObject = CC_MD5_CTX()
        CC_MD5_Init(&hashObject)
        var hasMoreData = true
        while hasMoreData {
            var buffer = Array<UInt8>(repeating: 0, count: sizeForReadingData)
            let readBytesCount = CFReadStreamRead(readStream, &buffer, sizeForReadingData)
            if readBytesCount == -1 {
                break
            } else if readBytesCount == 0 {
                hasMoreData = false
            } else {
                CC_MD5_Update(&hashObject, &buffer, CC_LONG(readBytesCount))
            }
        }
        if hasMoreData { return false }
        CC_MD5_Final(digestPointer, &hashObject)
        return true
    }
    
    /// 计算文件的 sha1
    ///
    /// - parameter digestPointer: Hash 指针
    /// - parameter readStream:    读取的文件流
    ///
    /// - returns: 计算是否成功
    private func hashOfFileSHA1(pointer digestPointer: UnsafeMutablePointer<UInt8>, stream readStream: CFReadStream) -> Bool {
        var hashObject = CC_SHA1_CTX()
        CC_SHA1_Init(&hashObject)
        var hasMoreData = true
        while hasMoreData {
            var buffer = Array<UInt8>(repeating: 0, count: sizeForReadingData)
            let readBytesCount = CFReadStreamRead(readStream, &buffer, sizeForReadingData)
            if readBytesCount == -1 {
                break
            } else if readBytesCount == 0 {
                hasMoreData = false
            } else {
                CC_SHA1_Update(&hashObject, &buffer, CC_LONG(readBytesCount))
            }
        }
        if hasMoreData { return false }
        CC_SHA1_Final(digestPointer, &hashObject)
        return true
    }
    
    /// 计算文件的 sha224
    ///
    /// - parameter digestPointer: Hash 指针
    /// - parameter readStream:    读取的文件流
    ///
    /// - returns: 计算是否成功
    private func hashOfFileSHA224(pointer digestPointer: UnsafeMutablePointer<UInt8>, stream readStream: CFReadStream) -> Bool {
        var hashObject = CC_SHA256_CTX() // same context struct is used for SHA224 and SHA256
        CC_SHA224_Init(&hashObject)
        var hasMoreData = true
        while hasMoreData {
            var buffer = Array<UInt8>(repeating: 0, count: sizeForReadingData)
            let readBytesCount = CFReadStreamRead(readStream, &buffer, sizeForReadingData)
            if readBytesCount == -1 {
                break
            } else if readBytesCount == 0 {
                hasMoreData = false
            } else {
                CC_SHA224_Update(&hashObject, &buffer, CC_LONG(readBytesCount))
            }
        }
        if hasMoreData { return false }
        CC_SHA224_Final(digestPointer, &hashObject)
        return true
    }
    
    /// 计算文件的 sha256
    ///
    /// - parameter digestPointer: Hash 指针
    /// - parameter readStream:    读取的文件流
    ///
    /// - returns: 计算是否成功
    private func hashOfFileSHA256(pointer digestPointer: UnsafeMutablePointer<UInt8>, stream readStream: CFReadStream) -> Bool {
        var hashObject = CC_SHA256_CTX()
        CC_SHA256_Init(&hashObject)
        var hasMoreData = true
        while hasMoreData {
            var buffer = Array<UInt8>(repeating: 0, count: sizeForReadingData)
            let readBytesCount = CFReadStreamRead(readStream, &buffer, sizeForReadingData)
            if readBytesCount == -1 {
                break
            } else if readBytesCount == 0 {
                hasMoreData = false
            } else {
                CC_SHA256_Update(&hashObject, &buffer, CC_LONG(readBytesCount))
            }
        }
        if hasMoreData { return false }
        CC_SHA256_Final(digestPointer, &hashObject)
        return true
    }
    
    /// 计算文件的 sha384
    ///
    /// - parameter digestPointer: Hash 指针
    /// - parameter readStream:    读取的文件流
    ///
    /// - returns: 计算是否成功
    private func hashOfFileSHA384(pointer digestPointer: UnsafeMutablePointer<UInt8>, stream readStream: CFReadStream) -> Bool {
        var hashObject = CC_SHA512_CTX() // same context struct is used for SHA384 and SHA512
        CC_SHA384_Init(&hashObject)
        var hasMoreData = true
        while hasMoreData {
            var buffer = Array<UInt8>(repeating: 0, count: sizeForReadingData)
            let readBytesCount = CFReadStreamRead(readStream, &buffer, sizeForReadingData)
            if readBytesCount == -1 {
                break
            } else if readBytesCount == 0 {
                hasMoreData = false
            } else {
                CC_SHA384_Update(&hashObject, &buffer, CC_LONG(readBytesCount))
            }
        }
        if hasMoreData { return false }
        CC_SHA384_Final(digestPointer, &hashObject)
        return true
    }
    
    /// 计算文件的 sha512
    ///
    /// - parameter digestPointer: Hash 指针
    /// - parameter readStream:    读取的文件流
    ///
    /// - returns: 计算是否成功
    private func hashOfFileSHA512(pointer digestPointer: UnsafeMutablePointer<UInt8>, stream readStream: CFReadStream) -> Bool {
        var hashObject = CC_SHA512_CTX()
        CC_SHA512_Init(&hashObject)
        var hasMoreData = true
        while hasMoreData {
            var buffer = Array<UInt8>(repeating: 0, count: sizeForReadingData)
            let readBytesCount = CFReadStreamRead(readStream, &buffer, sizeForReadingData)
            if readBytesCount == -1 {
                break
            } else if readBytesCount == 0 {
                hasMoreData = false
            } else {
                CC_SHA512_Update(&hashObject, &buffer, CC_LONG(readBytesCount))
            }
        }
        if hasMoreData { return false }
        CC_SHA512_Final(digestPointer, &hashObject)
        return true
    }
}
