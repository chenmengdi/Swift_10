//
//  CC_ViewController.swift
//  Swift_10
//
//  Created by 陈孟迪 on 2017/12/22.
//  Copyright © 2017年 陈孟迪. All rights reserved.
//

import UIKit
//1-1、第一种定义闭包的方法
//typealias setY = (CGFloat)->Void
class CC_ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate {

    var color:UIColor?
    var myTableView:UITableView?
    
    //1-1、第二种定义闭包的方法
    var setY:((CGFloat)->Void)?
    
    //每个tableView里边的偏移量都是一样的
    var tableViewY: CGFloat = 0 {
        
        didSet {
            
            if tableViewY < 200 {
              
                myTableView?.contentOffset = CGPoint.init(x: 0, y: tableViewY)
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }

    func createUI() {
        
        myTableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: w, height: h), style: .plain)
        myTableView?.delegate = self
        myTableView?.dataSource = self
        myTableView?.backgroundColor = UIColor.clear
        self.view.addSubview(myTableView!)
        myTableView?.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
    }
    //获取tableView的偏移量
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let tableViewOfSetY = scrollView.contentOffset.y
        print("tableViewOfSetY:\(tableViewOfSetY)")
        
        //2、闭包的触发
        setY!(tableViewOfSetY)
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let v:UIView = UIView()
        v.backgroundColor = UIColor.clear
        return v
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        cell.backgroundColor = color
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

        
    }
    
}
