package service;

import db.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet(urlPatterns = "/place-order")
public class PlaceOrder extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String oid=request.getParameter("txtOID");
        String cid=request.getParameter("custID");
        String orderDate=request.getParameter("orderDate");
        String[] itemId=request.getParameterValues("itemCode");
        String[] qty=request.getParameterValues("itemQty");
        String total=request.getParameter("total");

        String SQL = "insert into Orders values('"+oid+"','"+cid+"','"+total+"')";
        Connection connection = DBConnection.getConnetcion();

        try (PrintWriter out=response.getWriter()){
            connection.setAutoCommit(false);
            Statement stm=connection.createStatement();
            if(stm.executeUpdate(SQL)>0){

                for (int i=0;i<itemId.length;i++){

                    String SQL2="insert into OrderDetail values('"+oid+"','"+itemId[i]+"','"+orderDate+"')";
                    if (stm.executeUpdate(SQL2)>0){

                        String SQL1="update Item set qtyOnHand='"+qty[i]+"' where iid='"+itemId[i].trim()+"'";
                        if (stm.executeUpdate(SQL1)>0){
                            connection.commit();
                            out.println("Added");
                        }else{
                            out.println("Failed");
                        }

                    }else {
                        out.println("Failed");
                    }

                }


            }else {
                connection.rollback();
                out.println("Failed");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            try {
                connection.setAutoCommit(true);
            } catch (SQLException e1) {
                e1.printStackTrace();
            }
        }
    }

}
