/**
 * 测试类加载
 * @author Ego
 * @version 1.0
 * @date 2020/2/17 15:08
 * @since JDK1.8
 */

public class ClassLoadDemo1{
    /**
     * 测试 类初始化的被动引用
     * @param args
     */
    public static void main(String[] args) {

        // 通过子类引用父类的静态字段，不会导致子类初始化，只会初始化父类
        int x = SubClass.x;
        // 常量在编译阶段会存入调用类的常量池中，本质没有直接引用到定义的常量类中，因此不会触发定义的常量类初始化
        int superValue = SuperClass.value;
    }
}


class SuperClass {

    private static SuperClass instance = new SuperClass();
    static {
        System.out.println("SuperClass init ...");
    }

    /**
     * 常量在编译阶段会存入调用类的常量池中，本质没有直接引用到定义的常量类中，因此不会触发定义的常量类初始化
     */
    public static final int value = 10;
    public static int x = 0;
    public static int y;

    SuperClass () {
        x ++;
        y ++;
    }

    public static SuperClass getInstance() {
        return instance;
    }

    public static void main(String[] args) {
        /**
         * (1).执行链接过程，初始化所有的类变量：
         * instance -> null
         * x -> 0
         * y -> 0
         *
         * (2).执行初始化过程：
         * new Singleton() 调用构造方法
         * 之后 x -> 1 y -> 1
         * 再执行 x = 0 赋值
         * 最终
         * x -> 0
         * y -> 1
         */
        SuperClass superClass = getInstance();
        System.out.println(x);
        System.out.println(y);
    }

}

class SubClass extends SuperClass {
    static {
        System.out.println("SubClass init ...");
    }

    public SubClass() {
        super();
    }
}


