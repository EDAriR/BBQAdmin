package com.admin.model;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class Authority_FeatureDAO implements Authority_FeatureDAO_interface {
    // 一個應用程式中,針對一個資料庫 ,共用一個DataSource即可
    private static DataSource ds = null;

    static {
        try {
            Context ctx = new InitialContext();
            ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDBG3");
        } catch (NamingException e) {
            e.printStackTrace();
        }
    }

    // 新增資料
    private static final String INSERT_STMT = "INSERT INTO authority_feature (auth_no, auth_name) " +
            "VALUES ('an'||LPAD(TO_CHAR(auth_no_seq.NEXTVAL),1,'0'), ?)";
    // 查詢資料
    private static final String GET_ALL_STMT = "SELECT auth_no , auth_name FROM authority_feature";
    private static final String GET_ONE_STMT = "SELECT auth_no, auth_name FROM authority_feature " +
            "WHERE auth_no = ?";
    // 刪除資料
    private static final String DELETE_AUTHORITY = "DELETE FROM admin_authority WHERE adm_no = ?";
    private static final String DELETE_FEATURE = "DELETE FROM authority_feature WHERE adm_no = ?";

    // 修改資料
    private static final String UPDATE = "UPDATE authority_feature SET auth_name=? WHERE auth_no = ?";


    @Override
    public void insert(Authority_FeatureVO authority_FeatureVO) {

        Connection con = null;
        PreparedStatement pstmt = null;

        try {

            con = ds.getConnection();
            String[] seq = {"auth_no"}; // 有使用sequence產生編號的話才要寫
            pstmt = con.prepareStatement(INSERT_STMT, seq); // 有使用sequence產生編號的話才要寫第二個參數

            pstmt.setString(1, authority_FeatureVO.getAuth_name());
            pstmt.executeUpdate();

            // Handle any SQL errors
        } catch (SQLException se) {
            throw new RuntimeException("A database error occured. "
                    + se.getMessage());
            // Clean up JDBC resources
        } finally {
            if (pstmt != null) {
                try {pstmt.close();}
                catch (SQLException se) {se.printStackTrace(System.err);}
            }
            if (con != null) {
                try {con.close();}
                catch (Exception e) {e.printStackTrace(System.err);}
            }
        }
    }

    @Override
    public void update(Authority_FeatureVO authority_FeatureVO) {

        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = ds.getConnection();
            pstmt = con.prepareStatement(UPDATE);

            pstmt.setString(1, authority_FeatureVO.getAuth_name());
            pstmt.setString(2, authority_FeatureVO.getAuth_no());
            pstmt.executeUpdate();

            // Handle any SQL errors
        } catch (SQLException se) {
            throw new RuntimeException("A database error occured. "
                    + se.getMessage());
            // Clean up JDBC resources
        } finally {
            if (pstmt != null) {
                try {pstmt.close();}
                catch (SQLException se) {se.printStackTrace(System.err);}
            }
            if (con != null) {
                try {con.close();}
                catch (Exception e) {e.printStackTrace(System.err);}
            }
        }
    }

    @Override
    public void delete(String auth_no) {

        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = ds.getConnection();

            // 1 設定於 pstm.executeUpdate()之前
            con.setAutoCommit(false);

            pstmt = con.prepareStatement(DELETE_AUTHORITY);
            pstmt.setString(1, auth_no);
            pstmt = con.prepareStatement(DELETE_FEATURE);
            pstmt.setString(1, auth_no);
            pstmt.executeUpdate();

            // 2 設定於 pstm.executeUpdate()之後
            con.commit();
            con.setAutoCommit(true);
            System.out.println("Delete Authority Feature" + auth_no);

            // Handle any SQL errors
        } catch (SQLException se) {
            if (con != null) {
                // 3 設定於當有exception發生時之catch區塊內
                try {con.rollback();}
                catch (SQLException excep) {
                    throw new RuntimeException("rollback error occured. "
                            + excep.getMessage());
                }
            }
            throw new RuntimeException("A database error occured. "
                    + se.getMessage());
        } finally {
            if (pstmt != null) {
                try {pstmt.close();}
                catch (SQLException se) {se.printStackTrace(System.err);}
            }
            if (con != null) {
                try {con.close();}
                catch (Exception e) {e.printStackTrace(System.err);}
            }
        }
    }

    @Override
    public Authority_FeatureVO findByPrimaryKey(String auth_no) {

        Authority_FeatureVO authority_featureVO = null;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            con = ds.getConnection();

            pstmt = con.prepareStatement(GET_ONE_STMT);
            pstmt.setString(1, auth_no);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                authority_featureVO = new Authority_FeatureVO();
                authority_featureVO.setAuth_no(rs.getString("auth_no"));
                authority_featureVO.setAuth_name(rs.getString("auth_name"));
            }
            // Handle any SQL errors
        } catch (SQLException se) {
            throw new RuntimeException("A database error occured. "
                    + se.getMessage());
            // Clean up JDBC resources
        } finally {
            if (rs != null) {
                try {rs.close();}
                catch (SQLException se) {se.printStackTrace(System.err);}
            }
            if (pstmt != null) {
                try {pstmt.close();}
                catch (SQLException se) {se.printStackTrace(System.err);}
            }
            if (con != null) {
                try {con.close();}
                catch (Exception e) {e.printStackTrace(System.err);}
            }
        }
        return authority_featureVO;
    }

    @Override
    public List<Authority_FeatureVO> getAll() {

        List<Authority_FeatureVO> list = new ArrayList<Authority_FeatureVO>();
        Authority_FeatureVO authority_FeatureVO = null;
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {

            con = ds.getConnection();
            pstmt = con.prepareStatement(GET_ALL_STMT);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                authority_FeatureVO = new Authority_FeatureVO();
                authority_FeatureVO.setAuth_no(rs.getString("auth_no"));
                authority_FeatureVO.setAuth_name(rs.getString("auth_name"));
                list.add(authority_FeatureVO); // Store the row in the list
            }

        } catch (Exception se) {
            throw new RuntimeException("A database error occured. "
                    + se.getMessage());
        } finally {
            if (rs != null) {
                try {rs.close();}
                catch (SQLException se) {se.printStackTrace(System.err);}
            }
            if (pstmt != null) {
                try {pstmt.close();}
                catch (SQLException se) {se.printStackTrace(System.err);}
            }
            if (con != null) {
                try {con.close();}
                catch (Exception e) {e.printStackTrace(System.err);}
            }
        }
        return list;
    }
}