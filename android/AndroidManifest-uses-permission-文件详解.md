**语法（SYNTAX）：**

<uses-
permissionandroid:_[name](http://developer.android.com/guide/topics/manifest
/uses-permission-element.html#nm)_="_string_"/>

**被包含于（CONTAINED IN）：**

<manifest>

**说明（DESCRIPTION）：**

这个属性用于给应用程序授予正确的操作的所必须的权限。这些权限是在应用程序安装时被授予的，而不是在运行时授予的。

有关更多的权限信息，请看《_[AndroidManifest.xml文件详解（三）](http://blog.csdn.net/fireofstar/art
icle/details/7543067)_》文档中“权限”介绍（_<http://blog.csdn.net/fireofstar/article/det
ails/7543067>_）和《Android的安全性和权限》（_<http://blog.csdn.net/fireofstar/article/det
ails/7536803>_）。在android.Manifest.permission类中能够找到由基础平台定义的一个权限列表（_<http://deve
loper.android.com/reference/android/Manifest.permission.html>_）。

**属性（ATTRIBUTES）：**

**android:name**

这个属性用于定义权限的名称。它能够是由该应用程序用<permission>元素定义的一个权限，也可以是由另外一个应用程序所定义的权限，还可以是有系统定义的标
准的权限，如：android:permission.CAMERA或android:permission.READ_CONTACTS等。就像例子中所显示的那样
，权限名通常要用包名做为前缀，以保证其唯一性。

**被引入的版本（INTRODUCED IN）：**

API Level 1



