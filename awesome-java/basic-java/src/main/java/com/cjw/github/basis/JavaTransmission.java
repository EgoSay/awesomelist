package com.cjw.github.basis;

import com.cjw.github.basis.entity.Person;

/**
 * 测试 值传递与引用传递
 * 值传递：在方法被调用时，实参通过形参把它的内容副本传入方法内部，此时形参接收到的内容是实参值的一个拷贝，
 * 因此在方法内对形参的任何操作，都仅仅是对这个副本的操作，不影响原始值的内容.
 *
 * 引用传递：”引用”也就是指向真实内容的地址值，在方法调用时，实参的地址通过方法调用被传递给相应的形参，
 * 在方法体内，形参和实参指向通愉快内存地址，对形参的操作会影响的真实内容。
 *
 * 参考链接:  https://juejin.im/post/5bce68226fb9a05ce46a0476
 *
 * @author Ego
 * @version 1.0
 * @date 2020/2/26 11:28
 * @since JDK1.8
 */
public class JavaTransmission {

    /**
     * 测试基本数据类型的传递
     * @param value1
     */
    public static void transferValue(int value1) {
        System.out.println("传入的value1："+ value1);
        value1 = 33;
        System.out.println("方法内重新赋值后的value1："+ value1);


    }

    /**
     * 测试包装类传递
     * @param value2
     */
    public static void transferValue2(Integer value2) {

        System.out.println("传入的value1："+ value2);
        value2 = new Integer(20);
        System.out.println("方法内重新赋值后的value2："+ value2);
    }

    /**
     * 测试对象的传递
     * @param p1
     * @param p2
     */
    public static void transferValue3(Person p1, Person p2) {
        System.out.println("传入的Person1 name："+ p1.getName());
        System.out.println("传入的Person2 name："+ p2.getName());

        p1.setName("我是张二");
        // 注意这里初始化了一个新对象
        p2 = new Person();
        p2.setName("李二");

        // p1依旧是指向旧的对象，p2指向新对象的地址
        System.out.println("方法内重新赋值后的Person1 name："+ p1.getName());
        System.out.println("方法内重新赋值后的Person2 name："+ p2.getName());

    }

    public static void main(String[] args) {
        int value1 = 10;

        // Integer默认 -128～127的数会从缓存中(常量池)加载
        Integer value2 = 666;

        Person p1 = new Person();
        p1.setName("我是张大");

        Person p2 = new Person();
        p2.setName("我是李大");

        System.out.println("================测试基本数据类型的传递==================");
        transferValue(value1);
        System.out.println("方法执行后的int类型Value1:" + value1);
        System.out.println("================测试包装类型的传递==================");
        transferValue2(value2);
        System.out.println("方法执行后的包装类型Value2:" + value2);
        System.out.println("================测试对象型的传递==================");
        transferValue3(p1, p2);
        // p1的 name 会发生改变，p2却不会，因为执行方法内部传入的参数 p2已经指向了新对象地址，所以其内容修改不会影响原有对象内容
        System.out.println("方法执行后的Person1 name："+ p1.getName());
        System.out.println("方法执行后的Person2 name："+ p2.getName());

    }
}
