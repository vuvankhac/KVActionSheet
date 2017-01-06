//
//  ViewController.swift
//  KVActionSheet
//
//  Created by Vu Van Khac on 01/06/2017.
//  Copyright (c) 2017 Vu Van Khac. All rights reserved.
//

import UIKit
import KVActionSheet

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController {
    
    // MARK: - Actions
    
    @IBAction func clickMeAction(_ sender: AnyObject) {
        let actionSheet = KVActionSheet(delegate: self, dataSource: self)
        actionSheet.tableView.register(UINib(nibName: KVActionSheetTableViewCell.nibName, bundle: nil), forCellReuseIdentifier: KVActionSheetTableViewCell.cellID)
        actionSheet.show()
    }
    
}

extension ViewController: KVActionSheetDelegate {
    
    // MARK: - JLActionSheetDelegate
    func actionSheetTableView(_ tableView: UITableView, didSelectRowAtIndexPath indexPath: IndexPath) {
        
    }
}

extension ViewController: KVActionSheetDataSource {
    
    // MARK: - JLActionSheetDataSource
    func actionSheetTableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func actionSheetTableView(_ tableView: UITableView, cellForRowAtIndexPath indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: KVActionSheetTableViewCell.cellID)
        
        if let actionSheetCell = cell as? KVActionSheetTableViewCell {
            actionSheetCell.textLabel?.text = "\(indexPath.row)"
            return actionSheetCell
        }
        
        return UITableViewCell()
    }
    
    func actionSheetTableView(_ tableView: UITableView, heightForRowAtIndexPath indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func actionSheetHeightOfContentView() -> CGFloat {
        return 200
    }
    
}

