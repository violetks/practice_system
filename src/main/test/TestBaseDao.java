import com.violetks.dao.BaseDaoImpl;
import com.violetks.entity.RankList;

import java.util.List;

/**
 *  测试数据库连接
 *  排行榜
 */
public class TestBaseDao {
    public TestBaseDao(){
    }

    public static void main(String[] args) {
        BaseDaoImpl dao = new BaseDaoImpl();
        List<RankList> rankList = dao.getExResult(0);
        if (rankList != null) {
            try {
                for(int i = 0; i < rankList.size(); i++) {
                    RankList list = rankList.get(i);
                    System.out.print(list.getSid() + "\t");
                    System.out.print(list.getName() + "\t");
                    System.out.print(list.getAmount());
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

    }
}
