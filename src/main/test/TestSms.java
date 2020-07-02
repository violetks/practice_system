import static com.violetks.smsUtil.PhoneCode.getPhonemsg;

/**
 * 测试发送验证码
 */
public class TestSms {
    public static void main(String[] args) {
        String phone = "15685361474"; //此处可输入你的手机号码进行测试
        String result = getPhonemsg(phone);
        System.out.println("生成的验证码："+result);
    }
}
