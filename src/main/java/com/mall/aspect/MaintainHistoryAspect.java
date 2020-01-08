package com.mall.aspect;

import com.mall.base.BaseDomain;
import com.mall.component.ThreadVariable;
import com.mall.domain.Session;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import java.util.Date;

@Aspect
@Repository("maintainHistoryAspect")
public class MaintainHistoryAspect {
  final static Logger logger = LoggerFactory.getLogger(MaintainHistoryAspect.class);

  @Before("execution(public * com.mall..*.*Mapper.add*(..)) &&  args(baseDomain,..)")
  public void appendCreateInfo(BaseDomain baseDomain) {
    Session session = ThreadVariable.getSession();
    baseDomain.setCreateUser(session.getUserName());
    baseDomain.setCreateDate(new Date());
    baseDomain.setUpdateUser(session.getUserName());
    baseDomain.setUpdateDate(new Date());
  }

  @Before("execution(public * com.mall..*.*Mapper.update*(..)) &&  args(baseDomain,..)")
  public void appendUpdateInfo(BaseDomain baseDomain) {
    Session session = ThreadVariable.getSession();
    baseDomain.setUpdateUser(session.getUserName());
    baseDomain.setUpdateDate(new Date());
  }

}
