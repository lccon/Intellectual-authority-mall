package com.mall.utils;

import java.io.FileWriter;
import java.io.IOException;

public class AlipayConfig {
        //↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
        // 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
        public static String app_id = "2016102000727033";
        // 商户私钥，您的PKCS8格式RSA2私钥
        public static String merchant_private_key = "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCvRU5JISZVqRgMvhReNet2ghKRpatr7eXkneA1TJZDM75nV5lvwomSPAu0c1pwAzmZzlJX3SvjyvYYi48q0Pd/LLcJTLCUrUgRy762C4j/BNuyHgz0azJ/gVtAD4lTFeHp95NtsHzoTNlkdu89gNgJYBYVQc3GsWt1vmmFq8YJI5dwUIl2J/RYlJNBMRqe9NeDa4Xnv3s1oNizBj6j7JXsN9aBqvTErhDzCgauYL7224D49PEZE+f9Dba4PPWcpKWNzB8RRnAvLj3axd3mxBocyzw/7XgO5rZZsplpfofesoxGjuEEJEkbfxgj4YBF65YFMnTKAlsn8hgP6+Mj6UBFAgMBAAECggEAH1HUJm89CWuY95Xzz8300I13wf0Hv9aYER1BFmUkKMgTSyY1LepmaPI/6TP/wiphXaGnxzmngSIgjcxKfg0vXNNhtdC1cSvxx/RPlPpEtcVpeM+z4u1Q7cXwx2a/VFCBuSxbdOtntp8c7b3vDF98u1gnOg8zNUE5AaZP9un2DmW345AbgJCVs7JbV8fzk6CkPMvTKUp9BsPElLVBsy8DAbwbNjfipGOH31BQOhHgjjv5vHHdyV6GQfXtuLAvEv5YL/Oym3JYUUoVBHMRNjeantWGqDwla3b9UGKylg6DCb7FRnL7jjGSi/pf1+LT9R3Ff9cYffXkOsE2QsX11V1+4QKBgQD8wWHs2+SKzXcuTjQ1hrjuBw1GDaR2etpcAlCeZw8FYCwnr+/YIYyvl53vL56m1Ua+o7Gd3NWTGVPOMbDoVIvPpwUHpVPxq5MLQJEZ2NtBgYC2ved5xTeI77k1flMFNkS7Csw+3B9+efPs9lGk8Z2r52+Hl6xSsyI6x8fzXfqjDQKBgQCxhUoMwB9hqvD/CStLoFQMV7U6/x8vz0jJJTnIA1ChYndBjpNUgT5yt5nVHtXMUak4dETUEmAMLFy6Go/RJDdIQ/JW/J3K7AsoJErlNZxn7oIUD5HhtCeFN28gtISyPbayiZjsworzYzODyrgaovCgFewwyS6dnQY6tfsiCyekGQKBgA8dRUzTrWv7c2gKdybIQqDBPTL2N+J54DrmTIncYdKReLJ6293Ry8boSyJ1d4hEcrGNul5VSVQ9jHxlDk4mWCH3u95ELavi9a0TlFm2VQ4qv1auLnxipbqDk1C2mCJUp3GD6MjNgvieNE70P9ecNzCDa3DxSfW8DozzS2qrMQS1AoGBAKzwAaycObYnFrIN16zMGzUO+NHpmhM0Z171Me4lNJaT20P1RpgLdK/DJ0zUxklOwIDr2+WRpRoW2Zq/p52CH4z6DIsre/kkrNXFTWUwLhed5gDvDhoILHv9/fephKAzuNkDbQQxnbXvzU613Vatp6b81GTOiOgpAdmOUYHfxhV5AoGBALLJponlg3ffkmtluIvKXcNnD5cTKtVXp0oJ2xdNwmUAGzca6iFFGS1R/ug8FRmP0hxxIFe9+E2rrM1PZctPWUcjiIbcP9wRS9GioBy6SitYOHQ6q13IRr+4EmVC5ZMBfvrpCsmjG1J6T4ivD0XiL6eeTBvp/vK5owC7QjPpMzqf";
        // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
        public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA5ZBukPNjkDXJyPOMWAUok45jVeRVuiZEFXk0+Q39W6PiJmHEwfBXGrgT4yIwUopJP4WUttM4y3aWJ1mOJeEVrjv05XUAj+iEnyiACo80RIDNhiqStYcfWcJX/5kOvj2IUc0lbKtrlfwXWjfhnBXHGmjhyF4mP9UAWgipVbC5X9n1s6YGlkOc2H96P0iNAHud4uKtDcLYtSNBFsbce/x8otwmJ7B3MbgkE+7SkC1qhLvZ+hybYuYBXiuZs4T3hxqnLvzE8VrY9PmL4XMelTmNFSvz0R7O0NC3+U81bWWRhzkf6TxIVkhhwcwHRvV9wdSFdhzUYLTLMvoxda/cShn9PQIDAQAB";
        // 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
        public static String notify_url = "http://www.ktxip.com/goAlipayNotifyNotice";
        // 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
        public static String return_url = "http://www.ktxip.com/goAlipayReturnNotice";
        // 签名方式
        public static String sign_type = "RSA2";
        // 字符编码格式
        public static String charset = "utf-8";
        // 支付宝网关
        public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
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
