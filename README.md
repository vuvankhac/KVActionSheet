# KVActionSheet

[![CI Status](http://img.shields.io/travis/Vu Van Khac/KVActionSheet.svg?style=flat)](https://travis-ci.org/Vu Van Khac/KVActionSheet)
[![Version](https://img.shields.io/cocoapods/v/KVActionSheet.svg?style=flat)](http://cocoapods.org/pods/KVActionSheet)
[![License](https://img.shields.io/cocoapods/l/KVActionSheet.svg?style=flat)](http://cocoapods.org/pods/KVActionSheet)
[![Platform](https://img.shields.io/cocoapods/p/KVActionSheet.svg?style=flat)](http://cocoapods.org/pods/KVActionSheet)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

* iOS 8.0+
* Swift 3.0

## Installation

KVActionSheet is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'KVActionSheet', '~> 1.1'
```

## Usage
```swift
// MARK: - JLActionSheetDelegate
func actionSheetTableView(_ tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath) {
    
}
```

```swift
// MARK: - JLActionSheetDataSource
func actionSheetTableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 4
}
    
func actionSheetTableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
    return UITableViewCell()
}
    
func actionSheetTableView(_ tableView: UITableView, heightForRowAtIndexPath indexPath: IndexPath) -> CGFloat {
    return 50
}
    
func actionSheetHeightOfContentView() -> CGFloat {
    return 200
}
```

## Author

Vu Van Khac, khacvv0451@gmail.com <br />
My Facebook: https://www.facebook.com/khacvv0451  <br />
My Twitter: https://twitter.com/vuvankhac  <br />

## License

KVActionSheet is available under the MIT license. See the LICENSE file for more info.
