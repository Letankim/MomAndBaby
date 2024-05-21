<%-- 
    Document   : footer
    Created on : May 17, 2024, 9:24:39 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- FOOTER -->
<footer id="footer">
    <!-- top footer -->
    <div class="section">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">
                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">Exclusive</h3>
                        <h4 style="color: #fff">Subscribe</h4>
                        <p style="margin-top: 20px">Get 10% off your first order</p>
                        <form style="margin-top: 20px">
                            <input
                                class="input"
                                type="email"
                                placeholder="Enter Your Email"
                                />
                            <i class="fa fa-send"></i>
                        </form>
                    </div>
                </div>

                <div class="col-md-2 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">Support</h3>
                        <ul class="footer-links">
                            <li>
                                <a href="#"
                                   ><i class="fa fa-map-marker"></i>1734 Stonecoal Road</a
                                >
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-phone"></i>+021-95-51-84</a>
                            </li>
                            <li>
                                <a href="#"
                                   ><i class="fa fa-envelope-o"></i>email@email.com</a
                                >
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="clearfix visible-xs"></div>

                <div class="col-md-2 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">Account</h3>
                        <ul class="footer-links">
                            <li><a href="#">My Account</a></li>
                            <li><a href="#">Login / Register</a></li>
                            <li><a href="#">Cart</a></li>
                            <li><a href="#">Wishlist</a></li>
                            <li><a href="#">Shop</a></li>
                        </ul>
                    </div>
                </div>

                <div class="col-md-2 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">Quick Link</h3>
                        <ul class="footer-links">
                            <li><a href="#">Privacy Policy</a></li>
                            <li><a href="#">Terms Of Use</a></li>
                            <li><a href="#">FAQ</a></li>
                            <li><a href="#">Contact</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-3 col-xs-6">
                    <div class="footer">
                        <h3 class="footer-title">Download App</h3>
                        <p>Save $3 with App New User Only</p>
                        <img src="./img/download.png" alt="" />
                        <ul class="footer-links" style="margin-top: 15px">
                            <li>
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-instagram"></i></a>
                                <a href="#"><i class="fa fa-linkedin"></i></a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
    <!-- /top footer -->

    <!-- bottom footer -->
    <div id="bottom-footer" class="section">
        <div class="container">
            <!-- row -->
            <div class="row">
                <div class="col-md-12 text-center">
                    <ul class="footer-payments">
                        <li>
                            <a href="#"><i class="fa fa-cc-visa"></i></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-credit-card"></i></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-cc-paypal"></i></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-cc-mastercard"></i></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-cc-discover"></i></a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-cc-amex"></i></a>
                        </li>
                    </ul>
                    <span class="copyright">
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        Copyright &copy;
                        <script>
                            document.write(new Date().getFullYear());
                        </script>
                        All rights reserved | This template is made with
                        <i class="fa fa-heart-o" aria-hidden="true"></i> by
                        <a href="https://colorlib.com" target="_blank">Colorlib</a>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    </span>
                </div>
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->
    </div>
    <!-- /bottom footer -->
</footer>
<!-- /FOOTER -->

<!-- jQuery Plugins -->
<script>
    var baseURL = window.location.origin + window.location.pathname;
    window.history.replaceState({}, document.title, baseURL);</script>
<script src="./user/js/jquery.min.js"></script>
<script src="./user/js/bootstrap.min.js"></script>
<script src="./user/js/slick.min.js"></script>
<script src="./user/js/nouislider.min.js"></script>
<script src="./user/js/jquery.zoom.min.js"></script>
<script src="./user/js/main.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<jsp:useBean id="convertActionText" scope="page" class="Utils.ConvertActionText"></jsp:useBean>
<c:set var="type_message" value="${param.status}"/>
<c:set var="action" value="${param.act}"/>
<script>
      <c:if test="${type_message != null && type_message == 1}">
                        Swal.fire({
            title: 'Success!',
            text: '${convertActionText.convertActionText(action, type_message)}',
            icon: 'success',
            confirmButtonText: 'OK'
                                });
                                </c:if>
              <c:if test="${type_message != null && (type_message == 0 || type_message == 2 || type_message == 3)}">
                                Swal.fire({
            title: 'Error!',
            text: '${convertActionText.convertActionText(action, type_message)}',
            icon: 'error',
            confirmButtonText: 'OK'
                });
                </c:if>
        </script>
            </body>
            </html>
