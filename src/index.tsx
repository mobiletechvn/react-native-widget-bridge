import { NativeModules } from 'react-native';

type WidgetBridgeType = {
  multiply(a: number, b: number): Promise<number>;
  initUserDefaultsSuit(suiteName: string): Promise<boolean>;
  ensureUserDefaultsSuit(suiteName: string): Promise<boolean>;
  setDict(key: string, value: object): Promise<boolean>;
  getDict(key: string): Promise<object>;
  reloadWidget(kind: string): Promise<object>;
};

const { WidgetBridge } = NativeModules;

export default WidgetBridge as WidgetBridgeType;
