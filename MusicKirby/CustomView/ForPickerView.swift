//
//  ForPickerView.swift
//  MusicKirby
//
//  Created by むなかた　しゅん on 2018/07/11.
//  Copyright © 2018年 むなかた　しゅん. All rights reserved.
//

import UIKit

class ForPickerView: UIView {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var musicLabel: UILabel!
    @IBOutlet weak var labelBackGround: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    private func commonInit(){
        guard let view = UINib(nibName:"ForPickerView", bundle: nil).instantiate(withOwner: self, options: nil).first as? UIView else{
            return
        }
        view.frame = self.bounds
        view.autoresizingMask = [.flexibleHeight , .flexibleWidth]
        view.transform = CGAffineTransform(rotationAngle: 90*(.pi/180))
        self.addSubview(view)
    }
    
    func ImageLabelInit(imageName:String , labelName:String){
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 30
        imageView.image = UIImage(named :imageName)
        
        musicLabel.layer.masksToBounds = true
        musicLabel.text = labelName
        musicLabel.adjustsFontSizeToFitWidth = true
        musicLabel.sizeToFit()
        
        labelBackGround.frame.size.height = musicLabel.frame.size.height + 10
        
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
