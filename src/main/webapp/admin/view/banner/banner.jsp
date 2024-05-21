<%-- 
    Document   : banner
    Created on : Oct 1, 2023, 11:18:24 PM
    Author     : Le Tan Kim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../components/header.jsp" %>
<section id="main-content">
    <section class="wrapper">
        <div class="wrapper-box-add">
            <div class="row">
                <div class="col-lg-12">
                    <div id="toast"></div>
                    <section class="panel">
                        <div class="panel-body">
                            <div class="position-center">
                                <div class="text-center">
                                    <a href="#myModal" data-toggle="modal" class="btn btn-success">
                                        Add new
                                    </a>
                                </div>
                                <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                                                <h4 class="modal-title">Add banner</h4>
                                            </div>
                                            <div class="modal-body">
                                                <form role="form" method="post" action="/admin/banner" enctype="multipart/form-data">
                                                    <div class="form-group">
                                                        <label>Banner image</label>
                                                        <input onchange="previewImage(event, '.box-img-preview')" required type="file" name="img" id="image" class="form-control">
                                                        <div class="box-img-preview">

                                                        </div>
                                                        <span class="message_error"></span>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="control-label">Status</label>
                                                        <select name="status" class="form-control">
                                                            <option value="1">Active</option>
                                                            <option value="0">Hidden</option>
                                                        </select>
                                                    </div>
                                                    <button name="btn-add-banner" id="add-banner" type="submit" class="btn btn-group-justified btn-primary">Add</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
        <div class="table-agile-info">
            <div class="panel panel-default">
                <div class="panel-heading">
                    Banners
                </div>
                <div class="row w3-res-tb">
                    <div class="col-sm-5 m-b-xs">
                        <select onchange="filterStatus('banner', this.value)" class="input-sm form-control w-sm inline v-middle">
                            <option value="-1">All</option>
                            <option value="1">Active</option>
                            <option value="0">Hidden</option>
                        </select>   
                    </div>
                </div>
            </div>
            <div class="table-responsive" style="padding: 5px;">
                <script>
                    $(document).ready(function () {
                        $("#category").DataTable();
                    });
                </script>
                <form method="post" action="/admin/banner">
                    <div class="wrapper-box-btn">
                        <button name="btn-delete-banners" onclick="return confirm('Are you sure to delete?')" class="btn btn-sm btn-danger">
                            Delete all checked
                        </button>
                    </div>
                    <table id="category" class="table table-striped b-t b-light">
                        <thead>
                            <tr>
                                <th style="width:20px;">
                                    <label class="i-checks all-check m-b-none">
                                        <input type="checkbox"><i></i>
                                    </label>
                                </th>
                                <th>Banner image</th>
                                <th>Date at</th>
                                <th>Date update</th>
                                <th>Status</th>
                                <th style="width:30px;">Action</th>
                            </tr>
                        </thead>
                        <tbody class="render-data">
                            <c:forEach items="${banners}" var="banner">
                                <tr>
                                    <td><input type="checkbox" name="deleteBanner" value="${banner.ID}"></td>
                                    <td>
                                        <img src="${banner.img}" alt="alt"/>
                                    </td>
                                    <td><span class="text-ellipsis">${banner.datePost}</span></td>
                                    <td>
                                        <span class="text-ellipsis">
                                            ${banner.dateUpdate}
                                        </span>
                                    </td>
                                    <td>
                                        <c:if test="${banner.status == 1}">
                                            <span class="label label-success">Active</span>
                                        </c:if>
                                        <c:if test="${banner.status == 0}">
                                            <span class="label label-default">Hidden</span>
                                        </c:if>
                                    </td>
                                    <td class="box-action">
                                        <a href="/admin/banner/update/${banner.ID}" class="active btn-action green">
                                            <i class="bx bx-edit"></i>
                                        </a>
                                        <a onclick="return confirm('Are you sure to delete?')" 
                                           href="/admin/banner/delete/${banner.ID}" 
                                           class="active btn-action orange">
                                            <i class='bx bx-trash'></i>
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>
        </div>
    </section>
    <script src="./admin/assets/js/validation.js"></script>
    <script >
                                            const image = document.getElementById('image');
                                            const imageMessage = "Please choose a image valid";
                                            // array to save all input to check, message show error of each and a string regex to check 
                                            const inputsToValidate = [
                                                {element: image, message: imageMessage, regex: "image"},
                                            ];
                                            validation(inputsToValidate, document.querySelector("#add-banner"));
    </script>
    <%@include file="../components/footer.jsp" %>
