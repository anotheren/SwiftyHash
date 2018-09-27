# SwiftyHash

SwiftyHash is a Swifty wrapper for CommonCrypto to easy use.

## Requirements

* iOS 8.0+
* Xcode 10
* Swift 4.2

NOTE: For Swift 3.1+ support use version 0.7.

## Support

* Data in memory & File in disk
* md5
* sha1
* sha2(sha224, sha256, sha384, sha512)

## Examples

### For data in memory

```swift
let words: String = "A Swifty wrapper for CommonCrypto"
let sha256: String = words.digest.sha256
```

### For file in disk
```swift
guard let path = Bundle.main.path(forResource: "Github", ofType: "png") else {
    fatalError("Fail to find the image 'Github.png'")
}
let md5: String? = path.fileDigest.md5
```

## Installation

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate SwiftyHash into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "anotheren/SwiftyHash" ~> 1.0
```

## License

SwiftyHash is released under the MIT license. See LICENSE for details.
