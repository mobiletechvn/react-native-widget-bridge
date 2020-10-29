import { NativeModules } from 'react-native';

type WidgetBridgeType = {
  multiply(a: number, b: number): Promise<number>;
};

const { WidgetBridge } = NativeModules;

export default WidgetBridge as WidgetBridgeType;
