<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="RoomBooking.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body{
            background: linear-gradient(90deg, rgb(203,228,222), #FFF);
        }
        .auto-style1 {
            width: 210px;
        }
        .auto-style3 {
            width: 136px;
        }
        h1,h2,h3 {margin: 0;}
        .ebook-popup-sec {-webkit-box-shadow: 0px 10px 20px 0px rgba(50, 50, 50, 0.52);-moz-box-shadow: 0px 10px 20px 0px rgba(50, 50, 50, 0.52);box-shadow: 0px 10px 20px 0px rgba(50, 50, 50, 0.52); border-radius:25px;}
        .ebook-popup-sec {background: rgb(203,228,204);background: -moz-linear-gradient(top, rgba(203,228,204,1) 0%, rgba(180,212,221,1) 100%);background: -webkit-linear-gradient(top, rgba(203,228,204,1) 0%,rgba(180,212,221,1) 100%);background: linear-gradient(to bottom, rgba(203,228,204,1) 0%,rgba(180,212,221,1) 100%);filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#cbe4cc', endColorstr='#b4d4dd',GradientType=0 ); width: 521px; margin: 30px auto; padding: 0 45px 30px 45px; box-sizing: border-box; text-align: center; position: relative; }
        .ebook-popup-sec h3 {margin: 0 0 2px 0;padding: 0;line-height: 22px;padding-bottom: 20px;font-family: 'Montserrat', sans-serif;font-size: 15px;color: #000;font-weight: 500;}
        .ebook-popup-sec h2 {margin: 0 0 12px 0;padding: 0px;font-family: 'Montserrat', sans-serif;font-size: 26px;color: #000;text-transform: uppercase;letter-spacing: 2px;font-weight: 700;}
        .ebook-popup-sec h5 {font-size: 12px;letter-spacing: 1px;color: #464646;font-family: 'Montserrat', sans-serif;}
        .ebook-popup-sec h5 span {text-decoration: underline;}
        .ebook-email-sec { margin: 0px; padding: 0px; width: 100%; float: left; }
        .ebook-popup-sec .ebookemail-input1,.ebook-popup-sec .ebookemail-input2 { width: 47%;border: none; margin-bottom: 30px; float: left; padding: 17px;border-radius: 6px; font-family: 'Montserrat', sans-serif;font-size: 13px;font-weight: 500; box-sizing: border-box; }
        .ebook-popup-sec .ebookemail-input2 {float: right;}
        .ebook-popup-sec .ebookemail-input1:focus,.ebook-popup-sec .ebookemail-input2:focus, .ebook-popup-sec .ebook-cls-btn, .ebook-popup-sec .ebook-input-btn { outline: none; }
        .ebook-popup-sec .ebook-input-btn { width: 100%;word-spacing: 2px;cursor: pointer;font-weight: 500;letter-spacing: 1px; margin-bottom: 20px; padding: 20px 16px;border-radius: 6px; float: right; border: 0px; font-family: 'Montserrat', sans-serif; font-size: 16px; text-transform: uppercase; color: #FFF; box-sizing: border-box; -webkit-box-shadow: 5px 5px 5px 0 rgba(0,0,0,0.27); box-shadow: 5px 5px 5px 0 rgba(0,0,0,0.27);background: rgb(29,37,98);background: -moz-linear-gradient(top, rgba(29,37,98,1) 0%, rgba(16,22,73,1) 100%);background: -webkit-linear-gradient(top, rgba(29,37,98,1) 0%,rgba(16,22,73,1) 100%);background: linear-gradient(to bottom, rgba(29,37,98,1) 0%,rgba(16,22,73,1) 100%);filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#1d2562', endColorstr='#101649',GradientType=0 );}
        .ebook-popup-sec .ebook-input-btn:hover { background: #333333; }
        .ebook-popup-sec .ebook-cls-btn { font-size: 14px; line-height: 18px; width: 28px; height: 28px; -webkit-border-radius: 50%; border-radius: 50%; background: #FFF; position: absolute; right: -14px; top: -14px; border: 0px; -webkit-box-shadow: 0 0 2px 0 rgba(0,0,0,0.27); box-shadow: 0 0 2px 0 rgba(0,0,0,0.27); cursor: pointer; }
        .ebook-popup-sec .ebook-cls-btn:hover {background: #141b51;color: #fff;}
        .ebook-popup-sec img {margin-top: -37px; border-radius:200px;}
        .popup-graybox {position: fixed;width: 100%;top: 0;left: 0;height: 100vh;z-index: 99999;text-align: center;align-items: center;display: flex;box-sizing: border-box;overflow: auto;}

         @media only screen and (max-width:815px) {
        .ebook-popup-sec { width: 80%;}
        .ebook-popup-sec h2 {font-size: 40px;}
        .ebook-popup-sec h3 {font-size: 16px;padding-bottom: 30px;}
        .ebook-popup-sec .ebookemail-input1, .ebook-popup-sec .ebookemail-input2 {margin-bottom: 22px;padding: 14px;font-size: 12px;}
        .ebook-popup-sec .ebook-input-btn {padding: 15px 16px;font-size: 12px;}
        }
        @media only screen and (max-width:675px) {
        .ebook-popup-sec .ebookemail-input { width: 60%; }
        .ebook-popup-sec h3 { padding: 0;padding-bottom: 20px; font-size: 14px;}
        .ebook-popup-sec h2 { font-size: 30px;}
        .ebook-popup-sec .ebookemail-input1, .ebook-popup-sec .ebookemail-input2 {margin-bottom: 15px;}
        }
        @media only screen and (max-width:480px) {
        .ebook-popup-sec {width: 90%;}
        .ebook-popup-sec .ebookemail-input { width: 100%; margin-bottom: 10px;padding: 12px; }
        .ebook-popup-sec .ebook-input-btn { width: 100%; padding: 13px 16px;}
        .ebook-popup-sec h3 { font-size: 16px; line-height: 20px;}
        .ebook-popup-sec h5 {letter-spacing: 0.5px;}
        .ebook-popup-sec h2 {font-size: 24px;margin: 0 0 10px 0;}
        .ebook-popup-sec {padding: 0 20px 10px 20px;}
        .ebook-popup-sec img {width: 22%;padding-bottom: 20px;}
        }
        @media only screen and (max-width:425px) {
        .ebook-popup-sec h3 {font-size: 12px;}
        .ebook-popup-sec h2 {font-size: 18px;}
        .ebook-popup-sec .ebook-input-btn {width: 100%;padding: 12px 16px;}
        .ebook-popup-sec .ebookemail-input1, .ebook-popup-sec .ebookemail-input2 {width: 100%;margin-bottom: 8px;padding: 12px;text-align: center;}
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <section class="popup-graybox">
            <div class="ebook-popup-sec" >
                 <img src="images/login.png" alt=""/>
                  <h2 data-edit="text">Login</h2>
                  <h3 data-edit="text">Login to our online room booking platform.<br />
                      <asp:Label ID="ErrorLabel" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                 </h3>
                    <div class="ebook-email-sec">
                        <table>
                            <tr>
                                <td class="auto-style3"><h3>Username</h3></td>
                                <td class="auto-style1">
                                    <asp:TextBox ID="Username" runat="server" class="ebookemail-input1" Width="167px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="UsernameValidator" runat="server" ControlToValidate="Username" Display="Dynamic" ErrorMessage="This field is required." ForeColor="Red" SetFocusOnError="True">This field is required.</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3"><h3>Password</h3></td>
                                <td class="auto-style1">
                                    <asp:TextBox ID="Password" runat="server" TextMode="Password" class="ebookemail-input1" Width="167px"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PasswordValidator" runat="server" ControlToValidate="Password" Display="Dynamic" ErrorMessage="This field is required." ForeColor="Red" SetFocusOnError="True">This field is required.</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>
                        <asp:Button ID="Login" runat="server" class="ebook-input-btn" Text="Login" OnClick="Login_Click" />
                    </div>
                    <h5>Not Registered? <asp:HyperLink ID="HyperLink2" NavigateURl="~/Register.aspx" runat="server">Register Here</asp:HyperLink></h5>
            </div>
        </section>
    </form>
</body>
</html>
