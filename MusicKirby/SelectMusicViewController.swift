//
//  SelectMusicViewController.swift
//  MusicKirby
//
//  Created by むなかた　しゅん on 2018/07/11.
//  Copyright © 2018年 むなかた　しゅん. All rights reserved.
//

import UIKit

class SelectMusicViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource{
    
    @IBOutlet weak var selectMusicPickerView: UIPickerView!
    
    
    var musicName = ["グリーングリーンズ(初代)","Orange Ocean","グルメレース","グレープガーデン","スカイタワー","天をかける虹","クーのテーマ","戦艦ハルバード甲板"]
    var imageName = ["GreenGreens_first","OrangeOcean","GrumeRace","GreepGuraden","SkyTower","Rainbow","Kuu","Halberd"]
    var screenWidth:CGFloat = 0
    var screenHeight:CGFloat = 0
    
    //pickerView ループ設定用変数
    var pickerOffset : Int = 0
    var musicCount : Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


        //スクリーンサイズ取得
        screenWidth = view.frame.width
        screenHeight = view.frame.height
        //回転方向
        let rotationAngle:CGFloat = -90 * ( .pi / 180)
        //変更前のpickerViewの高さ
        let y = 30/600 * screenHeight
        selectMusicPickerView.transform = CGAffineTransform(rotationAngle: rotationAngle)
        selectMusicPickerView.frame = CGRect(x:-100, y:y, width:screenWidth+200, height: screenHeight*0.6)
        
        //擬似的な無限ループのためpickerの要素数を増やす
        let loopNumber = 10
        musicCount = musicName.count
        pickerOffset  = musicCount * loopNumber / 2
        for _ in 0 ..< loopNumber {
            musicName += musicName
            imageName += imageName
        }
        selectMusicPickerView.selectRow(pickerOffset, inComponent: 0, animated: false)
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        for i in selectMusicPickerView.subviews {
//            print(i)
//        }
        //PIckerViewの枠線消し (以後変わることがありそうなので要注意)
        selectMusicPickerView.subviews[1].isHidden = true
        selectMusicPickerView.subviews[2].isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //pickerViewの数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //コンポーネントに含まれるデータの数を返すメソッド
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return musicName.count
    }
    
    //データを返すメソッド
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return musicName[row]
    }

    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return screenWidth*3/5
    }
    
    // セルをビューで表示
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
//        let y = screenHeight * 2 / 5
        let view = ForPickerView(frame: CGRect(x:0 ,y:0 ,width:screenWidth*3/5 ,height:screenHeight*0.6))
        view.ImageLabelInit(imageName: imageName[row], labelName: musicName[row])
        view.alpha = 1
        return view
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let number = row%musicCount + pickerOffset
        selectMusicPickerView.selectRow(number, inComponent: component, animated: false)
        print(selectMusicPickerView.alpha)
        print()
    }
    
    
    
}
