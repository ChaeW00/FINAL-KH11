<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>main</title>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/bootswatch/5.2.3/journal/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">

<style>
    .datepicker table {
        width: 400px;
        height: 300px;
        font-size: 18px;
    }
</style>
</head>
<body>

<div class="container-fluid main-content">  
    <div class="col mt-4 mb-4">
        <div id="datepicker" style="margin-left: 35px;"></div>   
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>

<script>
    $(document).ready(function(){
        $('#datepicker').datepicker({ 
            beforeShowDay: function(date) {
                const now = new Date();
                if(
                    date.getFullYear() == now.getFullYear() &&
                    date.getMonth() == now.getMonth() &&
                    date.getDate() == now.getDate()
                ){
                    return { classes: 'text-primary fw-bold'};
                }
            }
        });
    });
</script>

</body>
</html>
