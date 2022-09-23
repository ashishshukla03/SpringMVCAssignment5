<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Books Management</title>
</head>
<body>
    <div align="right">
    <h1>
				<span class="navbar-text">Book Listing</span>
			</h1>
  
      <form class="d-flex" action="loginPage.jsp" method="post">
				<button class="logout-btn btn btn-primary" type="submit">
					logout</button>
			</form>
    </div>
     <div id="err">
     </div>
    <div align="center" class="container">
    
      <h2>List Of Books</h2>
      <p>
        <a class='btn' href="#add" rel="modal:open">Add New Book</a>
      </p>
     
      <table border="1" cellspacing="0" cellpadding="5">
        <tr>
            <th>Book Id</th>
            <th>Book Name</th>
            <th>Book Author</th>
            <th>Data Added</th>
            <th>Actions</th>



       </tr>
      </table>
    </div>
    
    
    <form id="add" action="#" class="add_form modal" style="display: none;">
        <div id='msg' />
        <h3>Add a New Book</h3>
        <p>
            <label>Book Code</label> <input type="text" id="id" name="id">
        </p>
        <p>
            <label>Book Name</label> <input type="text" id="title" name="title">
        </p>
        <p>
            <label>Author</label> <input type="text" id="author"
                name="author">
            <label>Date Added</label> <input type="text" id="addedDate"
                name="addedDate">
        </p>
        <p>
            <input type="submit" id="addNew" value="Submit">
        </p>
    </form>  
<script type="text/javascript">
    
       function getBook(){
          $.ajax({
                type : "GET",
                contentType : "application/json; charset=utf-8",
                url : "http://localhost:8087/books/v1",
                cache : false,
                success : function(data) {
                    console.log(data);
                    var tr=[];
                    for (var i = 0; i < data.length; i++) {
                        tr.push('<tr>');
                        tr.push('<td>' + data[i].id + '</td>');
                        tr.push('<td>' + data[i].title + '</td>');
                        tr.push('<td>' + data[i].author + '</td>');
                        tr.push('<td>' + data[i].addedDate + '</td>');
                        tr.push('<td><button class=\'edit\'>Edit</button>&nbsp;&nbsp;<button class=\'delete\' id=' + data[i].id + '>Delete</button></td>');
                        tr.push('</tr>');
                    }
                    $('table').append($(tr.join('')));
                },
                error : function() {
                    $('#err')
                            .html('<span style=\'color:red; font-weight: bold; font-size: 30px;\'>Error updating record')
                            .fadeIn()
                            .fadeOut(4000, function() {
                                $(this).remove();
                            });
                }
            });
       }
       function postBook(){
           $(document).delegate('#addNew', 'click', function(event) {
                event.preventDefault();
            /* var name = $('#name').val();*/
            var formData={
                     title : $('#title').val(),
                     addedDate : $('#addedDate').val(),
                     author:{
                      name: $('#name').val()
                     }
            }   
            
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: "http://localhost:8087/books/v1",
                /* data: JSON.stringify({'bookName': name})*/
                data: JSON.stringify(formData),
                cache: false,
                success: function(result) {
                    $("#msg").html( "<span style='color: green'>Book added successfully</span>" );
                    window.setTimeout(function(){location.reload()},1000)
                },
                error: function(err) {
                    $("#err").html( "<span style='color: red'>SOME error occured!</span>" );
                }
            });
           });    
       }
       </script>
       </body>  
       
</html>