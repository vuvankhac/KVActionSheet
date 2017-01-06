//
//  KVActionSheet.swift
//  KVActionSheet
//
//  Created by Vu Van Khac on 1/5/17.
//  Copyright © 2017 TVO. All rights reserved.
//

import UIKit

public protocol KVActionSheetDataSource {
    func actionSheetTableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    func actionSheetTableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell
    func actionSheetTableView(_ tableView: UITableView, heightForRowAtIndexPath indexPath: IndexPath) -> CGFloat
    func actionSheetHeightOfContentView() -> CGFloat
}

public protocol KVActionSheetDelegate {
    func actionSheetTableView(_ tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath)
}

public class KVActionSheet: UIView {
    
    fileprivate weak var delegate: AnyObject?
    fileprivate weak var dataSource: AnyObject?
    
    lazy var rootView: UIView = {
        if let view = UIApplication.shared.windows.first {
            return view
        }
        return UIView()
    }()
    
    public lazy var tableView: UITableView = {
        let tableView = UITableView()
        self.contentView.addSubview(tableView)
        
        tableView.bounces = false
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        
        return tableView
    }()
    
    fileprivate lazy var contentView: UIView = {
        let contentView = UIView()
        self.addSubview(contentView)
        
        return contentView
    }()
    
    fileprivate lazy var heightOfContentView: CGFloat = {
        let heightOfContentView = (self.dataSource as? KVActionSheetDataSource)?.actionSheetHeightOfContentView()
        return heightOfContentView ?? 0
    }()
    
    fileprivate lazy var tapToHide: UITapGestureRecognizer = {
        let tapToHide = UITapGestureRecognizer(target: self, action: #selector(KVActionSheet.dismiss))
        tapToHide.delegate = self
        return tapToHide
    }()
    
    public init(delegate: AnyObject?, dataSource: AnyObject?) {
        super.init(frame: UIScreen.main.bounds)
        
        self.delegate = delegate
        self.dataSource = dataSource
        
        self.addGestureRecognizer(self.tapToHide)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension KVActionSheet: UIGestureRecognizerDelegate {
    
    // MARK: - UIGestureRecognizerDelegate
    open func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        let touchPoint = touch.location(in: self.tableView)
        return !(self.tableView.hitTest(touchPoint, with: nil) != nil)
    }
}

extension KVActionSheet {
    
    // MARK: - Layout Subviews
    open override func layoutSubviews() {
        self.frame = UIScreen.main.bounds
        
        self.contentView.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height - self.heightOfContentView, width: UIScreen.main.bounds.size.width, height: self.heightOfContentView)
        self.tableView.frame = self.contentView.bounds
    }
}

extension KVActionSheet: UITableViewDataSource {
    
    // MARK: - UITableViewDataSource
    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let dataSource = self.dataSource as? KVActionSheetDataSource else {
            return 0
        }
        
        return dataSource.actionSheetTableView(tableView, numberOfRowsInSection: section)
    }
    
    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let dataSource = self.dataSource as? KVActionSheetDataSource else {
            return UITableViewCell()
        }
        
        return dataSource.actionSheetTableView(tableView, cellForRowAtIndexPath: indexPath)
    }
    
    open func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let dataSource = self.dataSource as? KVActionSheetDataSource else {
            return 0
        }
        
        return dataSource.actionSheetTableView(tableView, heightForRowAtIndexPath: indexPath)
    }
    
}

extension KVActionSheet: UITableViewDelegate {
    
    // MARK: - UITableViewDelegate
    open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let delegate = self.delegate as? KVActionSheetDelegate else {
            return
        }
        
        self.dismiss()
        delegate.actionSheetTableView(tableView, didSelectRowAtIndexPath: indexPath)
    }
    
}

extension KVActionSheet {
    
    // MARK: - Public methods
    open func show() {
        self.rootView.addSubview(self)
        self.backgroundColor = UIColor(white: 0, alpha: 0)
        UIView.animate(withDuration: 0.3, delay: 0, options: UIViewAnimationOptions(), animations: {
            self.backgroundColor = UIColor(white: 0, alpha: 0.5)
            self.contentView.transform = CGAffineTransform(translationX: 0, y: -self.heightOfContentView)
        }, completion: { (finished: Bool) in
            
        })
    }
    
    open func dismiss() {
        UIView.animate(withDuration: 0.3, animations: {
            self.backgroundColor = UIColor(white: 0, alpha: 0)
            self.contentView.frame = CGRect(x: 0, y: UIScreen.main.bounds.size.height, width: UIScreen.main.bounds.size.width, height: self.heightOfContentView)
        }, completion: { (finished: Bool) in
            self.removeFromSuperview()
        })
    }
    
}
