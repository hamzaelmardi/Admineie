
<jsp:include page="../../includes/tag.jsp" />
<jsp:include page="../../includes/header.jsp" />
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page contentType="text/html; charset=UTF-8" %>



                                        <table class="table table-bordered striped mg-b-0 text-md-nowrap" id="profiltr">
                                            <thead style="background-color: grey">
                                            <tr style="color: whitesmoke">
                                                <th>Fonctionalité</th>
                                                <th></th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${role}" var="r">
                                                <tr>
                                                    <td>${r.nom}</td>
                                                    <td><a class="btn btn-primary" onclick="showStatut(${r.type})">+</a></td>
                                                </tr>

                                            </c:forEach>
                                            </tbody>
                                        </table>

