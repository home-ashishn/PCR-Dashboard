$(document).ready( function () {
	 var table = $('#pcrOTMTable').DataTable({
			"sAjaxSource": "/pcrdata-otm",
			"sAjaxDataProp": "",
			"order": [[ 0, "asc" ]],
			"oSearch": {"bSmart": false},
			"aoColumns": [
			      { "mData": "symbol"},
		          { "mData": "currentDate" },
				  { "mData": "pcrOTMWhole" },
				  { "mData": "pcrOTMCurrentMonth" },
				  { "mData": "pcrOTMNextMonth" },
				  { "mData": "pcrOTMCurrentWeek" },
				  { "mData": "pcrOTMNextWeek" }
			]
	 
			
	 });
	 


