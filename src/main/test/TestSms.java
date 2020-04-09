import static com.violetks.smsUtil.PhoneCode.getPhonemsg;

/**
 * 测试发送验证码
 */
public class TestSms {
    public static void main(String[] args) {
        String phone = ""; //此处可输入你的手机号码进行测试
        getPhonemsg(phone);
    }
}
