package com.mall.utils;

import com.mall.quartz.DurTimeScheduler;
import org.quartz.*;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Description:
 *
 * @Date:2020/1/21
 * @Author:lc
 */
public class quartzUtil {
    public static final Logger logger = LoggerFactory.getLogger(quartzUtil.class);

    private static quartzUtil jobUtil = new quartzUtil();

    public static Scheduler scheduler = null;

    private quartzUtil() {
        logger.info("SchedulerMain is created");
    }

    public static quartzUtil getInstance() {
        if (scheduler == null){
            synchronized (quartzUtil.class){
                if (scheduler == null){
                    scheduler = SpringUtil.getBean(Scheduler.class);
                }
            }
        }
        return jobUtil;
    }

    public void addSchedulerJob(String quartzName,
                                String quartzGroup, String cronExpression) throws Exception {

        Trigger triggerCon = scheduler.getTrigger(TriggerKey.triggerKey(quartzName, quartzGroup));
        JobDetail job = scheduler.getJobDetail(JobKey.jobKey(quartzName, quartzGroup));

        if (triggerCon == null || job == null) {
            JobDetail jobDetail = JobBuilder.newJob(DurTimeScheduler.class).withIdentity(quartzName, quartzGroup)
                    .storeDurably(false).build();
            Trigger trigger = TriggerBuilder.newTrigger().forJob(jobDetail).withIdentity(quartzName, quartzGroup)
                    .withSchedule(CronScheduleBuilder.cronSchedule(cronExpression)).build();

            scheduler.scheduleJob(jobDetail, trigger);
            scheduler.start();
        }
    }
}
