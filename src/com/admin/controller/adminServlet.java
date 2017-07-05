package com.admin.controller;

import com.admin.model.AdminService;
import com.admin.model.AdminVO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

@WebServlet("/adminServlet.do")
public class adminServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        doPost(req, res);
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        String action = req.getParameter("action");
        HttpSession session = req.getSession();

//        session.setAttribute("adminVO", adminVO);
//        session.setAttribute("adm_no", adminVO.getAdm_no());
//        session.setAttribute("adm_name", adminVO.getAdm_name());


        if ("login".equals(action)) {
            System.out.println("login \"action\" in ADC : " + action);
            List<String> errorMsgs = new LinkedList<String>();
            session = req.getSession();

            req.setAttribute("errorMsgs", errorMsgs);

            try {
                /***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
                String adminAc = req.getParameter("adminAc");
                String adminPsd = req.getParameter("adminPsd");
                if (adminAc == null || (adminAc.trim()).length() == 0) {
                    errorMsgs.add("�п�Admin Account");
                }
                // Send the use back to the form, if there were errors
                if (!errorMsgs.isEmpty()) {
                    RequestDispatcher failureView = req
                            .getRequestDispatcher("/backend/login.jsp");
                    failureView.forward(req, res);
                    return;//�{�����_
                }
                /***************************2.�}�l�d�߸��*****************************************/
                AdminService adSvc = new AdminService();
                AdminVO adminVO = adSvc.getOneAdmin(adminAc);
                
                if (adminVO == null) {
                    errorMsgs.add("�d�L�b��");
                }else if(adminVO.getAdm_pwd().equals(adminPsd)) {
                    errorMsgs.add("�K�X���~");
                }
                if (!errorMsgs.isEmpty()) {
                    RequestDispatcher failureView = req
                            .getRequestDispatcher("/backend/login.jsp");
                    failureView.forward(req, res);
                    return;//�{�����_
                }

                /***************************3.�d�ߧ���,�ǳ����(Send the Success view)*************/
                req.setAttribute("adminVO", adminVO);
                session.setAttribute("adminVO", adminVO);
                session.setAttribute("adm_no", adminVO.getAdm_no());
                session.setAttribute("adm_name", adminVO.getAdm_name());

                String url = "/backend/index.jsp";
                System.out.println("adminVO: " + adminVO + "\n" + "url: " + url);
                RequestDispatcher successView = req.getRequestDispatcher(url);
                successView.forward(req, res);

                /***************************��L�i�઺���~�B�z*************************************/
            } catch (Exception e) {
                errorMsgs.add("�L�k���o���:" + e.getMessage());
                RequestDispatcher failureView = req
                        .getRequestDispatcher("/backend/login.jsp");
                failureView.forward(req, res);
            }
        }

        if ("insert".equals(action)) { // �Ӧ�addEmp.jsp���ШD
            System.out.println("action in Chat_FrienServlet.do:" + action);
            List<String> errorMsgs = new LinkedList<String>();
            // Store this set in the request scope, in case we need to
            // send the ErrorPage view.
            req.setAttribute("errorMsgs", errorMsgs);


            /***********************1.�����ШD�Ѽ� - ��J�榡�����~�B�z*************************/
            String adm_acct = req.getParameter("adm_acct");
            String adm_pwd = req.getParameter("adm_pwd");
            String adm_name = req.getParameter("adm_name");
            String adm_mail = req.getParameter("adm_mail");

            AdminVO adminVO = new AdminVO();
            adminVO.setAdm_acct(adm_acct);
            adminVO.setAdm_mail(adm_mail);
            adminVO.setAdm_name(adm_name);
            adminVO.setAdm_pwd(adm_pwd);

            // Send the use back to the form, if there were errors
            if (!errorMsgs.isEmpty()) {
                req.setAttribute("adminVO", adminVO); // �t����J�榡���~��empVO����,�]�s�Jreq
                RequestDispatcher failureView = req
                        .getRequestDispatcher("/chat/addEmp.jsp");
                failureView.forward(req, res);
                return;
            }

            /***************************2.�}�l�s�W���***************************************/
            AdminService adSvc = new AdminService();
            adminVO = adSvc.addAdmin(adm_acct, adm_pwd, adm_name, adm_mail);

            /***************************3.�s�W����,�ǳ����(Send the Success view)***********/
            String url = "/frontend/chat/ChatFriend/listCF0403.jsp";
            RequestDispatcher successView = req.getRequestDispatcher(url); // �s�W���\�����listAllEmp.jsp
            successView.forward(req, res);
            /***************************��L�i�઺���~�B�z**********************************/
        }

        if ("logout".equals(action)) {
        	System.out.println("session clear before: " + session.getAttribute("adm_no"));
            session.invalidate();
            System.out.println("session clear after: " + session.getAttribute("adm_no"));
            
            res.sendRedirect(req.getContextPath()+"/backend/login.jsp");

        }
        
        if ("delete".equals(action)) { // �Ӧ�listAllChat_Friend.jsp

        }

    }
}