package com.kh.finalkh11.controller;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.finalkh11.repo.TeamMemberRepo;

@RestController
@RequestMapping("/team_in")
public class TeamInRestController {

    private final TeamMemberRepo teamMemberRepo;

    @Autowired
    public TeamInRestController(TeamMemberRepo teamMemberRepo) {
        this.teamMemberRepo = teamMemberRepo;
    }

    @PostMapping("/member/updateLevel")
    public ResponseEntity<Object> updateMemberLevel(@RequestBody Map<String, Object> requestData) {
        int teamMemberNo = Integer.parseInt(requestData.get("teamMemberNo").toString());
        String teamMemberLevel = requestData.get("teamMemberLevel").toString();
        teamMemberRepo.updateTeamMemberLevel(teamMemberNo, teamMemberLevel);
        return new ResponseEntity<>(HttpStatus.OK);
    }
}