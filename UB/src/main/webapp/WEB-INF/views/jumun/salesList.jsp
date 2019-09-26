<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>POS</title>
<link rel="stylesheet" href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />
<!-- <link rel="stylesheet" type="text/css" href="https://uicdn.toast.com/tui.pagination/v3.3.0/tui-pagination.css" /> -->
</head>
<body>


salesList
<div id="grid"></div>
    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>
<!-- <script type="text/javascript" src="https://uicdn.toast.com/tui.code-snippet/v1.5.0/tui-code-snippet.js"></script> -->
<!-- <script type="text/javascript" src="https://uicdn.toast.com/tui.pagination/v3.3.0/tui-pagination.js"></script> -->

<script type="text/javascript">
$(document).ready(function() {
	const grid = new tui.Grid({
		el: document.getElementById('grid'),
		columns: [
			{
				header: 'Id',
				name: 'id'
			},
			{
				header: 'City',
				name: 'city'
			},
			{
				header: 'Country',
				name: 'country'
			}
		],
		data
	});
});
const data = [
	  {
	    id: '10012',
	    city: 'Seoul',
	    country: 'South Korea'
	  },
	  {
	    id: '10013',
	    city: 'Tokyo',
	    country: 'Japan'    
	  },
	  {
	    id: '10014',
	    city: 'London',
	    country: 'England'
	  },
	  {
	    id: '10015',
	    city: 'Ljubljana',
	    country: 'Slovenia'
	  },
	  {
	    id: '10016',
	    city: 'Reykjavik',
	    country: 'Iceland'
	  }
	];
</script>
</body>
</html>