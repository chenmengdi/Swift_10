//
//  ViewController.swift
//  Swift_10
//
//  Created by 陈孟迪 on 2017/12/14.
//  Copyright © 2017年 陈孟迪. All rights reserved.
//
//http://blog.csdn.net/yuqingzhude/article/details/52671592
//guard let tmpData = jsondata?["data"],  let data = tmpData as? [String: Any] else {
//}
import UIKit

let w = UIScreen.main.bounds.size.width
let h = UIScreen.main.bounds.size.height
let b = UIScreen.main.bounds
class ViewController: UIViewController {

    var imageView:UIImageView?
    var bgScrollView:UIScrollView?
    let oneVC = CC_ViewController()
    let twoVC = CC_ViewController()
    let threeVC = CC_ViewController()
    var nowOffset:CGFloat?

    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()

    }

    func createUI() {

        imageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: w, height: 200))
        imageView?.contentMode = .scaleAspectFill
        imageView?.image = UIImage.init(named: "viewImage")
        self.view.addSubview(imageView!)
        
        bgScrollView = UIScrollView.init(frame: CGRect.init(x: 0, y: 0, width: w, height: h))
        bgScrollView?.isPagingEnabled = true
        bgScrollView?.contentSize = CGSize.init(width: w*3, height: h)
        self.view.addSubview(bgScrollView!)
        
        oneVC.view.frame = CGRect.init(x: 0, y: 0, width: w, height: h)                        
        oneVC.color = UIColor.orange
        
        //闭包的实现
        oneVC.setY = {[weak self] ofSetY in
            print("ofSetY1:\(ofSetY)")
            self?.setImageViewOffset(offsety: ofSetY)
        }
        
        twoVC.view.frame = CGRect.init(x: w, y: 0, width: w, height: h)
        twoVC.color = UIColor.red
        twoVC .setY = {[weak self] ofSetY in
            print("ofSetY2:\(ofSetY)")
            self?.setImageViewOffset(offsety: ofSetY)
        }
        
        threeVC.view.frame = CGRect.init(x: w*2, y: 0, width: w, height: h)
        threeVC.color = UIColor.purple
        threeVC.setY = {[weak self] ofSetY in
            print("ofSetY3:\(ofSetY)")
            self?.setImageViewOffset(offsety: ofSetY)
        }
        
        bgScrollView?.addSubview((oneVC.view)!)
        bgScrollView?.addSubview((twoVC.view)!)
        bgScrollView?.addSubview((threeVC.view)!)
        
        
    }
    func setImageViewOffset(offsety:CGFloat) {
        if offsety>0 {
            imageView?.frame.origin.y = -offsety
        }else if offsety<0{
            imageView?.frame.size.height = 200-offsety+5
        }
        print("=====y:\(String(describing: imageView?.frame.origin.y))")
        if offsety<200 {
            //如果在切换tableView时保证偏移量不变
            oneVC.tableViewY = offsety
            twoVC.tableViewY = offsety
            threeVC.tableViewY = offsety
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

