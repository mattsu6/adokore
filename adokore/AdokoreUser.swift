import Foundation
import AdSupport

/**
 * あどこれユーザクラス
 * adkoreId アプリ固有のユーザ識別子
 * idfa 端末が持つIDFA
 * ads IDFAに紐づく広告
 */
class AdokoreUser {
  static let adokoreUser = AdokoreUser()
  var adkoreId: String = ""
  var idfa: String = ""
  var ads: [String] = []
  
  private init() {
    let idfa: String!
    if ASIdentifierManager.sharedManager().advertisingTrackingEnabled {
      idfa = ASIdentifierManager.sharedManager().advertisingIdentifier.UUIDString
    } else {
      idfa = "not allowed"
    }
    self.idfa = idfa
    
    /** エミュレータでは，毎回IDFAが変化するため，固定値を用いる **/
    self.idfa = "20454994-6C8E-450D-872D-24E29D47D724"
    /****/
  }
}