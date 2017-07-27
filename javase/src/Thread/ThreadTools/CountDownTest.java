package Thread.ThreadTools;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;

class TaskTest implements Runnable {

    private CountDownLatch latch;
    private int sleepTime;

    /**
     *
     */
    public TaskTest(int sleepTime, CountDownLatch latch) {
        this.sleepTime = sleepTime;
        this.latch = latch;
    }

    /**
     * @see java.lang.Runnable#run()
     */
    @Override
    public void run() {
        try {
            CountDownLatchTest.print(" is running。");
            TimeUnit.MILLISECONDS.sleep(sleepTime);
            CountDownLatchTest.print(" finished。");
            //计数器减减
            latch.countDown();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

}

