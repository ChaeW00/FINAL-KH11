package com.kh.finalkh11.repo;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalkh11.dto.TeamMemberDto;

@Repository
public class TeamMemberRepoImpl implements TeamMemberRepo {
    
    @Autowired
    private SqlSessionTemplate sqlSession;

    @Override
    public int sequence() {
        return sqlSession.selectOne("teamMember.sequence");
    }

    @Override
    public void insert(TeamMemberDto teamMemberDto) {
        sqlSession.insert("teamMember.insert", teamMemberDto);
    }

    @Override
    public void insert2(TeamMemberDto teamMemberDto) {
        sqlSession.insert("teamMember.insert2", teamMemberDto);
    }

    @Override
    public TeamMemberDto findTeamMember(int teamMemberNo) {
        return sqlSession.selectOne("teamMember.findTeamMember", teamMemberNo);
    }

    @Override
    public void deleteTeamMember(int teamMemberNo) {
        sqlSession.delete("teamMember.deleteTeamMember", teamMemberNo);
    }

    @Override
    public List<Integer> selectTeamByMemberId(String memberId) {
        return sqlSession.selectList("teamMember.selectTeamByMemberId", memberId);
    }
    @Override
    public int selectTeamMemberCount(int teamNo) {
        return sqlSession.selectOne("teamMember.selectTeamMemberCount", teamNo);
    }
}