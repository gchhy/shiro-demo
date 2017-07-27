package Thread;

/**
 * Created by HY on 2017/7/5.
 */
public class Test {
    public static void main(String[] args) throws InterruptedException {
        for (int i=0;i<=10;i++){
            Mythread mt = new Mythread();
            mt.start();
        }

        Thread.sleep(6000);
        myRunner mr = new myRunner();
        for (int i=0;i<=10;i++){
            new Thread(mr).start();
        }
    }

}

class myRunner implements Runnable{
    private  int x = 0;
    @Override
    public void run() {
        System.out.println(++x);
    }
}
class Mythread extends  Thread{
    private  int x = 0;
    public void run() {
        System.out.println(++x);
    }
}