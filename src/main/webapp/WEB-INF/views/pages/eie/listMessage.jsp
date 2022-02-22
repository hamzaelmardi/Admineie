<jsp:include page="../../includes/tag.jsp" />
<jsp:include page="../../includes/header.jsp" />
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../../menu/menu.jsp" />
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<div class="container-fluid mt_def card" style="margin: 190px 10px 40px 10px">
    <div class="row m-2"  dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
        <div class="col-md-2 col-sm-2 mt-1">
            <a href="/api/listMessage/1" class="btn bgMyColor btn-block"><span class="text-white"><spring:message code="label.nonlu"/></span></a>
        </div>
        <div class="col-md-2 col-sm-2 mt-1">
            <a href="/api/listMessage/2" class="btn bgMyColor btn-block"><span class="text-white"><spring:message code="label.lu"/></span></a>
        </div>
    </div>

    <div class="col-12 table-responsive"  dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
        <table style="width:100% !important" id="tbody" class="table table-bordered display nowrap">
            <thead style="background: gray;color: white;border-color: #737373;">
            <tr style="background-color: #206c45 !important;">
                    <th class="text-center"><spring:message code="label.Nomcomplet"/></th>
                    <th class="text-center"><spring:message code="label.TypedeDemande"/></th>
                    <th class="text-center"><spring:message code="label.Object"/></th>
                    <th class="text-center"><spring:message code="label.Email"/></th>
                    <th class="text-center"><spring:message code="label.Telephone"/></th>
                    <th class="text-center"><spring:message code="label.Message"/></th>
                    <th class="text-center"><spring:message code="label.Date"/></th>
                    <th class="text-center"><spring:message code="label.Reponse"/></th>
                    <th class="text-center"><spring:message code="label.Action"/></th>
                </tr>
                </thead>
                <tbody>

                <c:forEach items="${contact}" var="c">

                    <tr>
                        <td>${c.nom} ${c.prenom}</td>
                        <td>${c.typemsg.equals("1")?'Autorisation des déchets':'Evaluation Environnementale'}</td>
                        <td>${c.sujet}</td>
                        <td>${c.email}</td>
                        <td>${c.numtel}</td>
                        <td>${c.message}</td>
                        <td>${c.date}</td>
                        <td>${c.reponse == null?'Aucune Réponse':c.reponse}</td>

                        <td class="text-center">
                            <ul class="list-inline m-0">
                                <li class="list-inline-item">
                                    <a href="/contact/${c.id_message}" class="btn btn-success btn-sm"><span class="fa fa-plus"></span><spring:message code="label.Voirplus"/> </a>

                                    </a>
                                </li>
                            </ul>
                        </td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>
    </div>

</div>

<script>
    function go_link(url){
        window.location.href=url;
    }
</script>

<jsp:include page="../../includes/footer.jsp" />