**语法（SYNTAX）：**

< supports-screensandroid:_[resizeable](http://developer.android.com/guide/top
ics/manifest/supports-screens-element.html#resizeable)_=["true"|"false"]  
                  android:_[smallScreens](http://developer.android.com/guide/topics/manifest/supports-screens-element.html#small)_=["true" | "false"]  
                  android:_[normalScreens](http://developer.android.com/guide/topics/manifest/supports-screens-element.html#normal)_=["true" | "false"]  
                  android:_[largeScreens](http://developer.android.com/guide/topics/manifest/supports-screens-element.html#large)_=["true" | "false"]  
                  android:_[xlargeScreens](http://developer.android.com/guide/topics/manifest/supports-screens-element.html#xlarge)_=["true" | "false"]  
                  android:_[anyDensity](http://developer.android.com/guide/topics/manifest/supports-screens-element.html#any)_=["true" | "false"]  
                  android:_[requiresSmallestWidthDp](http://developer.android.com/guide/topics/manifest/supports-screens-element.html#requiresSmallest)_="_integer_"  
                  android:_[compatibleWidthLimitDp](http://developer.android.com/guide/topics/manifest/supports-screens-element.html#compatibleWidth)_="_integer_"  
                  android:_[largestWidthLimitDp](http://developer.android.com/guide/topics/manifest/supports-screens-element.html#largestWidth)_="_integer_"/>

**被包含于（CONTAINED IN）：**

< manifest>

**说明（DESCRIPTION）：**

这个元素用于指定应用程序所支持的屏幕尺寸，并针对比应用程序所支持的屏幕还要大屏幕，启用屏幕兼容模式。在应用程序中使用这个元素指定应用程序所支持的屏幕尺寸是至
关重要的。

如果应用程序调整尺寸属性来填充整个屏幕，那么应用程序就要支持这个给定的尺寸。通常对于大多数应用程序，系统可以很好的完成这种调整工作，并且为了让应用程序在比一
个手持设备大的屏幕上工作，你不需要做任何额外的工作。但是，针对不同的屏幕尺寸，通过提供可选的布局资源来优化应用程序的UI经常是很重要的。例如，一个运行在手持
设备上的Activity布局，如果想要运行在平板电脑上，就需要修改这个Activity的布局。

但是，如果为了适应不同的屏幕尺寸而调整了尺寸，但应用程序也不能很好的工作，就可以使用< supports-screens>元素的属性来控制应用程序是否应该发
布给屏幕较小的设备，或者使用系统的屏幕兼容模式，让UI放大以适应较大屏幕的要求。在没有针对较大屏幕尺寸的设计，并且普通的尺寸不能达到合适结果时，屏幕的兼容模
式会通过模拟普通尺寸的屏幕和中等密度来缩放UI，以便它能够填充整个屏幕，这样会导致UI模糊，因此针对大屏幕的优化是比较好的。

注意：Android3.2引入了新的属性：android:requiresSmallestWidthDp、android:compatibleWidthLi
mitDp和android:largestWidthLimitDp。如果正在开发Android3.2或更高版本的应用程序，应该使用这些属性来声明应用程序所支
持的屏幕尺寸，而不是基于一般的屏幕尺寸属性。

有关如何正确的支持不同的屏幕尺寸，以便避免给应用程序使用屏幕兼容模式的更多信息，请阅读“Supporting Multiple Screens”

（_<http://developer.android.com/guide/practices/screens_support.html>_）

**属性（ATTRIBUTES）：**

**android:resizeable**

这个属性用于指示针对不同的屏幕尺寸，应用程序是否可以调整尺寸。默认值是true。如果这个属性设置了false，在大的屏幕上，系统会在屏幕兼容模式中运行该应用
程序。

这个属性被废弃了，引入这个属性主要是为了帮助应用程序从1.5过渡到1.6。当多屏幕支持被引入时，就不应该在使用它了。

**android:smallScreens**

这个属性用于指定应用程序是否支持较小外形的屏幕。一个small类型的屏幕被定义成一个比normal（传统的HVGA）类型的屏幕还要小的屏幕。外部服务（如Go
ogle Play）不会把不支持小屏的应用程序提供给小屏设备，因为很少有能够确保该应用程序在小屏幕的设备上正常工作的平台。这个属性的默认值是true。

**android:normalScreens**

这个属性用于指示应用程序是否支持普通外形的屏幕。典型的是HVGA中等密度的屏幕，但是WQVGA低密度和WVGA高密度屏幕也被认为是普通屏幕。这个属性的默认值
是true。

**android:largeScreens**

这个属性用于指示应用程序是否支持较大外形的屏幕。一个large类型的屏幕被定义成一个比normal类型的手持设备的屏幕明显还要大的屏幕，并且为了让应用程序能
够良好的使用，使用这个属性时要特别小心，尽管可以依赖系统来调整尺寸，以便能够填充屏幕。

这个属性的默认值实际上在某些版本之间是不同的，因此最好在任何时候都明确的声明这个属性。如果设置为false，系统会启用屏幕兼容模式，这时要格外的小心。

**android:xlargeScreens**

这个属性用于指示应用程序是否支持超大外形的屏幕。一个xlarge屏幕被定义成一个比large屏幕还要大的屏幕，如平板电脑，为了能够让应用程序良好的使用，需要
特别小心的使用这个属性，尽管可以依赖系统来UI的尺寸来填充屏幕。

**android:anyDensity**

这个属性指明应用程序是否包含了能够适用于任何屏幕密度的资源。

对于支持Android1.6（API Level 4）和更高版本的应用程序，这个属性的默认值是true，并且除非绝对的确认这是应用程序正常工作所必须的，否则
不应该把它设置为false。只是在应用程序直接操作位图时才需要禁止这个属性。

**android:requiresSmallestWidthDp**

这个属性用于指定smallestWidth的最小需求。smallestWidth是屏幕空间的最短尺寸（以dp为单位），它必须是对应用程序的UI是有效的。也就
是说它是有效的屏幕的两个维度的尺寸中最短的那个。因此为了考虑设备跟应用程序的兼容性，设备的smallestWidth的值必须要大于等于这个属性所设置的值。通
常这个属性值是针对布局所支持的最小宽度，而不是屏幕当前的方向。

例如，典型的手持设备屏幕smallestWidth是320dp；7英寸的平板电脑的smallestWidth是600dp；10英寸的平板电脑的smalles
tWidth是720dp。这些值一般都是最小的宽度，因为它们是屏幕可用空间中最短的那个尺寸。

这对这个尺寸值的比较，需要考虑屏幕的装饰和系统UI部分。例如，如果系统有一些固定的UI元素要显示，那么系统声明的设备的最小宽度（smallestWidth）
要比实际的屏幕尺寸要小，因为被系统UI占用的屏幕像素对于应用的UI是无效的。因此，这个值应该是应用布局所使用的最小宽度需求，而不管屏幕的当前方向。

如果应用程序能够针对较小屏幕尺寸进行正确的调整（small尺寸或最小宽度是320dp以下的屏幕），那么就不需要这个属性。否则就应该使用这个属性值跟应用程序所
使用的最小屏幕宽度限定符的值（sw<N>dp）相匹配。

警告：Android系统不会关注这个属性，因此它不会影响应用程序在运行时的行为。相反，它被服务（如Google
Play）用于过滤应用程序。但是，当前Google
Play不支持用这个属性来过滤（在Android3.2上），因此如果应用程序不支持小屏幕设备，就应该继续使用其他的尺寸属性。  
这个属性在API Level 13中被引入。

**android:compatibleWidthLimitDp**

这个属性允许在设计应用程序时，通过指定最大的“smallest screen width”来启用屏幕兼容模式，作为一个用户可选的功能。如果设备的有效屏幕的最
小边比这个属性值大，那么用户依然能够安装该应用程序，但是在运行时要使用屏幕兼容模式。默认情况下，屏幕兼容模式似乎被禁止的，并且通过会调整布局的尺寸来填充屏幕
，但是在系统栏中会有一个按钮，让用户选择屏幕兼容模式的打开和关闭。

如果应用程序跟所有的屏幕尺寸都兼容，并且它的布局能够被正确的调整尺寸，就不需要使用这个属性。

注意：当前，屏幕兼容模式只能模拟320dp宽度的手持设备屏幕，因此如果android:compatibleWidthLimitDp的值比320大，那么屏幕兼
容模式就不被适用。

这个在API Level 13中被引入。

**android:largestWidthLimitDp**

这个属性允许再设计应用程序时，通过指定最大的“smallest screen
width”来强制启用屏幕兼容模式。如果设备有效屏幕的最小边比这个属性值大，应用程序就会运行在屏幕兼容模式中，而用户没有办法禁止这种模式。

如果应用程序跟所有的屏幕尺寸都兼容，并且能够被正确的调整尺寸，就不需使用这个属性。否则首先要考虑使用android:compatibleWidthLimit
Dp属性。只有在因大屏幕尺寸调整而导致破坏了应用程序的功能的时候，并且使用屏幕兼容模式是唯一的方法的时候，才应该使用这个属性。

注意：当前，屏幕兼容模式只能模拟320dp宽度的手持设备屏幕，因此如果android:compatibleWidthLimitDp的值比320大，那么屏幕兼
容模式就不被适用。

这个在API Level 13中被引入。

**被引入的版本（INTRODUCED IN）：**

API Level 4



