/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hash.co;

import com.jfoenix.controls.*;
import db.ConnectionDB;
import java.io.IOException;
import java.net.URL;
import java.sql.*;
import java.util.Properties;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.*;
import javax.mail.internet.*;
import javax.mail.internet.MimeMessage;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.input.MouseEvent;
import javafx.scene.paint.Color;
import javafx.stage.Stage;

/**
 *
 * @author Osaid Draidi
 */
public class Main_loginController implements Initializable {

    @FXML
    private Label lbError;
    @FXML
    private Label lbSetCode;
    @FXML
    private JFXTextField txtfUserName;
    @FXML
    private JFXTextField txtfCode;
    @FXML
    private JFXTextField txtfSetNewPass;
    @FXML
    private JFXPasswordField password;
    @FXML
    private JFXButton btnSignIn;
    @FXML
    private JFXButton btnDoneCode;
    @FXML
    private JFXButton btnForgetPass;
    @FXML
    private JFXButton btnDoneNewPass;

    @FXML
    public void handleCloseButtonAction(ActionEvent event) {
        ((Stage) (((Button) event.getSource()).getScene().getWindow())).close();
    }

    @Override
    public void initialize(URL url, ResourceBundle rb) {
        // TODO

    }

    public void handleButtonAction(MouseEvent event) {
        if (event.getSource() == btnSignIn) {
            logeIn(event);
        } else if (event.getSource() == btnForgetPass) {
            forgetPass();
        } else if (event.getSource() == btnDoneCode) {
            chickDoneCode();
        } else if (event.getSource() == btnDoneNewPass) {
            doneNewPass();
        }
    }

    Connection con = null;
    PreparedStatement preparedStatement = null;
    ResultSet resultSet = null;

    private void logeIn(MouseEvent event) {
        lbError.setText("");
        String number = txtfUserName.getText();
        String pass = password.getText();

        String sql = "SELECT * FROM login Where number = ? and pass = ?";
        //System.out.println(number+"   "+  pass);
        try {
            preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, number);
            preparedStatement.setString(2, pass);
            resultSet = preparedStatement.executeQuery();
            if (!resultSet.next()) {
                lbError.setTextFill(Color.TOMATO);
                lbError.setText("Error on UserName or Password");
                password.setText("");
            } else {
                switchScene(event);
            }

        } catch (Exception ex) {
            System.out.println(ex.toString());
        }
    }

    public Main_loginController() {
        con = ConnectionDB.conDB();
    }
    private int code = 0;

    private void forgetPass() {
        try {
            number = Integer.parseInt(txtfUserName.getText());
            String sql = "SELECT * FROM login Where number = ?";

            preparedStatement = con.prepareStatement(sql);
            preparedStatement.setInt(1, number);
            resultSet = preparedStatement.executeQuery();
            if (!resultSet.next()) {
                lbError.setTextFill(Color.TOMATO);
                lbError.setText("User Number is not valid");

            } else {
                lbSetCode.setText("Enter the code from your email");
                lbSetCode.setVisible(true);
                txtfCode.setVisible(true);
                btnDoneCode.setVisible(true);

                int id_information = resultSet.getInt("id_information");
                System.out.println(id_information);
                sql = "SELECT * FROM information Where id = ?";

                preparedStatement = con.prepareStatement(sql);
                preparedStatement.setInt(1, id_information);
                resultSet = preparedStatement.executeQuery();
                if (resultSet.next()) {
                    String email = resultSet.getString("email");
                    System.out.println(email);
                    code = randomCode();
                    sendToEmail(email, code);
                }

            }

        } catch (SQLException ex) {
            System.out.println("Error from forgetPass method");
        }
    }

    private void chickDoneCode() {
        if (code == Integer.parseInt(txtfCode.getText())) {
            lbSetCode.setText("Enter new password");
            lbError.setText("");
            txtfCode.setVisible(false);
            btnDoneCode.setVisible(false);
            txtfSetNewPass.setVisible(true);
            btnDoneNewPass.setVisible(true);

        } else {
            lbError.setTextFill(Color.TOMATO);
            lbError.setText("the code is rong");

        }
    }
    private int number;

    private void doneNewPass() {
        try {
            String newPass = txtfSetNewPass.getText();
            String sql = "UPDATE login set pass = ? Where number = ?";

            preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, newPass);
            preparedStatement.setInt(2, number);
            preparedStatement.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("Error int doneNewPass method");
        }
    }

    private void sendToEmail(String email, int code) {
        try {
            String host = "smtp.gmail.com";
            String user = "soso19961741@gmail.com";
            String pass = "19961741osaid";
            String to = email;
            String from = "soso19961741@gmail.com";
            String subject = "This is confirmation number for your expertprogramming account. Please insert this number to activate your account.";
            String messageText = "" + code;
            boolean sessionDebug = false;

            Properties props = System.getProperties();

            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", host);
            props.put("mail.smtp.port", "587");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.required", "true");

            java.security.Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
            Session mailSession = Session.getDefaultInstance(props, null);
            mailSession.setDebug(sessionDebug);
            Message msg = new MimeMessage(mailSession);
            msg.setFrom(new InternetAddress(from));
            InternetAddress[] address = {new InternetAddress(to)};
            msg.setRecipients(Message.RecipientType.TO, address);
            msg.setSubject(subject);
            msg.setSentDate(new java.util.Date());
            msg.setText(messageText);

            Transport transport = mailSession.getTransport("smtp");
            transport.connect(host, user, pass);
            transport.sendMessage(msg, msg.getAllRecipients());
            transport.close();
            System.out.println("message send successfully");
        } catch (Exception ex) {
            System.out.println(ex);
        }

    }

    private int randomCode() {
        return (int) (Math.random() * 10000);
    }

    private void switchScene(MouseEvent event) {
        String userNumber = txtfUserName.getText();
        if (userNumber.charAt(0) == 'a' || userNumber.charAt(0) == 'A') {
            try {
                Parent home_page_parent = FXMLLoader.load(getClass().getResource("Admin_page.fxml"));
                Scene home_page_scene = new Scene(home_page_parent);
                Stage app_stage = (Stage) ((Node) event.getSource()).getScene().getWindow();

                app_stage.close(); //optional
                app_stage.setScene(home_page_scene);
                app_stage.show();

            } catch (IOException ex) {
                System.out.println(ex.toString());
                System.out.println("Error in switch Scenes Method");
            }
        } else if (userNumber.charAt(0) == 'm' || userNumber.charAt(0) == 'M') {
            try {
                Parent home_page_parent = FXMLLoader.load(getClass().getResource("Mother_page.fxml"));
                Scene home_page_scene = new Scene(home_page_parent);
                Stage app_stage = (Stage) ((Node) event.getSource()).getScene().getWindow();

                app_stage.close();
                app_stage.setScene(home_page_scene);
                app_stage.show();

            } catch (IOException ex) {
                System.out.println("Error in switch Scenes Method");
            }
        }
    }
}
