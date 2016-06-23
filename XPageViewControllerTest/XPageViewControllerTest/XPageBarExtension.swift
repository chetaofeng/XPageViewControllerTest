//
//  XPageBarExtension.swift
//  XPageViewControllerTest
//
//  Created by chetaofeng on 16/6/22.
//  Copyright © 2016年 gsunis. All rights reserved.
//
import UIKit

extension XPageBar {
    func addTitleLabelToPageBar() -> Void{
        var x:CGFloat = 0
        for i in 0..<titleArr.count {
            let title = titleArr[i]
            let textLabel = UILabel(frame:CGRectMake(x,0,0,44))
            textLabel.text = title
            textLabel.tag = i
            textLabel.fitLabelWidthToText()
            textLabel.textColor = self.itemColour
            textLabel.textAlignment = .Center
            textLabel.font = UIFont.systemFontOfSize(14)
            textLabel.userInteractionEnabled = true  //设置label可以响应动作
            self.titleBarScrollView.addSubview(textLabel)
            x = x + textLabel.frame.size.width
            
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.titleLabelTaped(_:)))
            textLabel.addGestureRecognizer(tap)
            self.textLabelArr.append(textLabel)
        }
        self.titleBarScrollView.contentSize.width = x
        self.updateLabel()
    }
    
    func titleLabelTaped(tap:UITapGestureRecognizer) -> Void {
        self.seletedItem = (tap.view?.tag)!
        self.updateLabel()
        self.xPageBarDelegate.xPageBarLabelDidTaped((tap.view?.tag)!)
    }
    
    func updateLabel() -> Void {
        for label in self.textLabelArr {
            label.textColor = self.itemColour
        }
        
        let seletedLabel = self.textLabelArr[self.seletedItem]
        seletedLabel.textColor = self.itemSeletedColour
        
        //设置滚动之后label标题的位置
        let labelCenter = seletedLabel.center.x
        var scrollToX = labelCenter - self.width / 2
        if scrollToX > self.titleBarScrollView.contentSize.width - self.width {
            scrollToX = self.titleBarScrollView.contentSize.width - self.width
        }
        if scrollToX < 0 {
            scrollToX = 0
        }
        self.titleBarScrollView.setContentOffset(CGPointMake(scrollToX, 0), animated: true)
    }
}

extension UILabel {
    func fitLabelWidthToText() -> Void {
        let text:NSString = NSString(string: self.text!)
        let size = text.boundingRectWithSize(CGSizeMake(0, 44), options: .UsesLineFragmentOrigin, attributes: [NSFontAttributeName:self.font], context: nil)
        self.frame.size.width = size.width + 60
    }
}