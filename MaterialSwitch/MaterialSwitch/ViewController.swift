//
//  ViewController.swift
//  MaterialSwitch
//
//  Created by Du on 2018/6/1.
//  Copyright © 2018年 TEST. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupMaterialSwitch()
    }

    func setupMaterialSwitch() {
        // Defalut
        let materialDefaultStyle_on = MaterialSwitch.init(style: .MaterilSwitchStyleDefault, state: .MaterilSwitchStyleOn)
        materialDefaultStyle_on.addTarget(self, action: #selector(materialSwitchchanged(mSwitch:)), for: .valueChanged)
        materialDefaultStyle_on.center = CGPoint(x: 100, y: 30)
        let materialDefaultStyle_off = MaterialSwitch.init(style: .MaterilSwitchStyleDefault, state: .MaterilSwitchStyleOff)
        materialDefaultStyle_off.addTarget(self, action: #selector(materialSwitchchanged(mSwitch:)), for: .valueChanged)
        materialDefaultStyle_off.center = CGPoint(x: 200, y: 30)
        // Light
        let materialLightStyle_on = MaterialSwitch.init(style: .MaterilSwitchStyleLight, state: .MaterilSwitchStyleOn)
        materialLightStyle_on.addTarget(self, action: #selector(materialSwitchchanged(mSwitch:)), for: .valueChanged)
        materialLightStyle_on.center = CGPoint(x: 100, y: 80)
        let materialLightStyle_off = MaterialSwitch.init(style: .MaterilSwitchStyleLight, state: .MaterilSwitchStyleOff)
        materialLightStyle_off.addTarget(self, action: #selector(materialSwitchchanged(mSwitch:)), for: .valueChanged)
        materialLightStyle_off.center = CGPoint(x: 200, y: 80)
        // Dark
        let materialDarkStyle_on = MaterialSwitch.init(style: .MaterilSwitchStyleDark, state: .MaterilSwitchStyleOn)
        materialDarkStyle_on.addTarget(self, action: #selector(materialSwitchchanged(mSwitch:)), for: .valueChanged)
        materialDarkStyle_on.center = CGPoint(x: 100, y: 130)
        let materialDarkStyle_off = MaterialSwitch.init(style: .MaterilSwitchStyleDark, state: .MaterilSwitchStyleOff)
        materialDarkStyle_off.addTarget(self, action: #selector(materialSwitchchanged(mSwitch:)), for: .valueChanged)
        materialDarkStyle_off.center = CGPoint(x: 200, y: 130)
        // Disable
        let materialDisable_on = MaterialSwitch.init(style: .MaterilSwitchStyleDefault, state: .MaterilSwitchStyleOn)
        materialDisable_on.center = CGPoint(x: 100, y: 180)
        materialDisable_on.isEnabled = false
        let materialDisable_off = MaterialSwitch.init(style: .MaterilSwitchStyleDefault, state: .MaterilSwitchStyleOff)
        materialDisable_off.center = CGPoint(x: 200, y: 180)
        materialDisable_off.isEnabled = false
        // custom switch
        let customMaterialDisable_on = MaterialSwitch()
        customMaterialDisable_on.center = CGPoint(x: 100, y: 230)
        customMaterialDisable_on.thumbOnTintColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        customMaterialDisable_on.trackOnTintColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        customMaterialDisable_on.isOn = false
        
        // 没回弹效果
        let materialDefaultStyle_disableBounce = MaterialSwitch.init(style: .MaterilSwitchStyleDefault, state: .MaterilSwitchStyleOn)
        materialDefaultStyle_disableBounce.addTarget(self, action: #selector(materialSwitchchanged(mSwitch:)), for: .valueChanged)
        materialDefaultStyle_disableBounce.center = CGPoint(x: 100, y: 280)
        materialDefaultStyle_disableBounce.isBounceEnabled = false
        
        
        view.addSubview(materialDefaultStyle_on)
        view.addSubview(materialDefaultStyle_off)
        view.addSubview(materialLightStyle_on)
        view.addSubview(materialLightStyle_off)
        view.addSubview(materialDarkStyle_on)
        view.addSubview(materialDarkStyle_off)
        view.addSubview(materialDisable_on)
        view.addSubview(materialDisable_off)
        view.addSubview(customMaterialDisable_on)
        view.addSubview(materialDefaultStyle_disableBounce)
    }
    
    @objc func materialSwitchchanged(mSwitch: MaterialSwitch) {
        if mSwitch.isOn {
            debugPrint("MaterialSwith: ON")
        }else {
            debugPrint("MaterialSwith: OFF")
        }
    }


}

