//
//  MaterialSwitch.swift
//  MaterialSwitch
//
//  Created by Du on 2018/6/1.
//  Copyright © 2018年 TEST. All rights reserved.
//

import UIKit

class MaterialSwitch: UIControl {

    /// MARK: State
    open var isOn: Bool {
        set(newValue) {
            self._isOn = newValue ? true : false
        }
        get {
            return self._isOn
        }
    }
    fileprivate var _isOn: Bool!
    
    open var isSwitchEnabled: Bool!
    open var isBounceEnabled = true {
        didSet {
            if isBounceEnabled {
                self.bounceOffset = 3.0
            }else {
                bounceOffset = 0.0
            }
        }
    }
    
    /// MARK: Color
    open var thumbOnTintColor: UIColor!
    open var thumbOffTintColor: UIColor!
    open var trackOnTintColor: UIColor!
    open var trackOffTintColor: UIColor!
    open var thumbDisbaledTintColor: UIColor!
    open var trackDisbaledTintColor: UIColor!
    
    /// MARK: Components
    open var switchThumb: UIButton!
    open var switchTrack: UIView!
    
    /// MARK: thumb position
    fileprivate var thumbOnPosition: CGFloat!
    fileprivate var thumbOffPosition: CGFloat!
    fileprivate var bounceOffset: CGFloat = 3.0
    
    enum MaterilSwitchStyle {
        case MaterilSwitchStyleDefault
        case MaterilSwitchStyleLight
        case MaterilSwitchStyleDark
    }
    
    enum MaterilSwitchState {
        case MaterilSwitchStyleOn
        case MaterilSwitchStyleOff
    }
    
    override var isEnabled: Bool {
        didSet{
            UIView.animate(withDuration: 0.1, animations: {
                if self.isEnabled == true {
                    if self._isOn == true {
                        self.switchThumb.backgroundColor = self.thumbOnTintColor
                        self.switchTrack.backgroundColor = self.trackOnTintColor
                    }else {
                        self.switchThumb.backgroundColor = self.thumbOffTintColor
                        self.switchTrack.backgroundColor = self.trackOffTintColor
                    }
                }else {
                    self.switchThumb.backgroundColor = self.thumbDisbaledTintColor
                    self.switchTrack.backgroundColor = self.trackDisbaledTintColor
                }
            })
        }
    }
    
    convenience init() {
        self.init(style: .MaterilSwitchStyleDefault, state: .MaterilSwitchStyleOn)
    }
    
    init(style: MaterilSwitchStyle, state: MaterilSwitchState) {
        // initialize
        self.thumbOnTintColor = #colorLiteral(red: 0.2039215686, green: 0.4274509804, blue: 0.9450980392, alpha: 1)
        self.thumbOffTintColor = #colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 0.9764705882, alpha: 1)
        self.thumbDisbaledTintColor = #colorLiteral(red: 0.6823529412, green: 0.6823529412, blue: 0.6823529412, alpha: 1)
        self.trackOnTintColor = #colorLiteral(red: 0.5607843137, green: 0.7019607843, blue: 0.968627451, alpha: 1)
        self.trackOffTintColor = #colorLiteral(red: 0.7568627451, green: 0.7568627451, blue: 0.7568627451, alpha: 1)
        self.trackDisbaledTintColor = #colorLiteral(red: 0.7960784314, green: 0.7960784314, blue: 0.7960784314, alpha: 1)
        self.isSwitchEnabled = true
        self.isBounceEnabled = true
        
        // frame
        let frame = CGRect(x: 0.0, y: 0.0, width: 40.0, height: 30.0)
        let thumbFrame = CGRect(x: 0.0, y: (frame.size.height - 24.0) / 2, width: 24.0, height: 24.0)
        let trackFrame = CGRect(x: 0.0, y: (frame.size.height - 17.0) / 2, width: 40.0, height: 17.0)
        
        super.init(frame: frame)
        
        // switchTrack
        self.switchTrack = UIView.init(frame: trackFrame)
        self.switchTrack.backgroundColor = UIColor.gray
        self.switchTrack.layer.cornerRadius = min(self.switchTrack.frame.size.height, self.switchTrack.frame.size.width) / 2
        self.addSubview(switchTrack!)
        
        // switchThumb
        self.switchThumb = UIButton.init(frame: thumbFrame)
        self.switchThumb.backgroundColor = UIColor.white
        self.switchThumb.layer.cornerRadius = self.switchThumb.frame.size.height / 2
        self.switchThumb.layer.shadowOpacity = 0.5
        self.switchThumb.layer.shadowOffset = CGSize.init(width: 0.0, height: 1.0)
        self.switchThumb.layer.shadowColor = UIColor.black.cgColor
        self.switchThumb.layer.shadowRadius = 2.0
        
        
        self.switchThumb.addTarget(self, action: #selector(onTouchUpInside(button:event:)), for: .touchUpInside)
        self.switchThumb.addTarget(self, action: #selector(onTouchDragInside(button:event:)), for: .touchDragInside)
        // 长按按钮，鼠标移到模拟器外面，会触发.touchUpOutside
        self.switchThumb.addTarget(self, action: #selector(onTouchUpInside(button:event:)), for: .touchUpOutside)
        self.addSubview(switchThumb)
        
        // position
        thumbOnPosition = self.frame.size.width - self.switchThumb.frame.size.width
        thumbOffPosition = self.switchThumb.frame.origin.x
        
        
        switch style {
        case .MaterilSwitchStyleDefault:
            self.thumbOnTintColor = #colorLiteral(red: 0.2039215686, green: 0.4274509804, blue: 0.9450980392, alpha: 1)
            self.thumbOffTintColor = #colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 0.9764705882, alpha: 1)
            self.thumbDisbaledTintColor = #colorLiteral(red: 0.6823529412, green: 0.6823529412, blue: 0.6823529412, alpha: 1)
            self.trackOnTintColor = #colorLiteral(red: 0.2823529412, green: 0.7019607843, blue: 0.968627451, alpha: 1)
            self.trackOffTintColor = #colorLiteral(red: 0.368627451, green: 0.368627451, blue: 0.368627451, alpha: 1)
            self.trackDisbaledTintColor = #colorLiteral(red: 0.2196078431, green: 0.2196078431, blue: 0.2196078431, alpha: 1)
        case .MaterilSwitchStyleLight:
            self.thumbOnTintColor = #colorLiteral(red: 0, green: 0.5254901961, blue: 0.4588235294, alpha: 1)
            self.thumbOffTintColor = #colorLiteral(red: 0.9294117647, green: 0.9294117647, blue: 0.9294117647, alpha: 1)
            self.thumbDisbaledTintColor = #colorLiteral(red: 0.6862745098, green: 0.6862745098, blue: 0.6862745098, alpha: 1)
            self.trackOnTintColor = #colorLiteral(red: 0.3529411765, green: 0.6980392157, blue: 0.662745098, alpha: 1)
            self.trackOffTintColor = #colorLiteral(red: 0.6862745098, green: 0.6862745098, blue: 0.6862745098, alpha: 1)
            self.trackDisbaledTintColor = #colorLiteral(red: 0.7960784314, green: 0.7960784314, blue: 0.7960784314, alpha: 1)
        case .MaterilSwitchStyleDark:
            self.thumbOnTintColor = #colorLiteral(red: 0.4274509804, green: 0.7607843137, blue: 0.7215686275, alpha: 1)
            self.thumbOffTintColor = #colorLiteral(red: 0.6862745098, green: 0.6862745098, blue: 0.6862745098, alpha: 1)
            self.thumbDisbaledTintColor = #colorLiteral(red: 0.1960784314, green: 0.1960784314, blue: 0.1960784314, alpha: 1)
            self.trackOnTintColor = #colorLiteral(red: 0.2823529412, green: 0.4274509804, blue: 0.4117647059, alpha: 1)
            self.trackOffTintColor = #colorLiteral(red: 0.368627451, green: 0.368627451, blue: 0.368627451, alpha: 1)
            self.trackDisbaledTintColor = #colorLiteral(red: 0.2196078431, green: 0.2196078431, blue: 0.2196078431, alpha: 1)
        }
        
        switch state {
        case .MaterilSwitchStyleOn:
            self._isOn = true
            self.switchThumb.backgroundColor = self.thumbOnTintColor
            self.switchTrack.backgroundColor = self.trackOnTintColor
            var thumbOnFrame = self.switchThumb.frame
            thumbOnFrame.origin.x = thumbOnPosition
            self.switchThumb.frame = thumbOnFrame
        case .MaterilSwitchStyleOff:
            self._isOn = false
            self.switchThumb.backgroundColor = self.thumbOffTintColor
            self.switchTrack.backgroundColor = self.trackOffTintColor
        }
        
        // 给MaterialSwitch整个区域添加手势
        let tapGesture = UITapGestureRecognizer.init(target: self, action: #selector(switchTapped(_:)))
        self.addGestureRecognizer(tapGesture)
    }
    
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        if _isOn == true {
            switchThumb.backgroundColor = thumbOnTintColor
            switchTrack.backgroundColor = trackOnTintColor
        }else {
            switchThumb.backgroundColor = thumbOffTintColor
            switchTrack.backgroundColor = trackOffTintColor
            changeSwitchStateToOff()
        }
        
        if !isSwitchEnabled {
            switchThumb.backgroundColor = thumbDisbaledTintColor
            switchTrack.backgroundColor = trackDisbaledTintColor
        }
        
        if isBounceEnabled {
            bounceOffset = 3.0
        }else {
            bounceOffset = 0.0
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MaterialSwitch {
    @objc fileprivate func switchTapped(_ gesture: UITapGestureRecognizer) {
        if _isOn {
            changeSwitchStateToOff()
        }else {
            changeSwitchStateToOn()
        }
    }
    
    @objc fileprivate func onTouchUpInside(button: UIButton, event: UIEvent) {
        if _isOn {
            changeSwitchStateToOff()
        }else {
            changeSwitchStateToOn()
        }
    }
    
    @objc fileprivate func onTouchDragInside(button: UIButton, event: UIEvent) {
        debugPrint(#function)
        let touch = event.touches(for: button)?.first
        let prePoint = touch?.previousLocation(in: button)
        let curPoint = touch?.location(in: button)
        // x轴的距离
        let dx = (curPoint?.x)! - (prePoint?.x)!
        
        var thumbFrame = button.frame
        thumbFrame.origin.x += dx
        
        //保证按钮不超出轨道
        //右边最大就去到thumbOnPosition这个值，也就是不会超出右边
        thumbFrame.origin.x = min(thumbFrame.origin.x, thumbOnPosition)
        //左移，x会变小，最小就去到thumbOffPosition这个值，也就是不会超出左边
        thumbFrame.origin.x = max(thumbFrame.origin.x, thumbOffPosition)
        
        if thumbFrame.origin.x != button.frame.origin.x {
            button.frame = thumbFrame
        }
    }
    
    @objc fileprivate func onTouchCancel(button: UIButton, event: UIEvent) {
        let touch = event.touches(for: button)?.first
        let prePoint = touch?.previousLocation(in: button)
        let curPoint = touch?.location(in: button)
        // x轴的距离
        let dx = (curPoint?.x)! - (prePoint?.x)!
        
        let newXOrigin = button.frame.origin.x + dx
        
        if newXOrigin > (self.frame.size.width - self.switchThumb.frame.size.width)/2 {
            changeSwitchStateToOn()
        }else {
            changeSwitchStateToOff()
        }
    }
    
    // 开启
    fileprivate func changeSwitchStateToOn() {
        UIView.animate(withDuration: 0.15, delay: 0.05, options: .curveEaseInOut, animations: {
            var thumbFrame = self.switchThumb.frame
            thumbFrame.origin.x = self.thumbOnPosition + self.bounceOffset
            self.switchThumb.frame = thumbFrame
            //判断switch是否可用
            if self.isSwitchEnabled {
                self.switchThumb.backgroundColor = self.thumbOnTintColor
                self.switchTrack.backgroundColor = self.trackOnTintColor
            }else {
                self.switchThumb.backgroundColor = self.thumbDisbaledTintColor
                self.switchTrack.backgroundColor = self.trackDisbaledTintColor
            }
            //动画过程中，不可交互
            self.isUserInteractionEnabled = false
        }) { (finished) in
            if self._isOn == false {
                self._isOn = true
                // 指定事件
                self.sendActions(for: .valueChanged)
            }
            self._isOn = true
            //回弹效果
            UIView.animate(withDuration: 0.15, animations: {
                var thumbFrame = self.switchThumb.frame
                thumbFrame.origin.x = self.thumbOnPosition
                self.switchThumb.frame = thumbFrame
            }, completion: { _ in
                //动画完毕，可交互
                self.isUserInteractionEnabled = true
            })
        }
    }
    
    // 关闭
    fileprivate func changeSwitchStateToOff() {
        UIView.animate(withDuration: 0.15, delay: 0.05, options: .curveEaseInOut, animations: {
            var thumbFrame = self.switchThumb.frame
            thumbFrame.origin.x = self.thumbOffPosition - self.bounceOffset
            self.switchThumb.frame = thumbFrame
            //判断switch是否可用
            if self.isSwitchEnabled {
                self.switchThumb.backgroundColor = self.thumbOffTintColor
                self.switchTrack.backgroundColor = self.trackOffTintColor
            }else {
                self.switchThumb.backgroundColor = self.thumbDisbaledTintColor
                self.switchTrack.backgroundColor = self.trackDisbaledTintColor
            }
            //动画过程中，不可交互
            self.isUserInteractionEnabled = false
        }) { (finished) in
            if self._isOn == true {
                self._isOn = false
                self.sendActions(for: .valueChanged)
            }
            self._isOn = false
            //回弹效果
            UIView.animate(withDuration: 0.15, animations: {
                var thumbFrame = self.switchThumb.frame
                thumbFrame.origin.x = self.thumbOffPosition
                self.switchThumb.frame = thumbFrame
            }, completion: { _ in
                //动画完毕，可交互
                self.isUserInteractionEnabled = true
            })
        }
    }
}
