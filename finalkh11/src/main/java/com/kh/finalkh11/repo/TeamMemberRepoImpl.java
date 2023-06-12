package com.kh.finalkh11.repo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.finalkh11.dto.TeamMemberDto;
import com.kh.finalkh11.vo.TeamInMemberInfoVO;
import com.kh.finalkh11.vo.TeamMemberVO;

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
    @Override
    public List<TeamMemberDto> getTeamMemberList(int teamNo) {
        return sqlSession.selectList("teamMember.getTeamMemberList", teamNo);
    }
    @Override
    public boolean checkIfTeamMember(String memberId, int teamNo) {
        Map<String, Object> params = new HashMap<>();
        params.put("memberId", memberId);
        params.put("teamNo", teamNo);
        Integer count = sqlSession.selectOne("teamMember.checkIfTeamMember", params);
        return count != null && count > 0;
    }

	@Override
	public List<TeamInMemberInfoVO> teamMemberInfo(int teamNo) {
		return sqlSession.selectList("teamMember.teamMemberInfo", teamNo);
	}

	@Override
	public List<TeamMemberVO> selectMemberwithVO(int teamNo) {
		return sqlSession.selectList("teamMember.selectMemberwithVO",teamNo);
	}

	@Override
	public List<TeamMemberVO> selectTeamListwithVO(String memberId) {
		return sqlSession.selectList("teamMember.selectTeamListwithVO",memberId);
	}
	@Override
	public List<TeamInMemberInfoVO> searchTeamMembers(int teamNo, String keyword) {
	    Map<String, Object> params = new HashMap<>();
	    params.put("teamNo", teamNo);
	    params.put("keyword", keyword);
	    return sqlSession.selectList("teamMember.searchTeamMembers", params);
	}
	@Override

    public void updateTeamMemberLevel(int teamMemberNo, String teamMemberLevel) {
        Map<String, Object> params = new HashMap<>();
        params.put("teamMemberNo", teamMemberNo);
        params.put("teamMemberLevel", teamMemberLevel);
        sqlSession.update("teamMember.updateTeamMemberLevel", params);
    }



}