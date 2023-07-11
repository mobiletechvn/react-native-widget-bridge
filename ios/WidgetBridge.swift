import Foundation
import os.log
import WidgetKit


@objc(WidgetBridge)
public class WidgetBridge: NSObject {
  @objc var suite: UserDefaults?

  @objc func initSuit(suiteName: String) {
    self.suite = UserDefaults(suiteName: suiteName)
  }

  @objc(multiply:withB:withResolver:withRejecter:)
  public func multiply(a: Float, b: Float, resolve:RCTPromiseResolveBlock,reject:RCTPromiseRejectBlock) -> Void {
    resolve(a*b)
  }


  @objc(initUserDefaultsSuit:withResolver:withRejecter:)
  func initUserDefaultsSuit(suiteName: String,
     resolve:RCTPromiseResolveBlock, reject:RCTPromiseRejectBlock
  ) -> Void {
    initSuit(suiteName: suiteName)
    resolve(true)
  }

  @objc(ensureUserDefaultsSuit:withResolver:withRejecter:)
  func ensureUserDefaultsSuit(suiteName_: String,
     resolve:RCTPromiseResolveBlock, reject:RCTPromiseRejectBlock
  ) -> Void {
    if suite == nil {
      initSuit(suiteName: suiteName_)
    }
    resolve(true)
  }

  @objc(setDict:withValue:withResolver:withRejecter:)
  func setDict(key: String, value: Dictionary<String, Any>,
           resolve:RCTPromiseResolveBlock, reject:RCTPromiseRejectBlock
  ) -> Void {
    if suite == nil {
      reject("InvalidArgument", "[WidgetBridge] ERROR: You need to initUserDefaultsSuit(suiteName) first", NSError(domain: "", code: 200, userInfo: nil))
    } else {
      suite?.set(value, forKey: key)
      if #available(iOS 10.0, *) {
        os_log("[WidgetBridge] set, key, value: ", key, value)
      }
      resolve(true)
    }
  }


  @objc(getDict:withResolver:withRejecter:)
  func getDict(key: String,
           resolve:RCTPromiseResolveBlock, reject:RCTPromiseRejectBlock
  ) -> Void {
    if suite == nil {
      reject("InvalidArgument", "[WidgetBridge] ERROR: You need to initUserDefaultsSuit(suiteName) first", NSError(domain: "", code: 200, userInfo: nil))
    } else {
      if let value = suite!.dictionary(forKey: key) {
        if #available(iOS 10.0, *) {
          os_log("[WidgetBridge] get, key value: ", key, value as! CVarArg)
        }
      
        resolve(value)
      } else {
        resolve(nil)
      }
    }
  }
  
  
  @objc(setString:withValue:withResolver:withRejecter:)
  func setString(key: String, value: String,
           resolve:RCTPromiseResolveBlock, reject:RCTPromiseRejectBlock
  ) -> Void {
    if suite == nil {
      reject("InvalidArgument", "[WidgetBridge] ERROR: You need to initUserDefaultsSuit(suiteName) first", NSError(domain: "", code: 200, userInfo: nil))
    } else {
      suite?.set(value, forKey: key)
      resolve(true)
    }
  }
  

  @objc(getString:withResolver:withRejecter:)
  func getString(key: String,
           resolve:RCTPromiseResolveBlock, reject:RCTPromiseRejectBlock
  ) -> Void {
    if suite == nil {
      reject("InvalidArgument", "[WidgetBridge] ERROR: You need to initUserDefaultsSuit(suiteName) first", NSError(domain: "", code: 200, userInfo: nil))
    } else {
      if let value = suite!.string(forKey: key) {
        resolve(value)
      } else {
        resolve(nil)
      }
    }
  }

  @objc(removeObject:withResolver:withRejecter:)
  func removeObject(key: String,
           resolve:RCTPromiseResolveBlock, reject:RCTPromiseRejectBlock
  ) -> Void {
    if suite == nil {
      reject("InvalidArgument", "[WidgetBridge] ERROR: You need to initUserDefaultsSuit(suiteName) first", NSError(domain: "", code: 200, userInfo: nil))
    } else {
      suite!.removeObject(forKey: key)
      resolve(true)
    }
  }

  @objc(reloadWidget:withResolver:withRejecter:)
  func reloadWidget(
                    kind: String,
                    resolve:RCTPromiseResolveBlock, reject:RCTPromiseRejectBlock
  ) -> Void {
    if #available(iOS 14.0, *) {
      #if arch(arm64) || arch(i386) || arch(x86_64)
      WidgetCenter.shared.reloadTimelines(ofKind: kind)
      #endif
    }
    resolve(true)
  }

  @objc
  static func requiresMainQueueSetup() -> Bool {
    return true
  }
}
