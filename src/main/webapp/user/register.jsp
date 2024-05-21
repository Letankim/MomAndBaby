<%-- 
    Document   : login
    Created on : May 20, 2024, 11:21:17 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="./components/header.jsp" %>
<!-- /HEADER -->
<!-- SECTION -->
<div class="section">
    <div class="container">
        <div class="row" style="margin-bottom: 80px; margin-top: 30px">
            <div class="col-md-6">
                <img src="./user/img/signUp.png" alt="" style="width: 100%" />
            </div>
            <form action="/MomAndBaby/register" method="post">
                <div class="col-md-6" style="padding: 100px">
                    <h2>Create an account</h2>
                    <p>Enter your details below</p>
                    <div style="width: 400px; margin-bottom: 20px; margin-top: 20px">
                        <input class="input" type="text" name="fullname" placeholder="Fullname" />
                    </div>
                    <div style="width: 400px; margin-bottom: 20px; margin-top: 20px">
                        <input class="input" type="text" name="username" placeholder="Username" />
                    </div>
                    <div style="width: 400px; margin-bottom: 20px">
                        <input
                            class="input"
                            type="text"
                            name="email"
                            placeholder="Email"
                            />
                    </div>
                    <div style="width: 400px; margin-bottom: 20px">
                        <input
                            class="input"
                            type="text"
                            name="phone"
                            placeholder="Phone"
                            />
                    </div>
                    <div style="width: 400px">
                        <input
                            class="input"
                            type="password"
                            name="password"
                            placeholder="Password"
                            />
                    </div>
                    <div style="margin-top: 40px">
                        <button
                            class="btn btn-default"
                            name="register"
                            style="
                            width: 400px;
                            padding: 10px;
                            color: #fff;
                            background-color: #db4444;
                            margin-bottom: 20px;
                            "
                            >
                            Create Account
                        </button>
                    </div>
                    <div>
                        <span style="display: block;color: red; text-align: center">
                            ${messageFailRegister}
                        </span>
                    </div>
                    <div class="text-center">
                        <p>Already have account <a href="/MomAndBaby/login">Login</a></p>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- /SECTION -->

<!-- FOOTER -->
<%@include file="./components/footer.jsp" %>
