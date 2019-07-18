# JKJSBridge
一个iOS上用于WKWebView和JavaScript通信的Bridge。

## 安装
### 使用CocoaPods安装
将其添加到您的[Podfile](https://guides.cocoapods.org/using/getting-started.html)文件中并运行pod install以安装。

```
pod 'JKJSBridge'
```

## Exaple

下载并运行[JKMicroWebView](https://github.com/jokerwking/JKMicroWebView.git) 项目，以查看示例。

## 用法

1. 导入头文件，并声明一个属性：

   ```objective-c
   #import <JKJSBridge/JKMicroJSBridge.h>
   ```

   ```objective-c
   @property (nonatomic, strong) JKMicroJSBridge *bridge;
   ```

2. 使用WKWebView实例化JKMicroJSBridge：

   ```objective-c
   self.bridge = [JKMicroJSBridge bridgeForWebView:self.webView];
   ```

3. 注册一个JS调用ObjC的函数：

   ```objective-c
   [self.bridge registerHandler:@"jsToOcFunction2" handler:^(NSDictionary *params, JKJSCallback callback) {
   	NSLog(@"%@", params);
   	callback(@{@"data": @"OC callback JS"});
   }];
   ```

4. ObjC调用JS函数：

   ```objective-c
   [self.bridge callHandler:@"changeColor" data:@"oc 传给 js 的数据" responseCallback:^(NSDictionary *response) {
   	NSLog(@"%@", response);
   }];
   ```

5. 在JS中使用如下函数调用ObjC：

   ```javascript
   window.JKMicroJSBridge.callHandler('jsToOcFunction2',{'data':'我是参数'},function(response) {
   	alert(response)
   })
   ```

6. 在JS中注册如下方法供ObjC调用，调用后可回调数据ObjC：

   ```javascript
   window.JKMicroJSBridge.registerHandler('changeColor', function(data, responseCallback) {
   //dosomething
   	var responseData = { 'Javascript Says':'Right back atcha!' }
     //回调给ObjC的数据
   	responseCallback(responseData)
   })
   ```

## API介绍

```objective-c
/**
 注册原生函数，供js调用

 @param handlerName 函数名
 @param handler 原生处理方法
 */
- (void)registerHandler:(NSString *)handlerName handler:(JKJSHandle)handler;
/**
 移除注册的原生函数,移除之后js将不能在调用到这个OC方法了，需要重新注册之后才能调用

 @param handlerName 函数名
 */
- (void)removeHandler:(NSString *)handlerName;
/**
 oc调用js

 @param handlerName js函数名
 */
- (void)callHandler:(NSString *)handlerName;
/**
 co调用js

 @param handlerName js函数名
 @param data 传递给js的数据
 */
- (void)callHandler:(NSString *)handlerName data:(id)data;
/**
 oc调用js

 @param handlerName 函数名
 @param data 传递给js的数据
 @param responseCallback JS回调给原生
 */
- (void)callHandler:(NSString *)handlerName data:(id)data responseCallback:(JKJSCallback)responseCallback;
```

最后感谢[WebViewJavascriptBridge](https://github.com/marcuswestin/WebViewJavascriptBridge.git) 
