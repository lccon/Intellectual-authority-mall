package com.mall.utils;

import java.io.FileWriter;
import java.io.IOException;

public class AlipayConfig {
        //↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
        // 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
        public static String app_id = "2021001141641994";
        // 商户私钥，您的PKCS8格式RSA2私钥
        public static String merchant_private_key ="MIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQDFxZoGuJqG+ql7XO8w03de67z7kPeyUAOvTMsVeS+6qfZpaXR13PXGZtJGuka5JOX/9Tp24JIX4G1TPFmVUpaTqEDgRZov6KSapS1eOMPzVMLClr2d0chVZ/sWlfQpIeSOvALDb3j9AbvnMo6GEbnfFDDlVu719WJaf6l+y7kcYjhyX1A+YlijndED12zLN7N60VpSAxvvZ6mj7L5AZh5SjqaeMRYYG7chC2OVs7hCGcFyRtiR1VCsoD9jUZ59IDk6gBKAsyF7c2ncCnPnsE2/wfD33c74Kq0PKayr5By4Zt6QyVlNXkHB+66K2ycRTu3gtcV0FmceStmtAFgBws7xAgMBAAECggEBALiTTsjvCOjoj7xeY62B7mpcQKfYCBQWsRmt5etIis7/SMXgcZx+d7KOy7jOqKqqUS2sxL+lnzNBdUa1kDXYOkfcQ5AL5XbI/LaHaewBtn8moA3TeWwNGZb70E6n7JNm2lSMC1gydQxLzf5cJL/jU0FrKqcfly1dskkb1ChOIZjmO+Y8LmqY3GjqTvD/CUzQtzo6fjJEA5nJMT2dUgJK/X2gv37nNsGrrIMIzJ9+7lbfnUFyjSlreqWuH9b0dpSvEqS+SPwL5yilAl9hydxt99sdajpLmLZ54rGm81P8jR98/E9hZm49mFBFt1Xn48Gl5eFA4wuDcp8/8tYk3RiXlwECgYEA+Wgfp+azZn+Gm1w+QP9dyOdUl4gW0WAqnDQ3EyGNvuny/+WliVHT297FqeYEQ3n13fUfnHFtrspaYgrVH6Vh4XL3oeeAvpx0kd+wimLK0PrKlQmMs9PbwvSbtWn7QEMswyMhMHDMIBXP4y1IlhjfPd3+cvAKYN3nJfRJ3yEgKskCgYEAywAJKPm22ijAEZh43cvo5m214eRZY+YxRTEZ3sEJSxkf/baO6HdQ2r7K/fmi14SP0qzzviCaYG9exSp2LWfM6UAWWn1IzpG7JMdyO6D03zlM2q9ThWCI3rRWqdBiKwtK1UdCtohoyP/wXMUw9EbdcwG7xkAuhT58o4GzQsuN7ukCgYEAx1FOUymM3/I0if6bBejPc5pkQUGSMrvu8azNAu4C0Ls45wcJVwfdD08mmtPnPmG+eybFn4oKxPCUcNwFXOgXpEvz2SEhA7QXeOjStpWjToXO1nKuTpyWeWRw9/d9wuqsYDq38HWEvHOSExUCeGniJxg9nG93a9iLPQrQ6pAXm/kCgYBsUOuSUpQPmfjKKrorVrdB5L5M9wP/ev9FNSrhocyspo5cWUGtpqSc43r6w23xY0k+l4xDIbBdzm8Z80s1dRJwTwLea8Uie74IpOc+C+c9CJ0Kfsyo+VZuxnkLiSYoY5EddjWRof2Paok9ZvZ1ES7uQ7mG0g5AiJQGxpj5BhYIqQKBgQCRIhJ6HOJNf+QDeb1DTOdbNuYrTUtmV7Oz+0xD3IqASot9w9gOFSRvhYDSLLauH/D9hrxop4rUdq3dwNim1e2zO1w1wTZp8UZZ6tXhZeQ0WOyNbnUvtNUmG22LwhoOXKCH3JqFsABBis7mHsw7um+VF6Q3tvEym0BDSyIcjCvG+g==";
        // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
        public static String alipay_public_key ="MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAgeyeSRonvZ/C/6K55ka7ilXMSpIb/K97QnSpF5NRljE+8sNawYzzBbjnZ8audQp2VPvTfXTU9FAX+1gcFahnG6EvXzaUoyTQCro2FaGKhFAfwWGt02oLA8/9HTa6nXjORp76OMQTYbQ0aQm8lQioGXK18fzLixpZUBDqS9cKfvWueXijiZBDAPqlBPyH45NzJ2UMEz1qPGIjo7eWSU/6mVNs0KBdRXXsQk18tzcGpGFD/991Vxsog+O6w0GoK8tLaC/uYr0/8r6gVAgt9qmz0Fgi42egG2LGcLvihjvnCFajKgtMX4KuIaBR0/8S9LFr5QXwdCwypdxwx7ze+Odi1QIDAQAB";
    // 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
        public static String notify_url = "https://www.ktxip.com/goAlipayNotifyNotice";
        // 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
        public static String return_url = "https://www.ktxip.com/goAlipayReturnNotice";
        // 签名方式
        public static String sign_type = "RSA2";
        // 字符编码格式
        public static String charset = "utf-8";
        // 支付宝网关
        public static String gatewayUrl = "https://openapi.alipay.com/gateway.do";
        // 支付宝网关
        public static String log_path = "C:\\";
//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑
        /**
         * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
         * @param sWord 要写入日志里的文本内容
         */
        public static void logResult(String sWord) {
            FileWriter writer = null;
            try {
                writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
                writer.write(sWord);
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (writer != null) {
                    try {
                        writer.close();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }
        }
    }
