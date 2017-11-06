<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Posts</title>
</head>
<style>
    table{
        width:50%;
        border:1px solid #ececec;
        font-family: SansSerif;
        text-align: center;
        margin-bottom: 30px;

    }
    td{border:1px solid #ececec;}
    .open{
        display: table-row;
    }
    .close{
        display: none;
    }
</style>
<body>
<table>
    <th colspan="4"><a href="/categories">Categories</a></th>
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
            <td colspan="2"><input type="text" name="txt" placeholder="text" /></td>
            <td><input type="submit" name="submit" value="Add"></td>
        </form>
    </tr>
    <tr id="edit-wrapper-cat" class="close">
        <form action="/update-category" method="POST">
            <td>Изменить Категорию</td>
            <td colspan="2">
                <input type="text" name="txt" placeholder="text" />
                <input class="category-id" type="hidden" name="id" value="4" />
            </td>
            <td><input type="submit" name="submit" value="Edit"></td>
        </form>
    </tr>
</table>
<table>
    <th colspan="4">Posts</th>
    <c:forEach items="${requestScope.posts}" var="post">
    <tr>
        <td>${post.id}</td>
        <td><c:out value="${post.str}" /></td>
        <td><a href="delete?id=${post.id}">X</a></td>
        <td><a class="edit-post" data-id="${post.id}" href="javascript:void(0);">Edit</a></td>
    </tr>
    </c:forEach>
    <tr>
        <form action="/add" method="POST">
        <td>Добавить Пост</td>
        <td colspan="2"><input type="text" name="txt" placeholder="text" /></td>
        <td><input type="submit" name="submit" value="Add"></td>
        </form>
    </tr>
    <tr id="edit-wrapper" class="close">
        <form action="/update" method="POST">
            <td>Изменить Пост</td>
            <td colspan="2">
                <input type="text" name="txt" placeholder="text" />
                <input class="post-id" type="hidden" name="id" value="4" />
            </td>
            <td><input type="submit" name="submit" value="Edit"></td>
        </form>
    </tr>
</table>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
    $('.edit-post').on('click', function(){
        var id = $(this).attr('data-id');
        if ($('#edit-wrapper').hasClass('close')){
            $('#edit-wrapper').removeClass('close').addClass('open');

            $('.post-id').val(id);
        }else{
            $('#edit-wrapper').removeClass('open').addClass('close');

        }
    })
    $('.edit-category').on('click', function(){
        var id = $(this).attr('data-id');
        if ($('#edit-wrapper-cat').hasClass('close')){
            $('#edit-wrapper-cat').removeClass('close').addClass('open');

            $('.category-id').val(id);
        }else{
            $('#edit-wrapper-cat').removeClass('open').addClass('close');

        }
    })
</script>
</body>
</html>
