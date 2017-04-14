**语法（SYNTAX）：**

<uses-configurationandroid:_[reqFiveWayNav](http://developer.android.com/guide
/topics/manifest/uses-configuration-element.html#five)_=["true" | "false"]  
                    android:_[reqHardKeyboard](http://developer.android.com/guide/topics/manifest/uses-configuration-element.html#hard)_=["true" | "false"]  
                    android:_[reqKeyboardType](http://developer.android.com/guide/topics/manifest/uses-configuration-element.html#kbd)_=["undefined" | "nokeys" | "qwerty" | "twelvekey"]  
                    android:_[reqNavigation](http://developer.android.com/guide/topics/manifest/uses-configuration-element.html#nav)_=["undefined" | "nonav" | "dpad" | "trackball" | "wheel"]  
                    android:_[reqTouchScreen](http://developer.android.com/guide/topics/manifest/uses-configuration-element.html#touch)_=["undefined" | "notouch" | "stylus" | "finger"] />

**被包含于（CONTAINED IN）：**

<manifest>

**说明（DESCRIPTION）：**

这个属性用于指定该应用程序所需要的硬件和软件功能。例如，应用程序可以用这个元素指定它所需要的物理键盘或特殊的导航设备，如轨迹球。使用这个规范可以避免把应用程
序安装在那些不支持其不能工作的设备上。

如果应用程序能够用不同的设备配置来工作，那么它就应该给每个配置包含一个独立的<uses-configuration>声明。每个声明必须被完成。例如，应用程序
需要一个五向导航控制，就要需要一个支持手指操作的触屏，以及一个标准的QWERTY键盘或12键的数字键盘，因此要用两个<uses-
configuration>元素来指定这些需求：

<uses-configurationandroid:reqFiveWayNav="true"android:reqTouchScreen="finger"  
                    android:reqKeyboardType="qwerty"/>  
<uses-configurationandroid:reqFiveWayNav="true"android:reqTouchScreen="finger"  
                    android:reqKeyboardType="twelvekey"/>



**属性（ATTRIBUTES）：**

**android:reqFiveWayNav**

这个属性用于指定应用程序是否需要五向导航控制，如果设置为true，则需要，否则不需要。五向控制是指能够上、下、左、右移动所选择的对象，并提供调用当前选择对象
的方法。它可以是一个D-pad(方向板)、轨迹球等。

如果应用程序需要一个方向控制，但不是一种特殊类型的控制，就可以把这个属性设置为true，并且忽略reqNavigation属性。但是，如果应用程序需要一种特
殊的方向控制类型，那么就可以忽略这个属性，并用reqNavigation属性的设置来代替。

**android:reqHardKeyboard**

这个属性用于指定应用程序是否需要硬键盘，如果设置为true，则需要，否则不需要。

**android:reqKeyboardType**

这个属性用于指定该应用程序需要的任何键盘的类型。这个属性不区分软/硬键盘。如果需要某种类型的硬键盘，就用这个属性来指定类型，并把reqHardKeyboar
d属性设置为true。

它的属性值必须是下表中值之一：

值

说明

undefined

应用程序不需要键盘。（键盘的需求没有被定义。）这是默认值。

nokeys

应用程序不需要键盘，明确定义该应用不需要键盘

qwerty

应用程序需要一个标准的QWERTY键盘。

twelvekey

应用程序需要一个像大多电话那样的12键的数字键盘，键盘中包括0~9的数字和“*”号键、“#”号键。

**android:reqNavigation**

这个属性定义了应用程序所需要的任何导航设备，属性值必须是下表中的值之一：

值

说明

undefined

应用程序不需要任何类型的导航控制。（应用程序的导航需求没有被定义。）这是默认值。

nonav

应用程序不需要到导航控制。

dpad

应用程序要求使用D-pad(方向板)来进行导航控制

trackball

应用程序要求使用轨迹球来进行导航控制

wheel

应用程序要求使用一个导航滚轮来进行导航控制。

如果应用程序要求一个导航控制，但并不关心具体的控制类型，那么就要把reqFiveWayNav属性设置为true，而不是只设置这一个属性。

**android:reqTouchScreen**

这个属性用于设置应用程序所需要的任何触屏类型。属性值必须是下表中的字符串之一：

值

说明

undefined

应用程序不需要触屏。（触屏的需求不被定义。）这是默认值。

notouch

应用程序不需要触屏

stylus

应用程序需要带有触控笔操作的触屏。

finger

应用程序需要能够用一个手指进行操作的触屏。

**被引入的版本（INTRODUCED IN）**

API Level 3



