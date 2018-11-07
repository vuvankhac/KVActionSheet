# KVActionSheet

## Requirements

* iOS 8.0+
* Swift 3.0 or later

## Installation

KVActionSheet is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'KVActionSheet', '~> 1.4'
```

## Usage
        
```swift
// MARK: - Initial
let actionSheet = KVActionSheet(delegate: self, dataSource: self)
actionSheet.show()
```

```swift
// MARK: - KVActionSheetDelegate
func actionSheetTableView(_ tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath) {
    
}
```

```swift
// MARK: - KVActionSheetDataSource
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
My Facebook: https://www.facebook.com/vuvankhac.official  <br />
My Twitter: https://twitter.com/vuvankhac  <br />

## License

KVActionSheet is available under the MIT license. See the LICENSE file for more info.
