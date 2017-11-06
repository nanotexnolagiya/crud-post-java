<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Categories</title>
</head>
<style>
    table{
        width:50%;
        border:1px solid #ececec;
        font-family: SansSerif;
        text-align: center;

    }
    .open{
        display: table-row;
    }
    .close{
        display: none;
    }
</style>
<body>
<table border="1" style>
    <c:forEach items="${requestScope.categories}" var="category">
        <tr>
            <td>${category.id}</td>
            <td><c:out value="${category.str}" /></td>
            <td><a href="delete-category?id=${category.id}">X</a></td>
            <td><a class="edit-category" data-id="${category.id}" href="javascript:void(0);">Edit</a></td>
        </tr>
    </c:forEach>
    <tr>
        <form action="/add-category" method="POST">
            <td>Добавить Категорию</td>
            <td><input type="text" name="txt" placeholder="text" /></td>
            <td><input type="submit" name="submit" value="Add"></td>
        </form>
    </tr>
    <tr id="edit-wrapper" class="close">
        <form action="/update-category" method="POST">
            <td>Изменить Категорию</td>
            <td>
                <input type="text" name="txt" placeholder="text" />
                <input class="category-id" type="hidden" name="id" value="4" />
            </td>
            <td><input type="submit" name="submit" value="Edit"></td>
        </form>
    </tr>
</table>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
    $('.edit-category').on('click', function(){
        var id = $(this).attr('data-id');
        if ($('#edit-wrapper').hasClass('close')){
            $('#edit-wrapper').removeClass('close').addClass('open');

            $('.category-id').val(id);
        }else{
            $('#edit-wrapper').removeClass('open').addClass('close');

        }
    })
</script>
</body>
</html>
