package mapper;

import java.util.List;
import pojo.TowImage;
import pojo.TowImageExample;

public interface TowImageMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TowImage record);

    int insertSelective(TowImage record);

    List<TowImage> selectByExample(TowImageExample example);

    TowImage selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TowImage record);

    int updateByPrimaryKey(TowImage record);
}