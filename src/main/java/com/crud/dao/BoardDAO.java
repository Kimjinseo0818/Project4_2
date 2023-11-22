package com.crud.dao;

import com.crud.bean.BoardVO;
import com.crud.common.JDBCUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


public class BoardDAO {

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    private final String MEMBER_INSERT = "insert into MEMBER (name, photo, fromdate, phone, email, mbti, gender) values (?,?,?,?,?,?,?)";
    private final String MEMBER_UPDATE = "update MEMBER set name=?, photo=?, fromdate=?, phone=?, email=?, mbti=?, gender=? where seq=?";
    private final String MEMBER_DELETE = "delete from MEMBER  where seq=?";
    private final String MEMBER_GET = "select * from MEMBER  where seq=?";
    private final String MEMBER_LIST = "select * from MEMBER order by seq desc";

    public int insertMember(BoardVO vo) {
        System.out.println("===> JDBC로 insertBoard() 기능 처리");
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(MEMBER_INSERT);
            stmt.setString(1, vo.getName());
            stmt.setString(2, vo.getPhoto());
            stmt.setString(3, vo.getFromdate());
            stmt.setString(4, vo.getPhone());
            stmt.setString(5, vo.getEmail());
            stmt.setString(6, vo.getMbti());
            stmt.setString(7, vo.getGender());
            stmt.executeUpdate();
            return 1;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    // 글 삭제
    public void deleteMember(int seq) {
        System.out.println("===> JDBC로 deleteBoard() 기능 처리");
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(MEMBER_DELETE);
            stmt.setInt(1, seq);
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public String getPhotoFilename(int seq) {
        String filename = null;
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(MEMBER_GET);
            stmt.setInt(1, seq);
            rs = stmt.executeQuery();
            if(rs.next()) {
                filename = rs.getString("photo");
            }
            rs.close();
        } catch(Exception e) {
            e.printStackTrace();
        }
        System.out.println("===> JDBC로 getPhotoFilename() 기능 처리");
        return filename;
    }
    public int updateMember(BoardVO vo) {
        System.out.println("===> JDBC로 updateBoard() 기능 처리");
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(MEMBER_UPDATE);
            stmt.setString(1, vo.getName());
            stmt.setString(2, vo.getPhoto());
            stmt.setString(3, vo.getFromdate());
            stmt.setString(4, vo.getPhone());
            stmt.setString(5, vo.getEmail());
            stmt.setString(6, vo.getMbti());
            stmt.setString(7, vo.getGender());
            stmt.setInt(8, vo.getSeq());


            System.out.println(vo.getName() + vo.getFromdate() + "-" + vo.getPhone() + "-" + vo.getEmail() + "-" + vo.getMbti() + "-" + vo.getGender() + "-" + vo.getSeq());
            stmt.executeUpdate();
            return 1;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public BoardVO getMember(int seq) {
        BoardVO one = new BoardVO();
        System.out.println("===> JDBC로 getMember() 기능 처리");
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(MEMBER_GET);
            stmt.setInt(1, seq);
            rs = stmt.executeQuery();
            if(rs.next()) {
                one.setSeq(rs.getInt("seq"));
                one.setName(rs.getString("name"));
                one.setPhoto(rs.getString("photo"));
                one.setFromdate(rs.getString("fromdate"));
                one.setPhone(rs.getString("phone"));
                one.setEmail(rs.getString("email"));
                one.setMbti(rs.getString("mbti"));
                one.setGender(rs.getString("gender"));
                one.setCnt(rs.getInt("cnt"));
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return one;
    }

    public List<BoardVO> getMemberList(){
        List<BoardVO> list = new ArrayList<BoardVO>();
        System.out.println("===> JDBC로 getMemberList() 기능 처리");
        try {
            conn = JDBCUtil.getConnection();
            stmt = conn.prepareStatement(MEMBER_LIST);
            rs = stmt.executeQuery();
            while(rs.next()) {
                BoardVO one = new BoardVO();
                one.setSeq(rs.getInt("seq"));
                one.setName(rs.getString("name"));
                one.setPhoto(rs.getString("photo"));
                one.setFromdate(rs.getString("fromdate"));
                one.setPhone(rs.getString("phone"));
                one.setEmail(rs.getString("email"));
                one.setMbti(rs.getString("mbti"));
                one.setGender(rs.getString("gender"));
                one.setRegdate(rs.getDate("regdate"));
                one.setCnt(rs.getInt("cnt"));
                list.add(one);
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}