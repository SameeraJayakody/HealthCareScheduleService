/**
 * 
 */

$(document).ready(function()
{
if ($("#alertSuccess").text().trim() == "")
{
$("#alertSuccess").hide();
}
$("#alertError").hide();
});
// SAVE ============================================
$(document).on("click", "#btnSave", function(event)
{
// Clear alerts---------------------
$("#alertSuccess").text("");
$("#alertSuccess").hide();
$("#alertError").text("");
$("#alertError").hide();
// Form validation-------------------
var status = validateItemForm();
if (status != true)
{
$("#alertError").text(status);
$("#alertError").show();
return;
}

var type = ($("#hidItemIDSave").val() == "") ? "POST" : "PUT";


$.ajax(
		{
		url : "satusAPI",
		type : type,
		data : $("#formItem").serialize(),
		dataType : "text",
		complete : function(response, status)
		{
		onItemSaveComplete(response.responseText, status);
		}
		});

});






function onItemSaveComplete(response, status)
{
if (status == "success")
{
var resultSet = JSON.parse(response);
if (resultSet.status.trim() == "success")
{
$("#alertSuccess").text("Successfully saved.");
$("#alertSuccess").show();
$("#divItemsGrid").html(resultSet.data);
} else if (resultSet.status.trim() == "error")
{
$("#alertError").text(resultSet.data);
$("#alertError").show();
}
} else if (status == "error")
{ 
$("#alertError").text("Error while saving.");
$("#alertError").show();
} else
{
$("#alertError").text("Unknown error while saving..");
$("#alertError").show();
}
$("#hidItemIDSave").val("");
$("#formItem")[0].reset();
}	



//UPDATE==========================================
$(document).on("click", ".btnUpdate", function(event)
{
$("#hidItemIDSave").val($(this).closest("tr").find('#hidItemIDUpdate').val());
$("#id").val($(this).closest("tr").find('td:eq(0)').text());
$("#stat").val($(this).closest("tr").find('td:eq(1)').text());

});

function validateItemForm()
{
// CODE
if ($("#id").val().trim() == "")
{
return "Insert schedule ID.";
}
// NAME
if ($("#stat").val().trim() == "")
{
return "Update Status.";
}
return true;
}
