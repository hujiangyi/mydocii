**语法（SYNTAX）：**

<uses-
libraryandroid:_[name](http://developer.android.com/guide/topics/manifest
/uses-library-element.html#nm)_="_string_"  
              android:_[required](http://developer.android.com/guide/topics/manifest/uses-library-element.html#rq)_=["true" | "false"] />

**被包含于（CONTAINED IN）：**

<application>

**说明（DESCRIPTION）：**

这个元素用于指定该应用程序必须链接的共享类库。这个元素告诉系统该应用程序包的类装载器中所包含的类库代码。

Android的所有包（如andorid.app，android.content，android.view和android.widget等）都在应用程序自动
链接的默认类库中。但是，有些包是在于独立的类库中，它们不能被自动的链接到应用程序包中，要查看这些包的文档，以确定要把哪些类库包含到包的代码中。

这个元素也会影响该应用程序在特殊设备上的安装，以及应用程序在Google Play上的可用性。

安装（Installation）

如果在该应用的清单中出现这个元素，并且它的android:required属性被设置为true，那么除非该类库在用户的设备上存在，否则PackageMana
ger框架不会让用户安装这个应用程序。

Google Play

Google Play会基于要安装在用户设备上的类库来过滤应用程序。有关过滤的更多信息，请看Filters on Google
Play（_<http://developer.android.com/guide/appendix/market-filters.html>_）

**属性（ATTRIBUTES）：**

**android:name**

这个属性用于指定类库的名称。这个名称是在对应的类库文档中提供的。例如：android.test.runner库就是包含Android测试类的一个程序包。

**android:required**

这个属性用于指定应用程序是否需要有android:name属性所指定的类库：

true：没有这个库应用程序无法工作。如果用户设备设备上没有这个类库，系统不允许该应用程序安装在这个设备上。

false：如果该类库存在，则应用程序能够使用这个类库，但是如果有必要，也可以设计成没有该类库，应用程序也能够工作。系统会允许应用程序安装，即使该类库不存在
。如果使用false，就要在运行时对类库的有效性进行必要的检查。

对于类库的检查，可以使用反射机制来判断一个具体的类是否有效。

默认值是true。

这个属性在API Level 7中被引入。

**被包含于（INTRODUCED IN）：**

API Level 1

