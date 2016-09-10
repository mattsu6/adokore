import UIKit

/**
 * HTTPリクエストを簡略化するためのエージェントクラス
 */
class RequestAgent {

  class func post(httpBody: String, compleationHandler: (NSData?, NSURLResponse?, NSError?) -> Void) {
    let url = NSURL(string: "http://tadaserver.net/service.php")
    let config = NSURLSessionConfiguration.defaultSessionConfiguration()
    let session = NSURLSession(configuration: config)
    let req = NSMutableURLRequest(URL: url!)
    req.HTTPMethod = "POST"
    req.HTTPBody = httpBody.dataUsingEncoding(NSUTF8StringEncoding)
    let task = session.dataTaskWithRequest(req, completionHandler: compleationHandler)
    task.resume()
  }
}
