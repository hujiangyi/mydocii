2012-04-13 23:29:36.893::WARN:  /dashboard/buildloop/listener  
com.thoughtworks.xstream.converters.ConversionException: Cannot construct
net.sourceforge.cruisecontrol.BuildLoopInformation as it does not have a no-
args constructor  
\---- Debugging information ----  
message             : Cannot construct
net.sourceforge.cruisecontrol.BuildLoopInformation as it does not have a no-
args constructor  
cause-exception     :
com.thoughtworks.xstream.converters.reflection.ObjectAccessException  
cause-message       : Cannot construct
net.sourceforge.cruisecontrol.BuildLoopInformation as it does not have a no-
args constructor  
class               : net.sourceforge.cruisecontrol.BuildLoopInformation  
required-type       : net.sourceforge.cruisecontrol.BuildLoopInformation  
path                : /buildloop  
line number         : 1  
\-------------------------------  
        at com.thoughtworks.xstream.core.TreeUnmarshaller.convert(TreeUnmarshaller.java:63)   
        at com.thoughtworks.xstream.core.AbstractReferenceUnmarshaller.convert(AbstractReferenceUnmarshaller.java:45)  
        at com.thoughtworks.xstream.core.TreeUnmarshaller.convertAnother(TreeUnmarshaller.java:46)   
        at com.thoughtworks.xstream.core.TreeUnmarshaller.start(TreeUnmarshaller.java:117)   
        at com.thoughtworks.xstream.core.ReferenceByXPathMarshallingStrategy.unmarshal(ReferenceByXPathMarshallingStrategy.java:29)  
        at com.thoughtworks.xstream.XStream.unmarshal(XStream.java:846)   
        at com.thoughtworks.xstream.XStream.unmarshal(XStream.java:833)   
        at com.thoughtworks.xstream.XStream.fromXML(XStream.java:781)   
        at com.thoughtworks.xstream.XStream.fromXML(XStream.java:773)   
  
求助google也没找到好的解决方案，同样版本的CuriseControl在windows下运行正常，在linux下却一直报错。比对windows和linu
x下的环境，发现linux装的jdk7,而windows装的是jdk6，为此在windows下装了jdk7，此时启动CruiseControl，发现会报上面
一样的错误，惊喜，马上把linux下的jdk7换成jdk6，启动CruiseControl，运行正常。  
  
上述错误可以通过加上参数-postenabled false来解决如：  
cruisecontrol -postenabled false  
-postenabled [true|false]  指定是否要build loop发布builds information到dashboard。默认为true。

