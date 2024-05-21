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
            <div class="col-md-6" style="padding: 100px; margin-top: 70px">
                <h2>Login to Exclusive</h2>
                <p>Enter your details below</p>
                <form action="/MomAndBaby/login" method="post">
                    <div style="width: 400px; margin-bottom: 20px; margin-top: 20px">
                        <input
                            class="input"
                            type="text"
                            name="username"
                            placeholder="Userame"
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
                    <div>
                        <div
                            style="
                            display: flex;
                            justify-content: space-between;
                            align-items: center;
                            margin-top: 40px;
                            "
                            >
                            <button
                                class="btn btn-default"
                                name="submitLogin"
                                style="
                                padding: 10px;
                                color: #fff;
                                background-color: #db4444;
                                margin-bottom: 20px;
                                "
                                >
                                Login
                            </button>
                            <a href="#">Forget Password?</a>
                        </div>
                        <span style="display: block;color: red">${messageUserAuth}</span>
                        <div class="text-center">
                            <p>Create new account <a href="/MomAndBaby/register">Register</a></p>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- /SECTION -->

<!-- FOOTER -->
<%@include file="./components/footer.jsp" %>
