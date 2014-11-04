
<%@ page import="com.auth.People" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'people.label', default: 'People')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-people" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                <li><g:form action="imports" method="post" enctype="multipart/form-data">
                    <input name="data" type="file"><br>
                    <fieldset class="buttons">
                        <g:submitButton name="imports" class="save" value="imports" action="imports"/>
                    </fieldset>
                </g:form></li>
                <li>${flash.messages}</li>
			</ul>
		</div>
		<div id="list-people" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'people.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'people.email.label', default: 'Email')}" />
					
						<g:sortableColumn property="adress" title="${message(code: 'people.adress.label', default: 'Adress')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${peopleInstanceList}" status="i" var="peopleInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${peopleInstance.id}">${fieldValue(bean: peopleInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: peopleInstance, field: "email")}</td>
					
						<td>${fieldValue(bean: peopleInstance, field: "adress")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${peopleInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
