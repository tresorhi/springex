package org.zerock.springex.mapper;

import org.zerock.springex.domain.TodoVO;

import java.util.List;

public interface TodoMapper {
    String getTime();

    void insert(TodoVO todoVo);

    List<TodoVO> selectAll();

    TodoVO selectOne(Long tno);
}
