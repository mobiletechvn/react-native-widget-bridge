//
//  BGTaskService.swift
//  WidgetBridge
//
//  Created by Luat on 31/12/20.
//  Copyright © 2020 Facebook. All rights reserved.
//


/*
 Usage in objc:
  #import <react_native_widget_bridge/react_native_widget_bridge-Swift.h>
  [[BGService shared] setMinFetchIntervalWithSecs:300];
 */

import Foundation

@objc
public class BGTaskService: NSObject {
  @objc
  public static let shared = BGTaskService()

  private override init() {}

  @objc
  public func setMinFetchInterval (secs: TimeInterval) {
    UIApplication.shared.setMinimumBackgroundFetchInterval(secs)
  }
}
