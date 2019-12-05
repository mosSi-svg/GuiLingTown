package mapper;

import java.util.List;
import pojo.TownCategory;
import pojo.TownCategoryExample;

public interface TownCategoryMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TownCategory record);

    int insertSelective(TownCategory record);

    List<TownCategory> selectByExample(TownCategoryExample example);

    TownCategory selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TownCategory record);

    int updateByPrimaryKey(TownCategory record);
}