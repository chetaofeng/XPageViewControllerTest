//
//  XPageBar.swift
//  XPageViewControllerTest
//
//  Created by chetaofeng on 16/6/22.
//  Copyright © 2016年 gsunis. All rights reserved.
//

import UIKit

protocol XPageBarProtocol {
    func xPageBarLabelDidTaped(index:Int)
}

class XPageBar: UIView {
    var seletedItem = 0 {
        didSet{
            self.updateLabel()
        }
    }
    let itemColour = UIColor.redColor()
    let itemSeletedColour = UIColor.blueColor()
    var textLabelArr:Array<UILabel> = []
    var titleBarScrollView:UIScrollView!
    let width = UIScreen.mainScreen().bounds.width
    let height = UIScreen.mainScreen().bounds.height
    var xPageBarDelegate:XPageBarProtocol!
    var titleArr:Array<String> = []{
        didSet{
            print("titleArr didSet")
            
            self.addTitleLabelToPageBar()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.whiteColor()
        self.titleBarScrollView = UIScrollView(frame:CGRectMake(0,0,self.width,44))
        self.titleBarScrollView.showsVerticalScrollIndicator = false
        self.titleBarScrollView.showsHorizontalScrollIndicator = false
    
        self.addSubview(self.titleBarScrollView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
