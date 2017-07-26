<%@ Page Title="" Language="C#" MasterPageFile="~/LoginMasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Presentation_User_Login" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../../assets/smoke/smoke.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="">
        <a class="hiddenanchor" id="toregister"></a>
        <a class="hiddenanchor" id="tologin"></a>

        <div id="wrapper">
            <div id="login" class="animate form">
                <section class="login_content">
                    <i class="fa fa-user"></i>

                    <form runat="server">

                        <h1>Login</h1>
                        <div>
                            <input id="txtUserName" runat="server" type="text" class="form-control" placeholder="Username" />
                        </div>
                        <div>
                            <input type="password" runat="server" id="txtPassword" class="form-control" placeholder="Password"  />
                        </div>
                        <div>
                            <input type="checkbox" runat="server" id="chkRememberMe" />
                            Remeber Me?
                        </div>
                        <div class="pull-right">
                            <asp:Button runat="server" CssClass="btn btn-default submit" Text="Login"  OnClientClick="return ValidateRegForm();" ID="btnLogin" OnClick="btnLogin_Click" />
                        </div>
                        <div class="clearfix"></div>
                        <div class="separator">

                            <%--<p class="change_link">New to site?
              </p>--%>
                            <div class="clearfix">
                                <label runat="server" id="txtError" class="label-danger"></label>
                            </div>

                            <br />
                            <div>
                                <h5><i class="fa fa-copyright"></i>JS.</h5>
                            </div>
                        </div>
                    </form>
                    <!-- form -->
                </section>
                <!-- content -->
            </div>

        </div>
    </div>
    <script src="../../assets/smoke/smoke.min.js"></script>
    <script type="text/javascript">


        function ValidateRegForm() {
            var email = document.getElementById("<%=txtUserName.ClientID%>");
            var filter = /^([a-zA-Z0-9_.-])+@(([a-zA-Z0-9-])+.)+([a-zA-Z0-9]{2,4})+$/;
            if (!filter.test(email.value)) {

                smoke.alert("Please provide a valid email address", function (e) {

                }, {
                    ok: "Ok",

                    classname: "custom-class"
                });

                email.focus;

                return false;
            }
            return validatePassword();
         
        }
        function validatePassword() {

            var p = document.getElementById("<%=txtPassword.ClientID%>");

            var regex = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[^\w\s]).{8,}$/;

            if (!regex.test(p.value)) {


                smoke.alert("Password must contains: 1.one upper case character , 2.one lower case character,3.one numeric and special character", function (e) {

                }, {
                    ok: "Ok",

                    classname: "custom-class"

                });
          
                return false;
              
            }



            return true;
        }
    </script>

</asp:Content>
