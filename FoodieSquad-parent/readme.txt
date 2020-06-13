1.SSM (Spring+SpringMVC+MyBatis)是由Spring、MyBatis两个开源框架整合而成(SpringMVC是Spring中的部分内容)。

2.Spring是一个轻量级的JAVA开发框架,主要解决业务逻辑层和其他层之间的松耦合问题,使用基本的Javabean来完成以往只有EJB完成的企业应用功能。
2.1 Spring
Spring的核心包括IoC (Inversion of Control,控制反转) 和
 AOP(Aspect Oriented Programming,面向切面编程),IoC促进了低耦合,一个对象依赖的其它对象会通过被动的方式传递进来,
 而不是这个对象自己创建或者查找依赖对象[4];AOP促进了高内聚,可以方便的实现对程序进行权限拦截、运行监控等功能。
2.2未使用spring之前，我们需要自己new对象，然后再调用类中的方法，但是当我们在项目中配置完spring，
就可以使用spring直接对对象进行管理，通过spring直接的获取对象。
Sping实现了解耦：即类与类之间的依赖性降低，控制反转(ioc)是解耦的目标，依赖注(Dl)入是实现目标的手段。
2.3 组件扫描与注解
在Spring的配置文件中可以配置<context:component-scan base-package=“包名.类名”/>用来开启组件扫描，
与组件扫描联合使用的是注解，注解，也叫元数据。它是JDK 1.5及以后版本引入的一个特性，与类、接口、枚举是在同一个层次。
它可以声明在包、类、字段、方法、局部变量、方法参数等的前面，用来对这些元素进行说明。注解是用来告诉编译器一些信息让编译器能够实现基本的编译检查。
2.4 Java反射
Java的动态机制,用于在运行期间检查对象的类型,检查对象的类结构(属性,方法等),还可以动态加载类,动态创建对象,
动态访问属性和方法,等。很多框架为了解决对未来的未知组件进行管理所以常使用反射API。


3.SpringMVC是Spring实现的一个Web层,实现了Web MVC设计模式,
请求驱动类型的轻量级Web框架,即使用了MVC架构模式的思想,将Web层进行职责解耦。
3.1 Spring MVC
Spring MVC是Spring的一个子模块,分离了控制器、模型对象、分派器以及处理程序对象的角色,这种分离让它们更容易进行定制。
前端控制器实际就是DispatcherServlet;
应用控制器其实拆为处理映射器(Handler Mapping)进行处理器管理和视图解析器(View Resolver)进行视图管理;
页面控制器/动作/处理器为Controller接口(仅包含ModelAndView handleRequest(request, response) 方法)的实现(也可以是任何的POJO类);
支持本地化(Locale)解析、主题(Theme)解析及文件上传等;
提供了非常灵活的数据验证、格式化和数据绑定机制;
提供了强大的约定大于配置(惯例优先原则)的契约式编程支持。
3.2在实际生活的应用中，解决了View->Controller与Controller->View的问题。
一个Servlet控制器只能对应一个请求路径，如果用Servlet来做控制器会有很多Servlet类，这样一来不方便后端开发人员的管理，
对于后期功能的改变，及用户的体验都会产生影响。而Spring Mvc很好的解决了这个问题。当多个浏览器同时发送请求到服务器时，
会先经过Dispatcher Servlet，由它对请求进行分配给谁处理，响应结果也经过Dispatcher Servlet转发，或重定向到相应到jsp页面，呈现给对应的用户。

4.Mybatis是一个持久层的框架,在使用上相比Hibernate更加灵活,可以控制SQL的编写,使用 XML或注解进行相关的配置。
4.1 MyBatis
MyBatis是支持定制化 SQL、存储过程以及高级映射的优秀的基于Java的持久层框架。
使用MyBatis,程序员无需书写JDBC代码,不用进行参数的手工设置以及结果集的检索,
只通过XML文件或注解用于配置以及原始映射,就能够将接口和Java的POJOs(Plain Old Java Objects,简单的Java对象)映射成数据库中的记录。
4.2Mybatis的使用可见的效果是，极大的简化了持久层的开发。
只需要在接口中写好增删改查的方法，通过Mapper.xml中的配置<mapper namespace=“包名.类名”></mapper>,
再在Mapper.xml文件中写SQL语句的增删改即可。

5.本系统基于SSM+mysql搭建，dao层使用了spring+mybtais实现数据库的持久性，pojo层则为普通的实体类，
service层使用了spring的IOC(控制反转)和DI(依赖注入),web层则使用了spring+springmvc,通过spring自动装配service层的bean,
通过springmvc注册controller和视图解析器，在web.xml中配置dispatcher-servlet，实现视图层请求的控制和转发。


此层为根目录，分为web层，pojo层，dao层，service层四个模块
1./FoodieSquad-webb 为web层文件夹，存放Controller，Exception和view的前端页面等文件。
2./FoodieSquad-service 为service层文件夹，存放Service文件，负责数据库与前端的逻辑交互功能。
3./FoodieSquad-pojo 为pojo层文件夹，存放实体类。
4./FoodieSquad-dao 为dao层文件夹，存放mapper.xml文件和dao接口，负责连接数据库和sql语句的编写与执行。
5./pom.xml 主要描述了项目的maven坐标，依赖关系，开发者需要遵循的规则，缺陷管理系统，组织和licenses，以及其他所有的项目相关因素，是项目级别的配置文件。
6./.project是项目文件，项目的结构都在其中定义，比如lib的位置,src的位置,classes的位置
7..settings目录下的配置比较杂，各种后缀名的都可以见到，绝大多数是文本文件，格式为properties（多数以.prefs为后缀名）或XML（多数以.*、.xml为文件名）格式的为主
8./src 文件夹为maven生成时自带的空文件夹，项目文件都在各个子模块中