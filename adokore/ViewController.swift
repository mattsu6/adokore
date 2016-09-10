//
//  ViewController.swift
//  adokore
//
//  Created by mattsu on 8/26/16.
//  Copyright © 2016 mattsu. All rights reserved.
//

import UIKit
import AdSupport
import Foundation
import SwiftyJSON

class ViewController: UIViewController {
  
  @IBOutlet weak var idfaLabel: UILabel!
  @IBOutlet weak var adokoreIdTxt: UITextField!
  @IBOutlet weak var passwordTxt: UITextField!
  let idfa = AdokoreUser.adokoreUser.idfa
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.backgroundColor = UIColor(red: 1, green: 0.7843, blue: 0.5882, alpha: 1.0) /* #ffc896 */
    
    idfaLabel.text = idfa
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  //登録ボタン
  @IBAction func tapSignup(sender: UIButton) {
    let username:NSString = adokoreIdTxt.text! as NSString
    let password:NSString = passwordTxt.text! as NSString
    
    if ( username.isEqualToString("") || password.isEqualToString("") ) {
      let alert = UIAlertController(title: "ちゃんといれて", message: "ください", preferredStyle: UIAlertControllerStyle.Alert)
      alert.addAction(UIAlertAction(title: "うん", style: UIAlertActionStyle.Default, handler: nil))
      self.presentViewController(alert, animated: true, completion: nil)
    }
    else {
      RequestAgent.post("type=1&user=\(username)&password=\(password)&idfa=\(idfa)", compleationHandler: {
        (data, resp, err) in
        print(resp!.URL!)
        print(NSString(data: data!, encoding: NSUTF8StringEncoding))})
    }
  }
  
  //ログイン
  @IBAction func login(sender: UIButton) {
    AdokoreUser.adokoreUser.adkoreId = adokoreIdTxt.text!
    AdokoreUser.adokoreUser.idfa = idfa
    AdokoreUser.adokoreUser.ads = []
    RequestAgent.post("type=3&idfa=\(AdokoreUser.adokoreUser.idfa)", compleationHandler: {
      (data, resp, err) in
      let json = JSON(data: data!)
      for (_, subJson): (String, JSON) in json {
        AdokoreUser.adokoreUser.ads += [subJson["image_path"].stringValue]
      }
      //画面遷移
      dispatch_async(dispatch_get_main_queue(),{() -> Void in
        let collectionController: CollectionController = self.storyboard?.instantiateViewControllerWithIdentifier("collectionVC") as! CollectionController
        self.navigationController?.pushViewController(collectionController, animated: true)
      })
    })
  }
  
  //全初期化ボタン
  @IBAction func resetAdokoreDb(sender: UIButton) {
    
    let alert = UIAlertController(title: "消すよー！", message: "全消し", preferredStyle: UIAlertControllerStyle.Alert)
    
    alert.addAction(UIAlertAction(title: "うん", style: .Default, handler: { (action: UIAlertAction!) in
      RequestAgent.post("type=4", compleationHandler: {
        (data, resp, err) in
        print(resp!.URL!)
        print(NSString(data: data!, encoding: NSUTF8StringEncoding))})
    }))
    
    alert.addAction(UIAlertAction(title: "だめ", style: .Cancel, handler: { (action: UIAlertAction!) in
      //nop
    }))
    presentViewController(alert, animated: true, completion: nil)
  }
  
}

