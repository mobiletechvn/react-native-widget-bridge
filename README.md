# react-native-widget-bridge

A bridge between JS thread and native widget, initially created for sharing data and communication with ios 14 widget

Currently, it's support ios 14
Android will be supported soon

## Installation

```sh
npm install react-native-widget-bridge
```

## Usage

```js
import WidgetBridge from "react-native-widget-bridge";

const result = await WidgetBridge.multiply(3, 7);

// Always ensure that suite was ready to read/write before interact with it
const success: Bool = await WidgetBridge.ensureUserDefaultsSuit("group.my.exampe.com");

// If suite has been ready, write to UserDefaults suite
const success: Bool = await WidgetBridge.setDict("MyDictA", {a: 1, b:2, foo: "bar"});
const dict: object = await WidgetBridge.getDict("MyDictA");
const success: Bool = await WidgetBridge.removeObject("MyDictA");

const success: Bool = await WidgetBridge.setString("MyStringB", "This is a test string");
const str: String = await WidgetBridge.getString("MyStringB");
const success: Bool = await WidgetBridge.removeObject("MyStringB");


// Reload widget timeline after your's UserDefaults data was changed
const myWidgetKind = "my_widget"
WidgetBridge.reloadWidget(myWidgetKind)
```

You can get the `myWidgetKind` by looking into your widget entry file:
```swift
@main
struct my_widget: Widget {
   let kind: String = "my_widget"
   ...
}
```

## Contributing

See the [contributing guide](CONTRIBUTING.md) to learn how to contribute to the repository and the development workflow.

## License

MIT
