package service;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import db.DBConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(urlPatterns = "/search-item")
public class SearchItem extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String itemId = (request.getParameter("id"));

        Connection connection = DBConnection.getConnetcion();

        try {
            PreparedStatement pstm = connection.prepareStatement("SELECT * FROM Item WHERE iid=?");

            pstm.setObject(1, itemId);

            ResultSet rst = pstm.executeQuery();

            JsonArray respJson = new JsonArray();
            java.sql.ResultSetMetaData rsmd = rst.getMetaData();
            int numColumns = rsmd.getColumnCount();

            response.setContentType("application/json");

            try(PrintWriter out = response.getWriter();){


                if (rst.next()) {
                    JsonObject obj  = new JsonObject();
                    for (int i = 1; i < numColumns + 1; i++) {

                        String columnName = rsmd.getColumnName(i);
                        obj.addProperty(columnName, rst.getString(columnName));

                    }
                    respJson.add(obj);
                }

                out.println(respJson.toString());

            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
