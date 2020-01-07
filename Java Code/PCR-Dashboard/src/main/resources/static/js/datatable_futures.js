$(document).ready( function () {
	 var table = $('#futuresInfoTable').DataTable({
			"sAjaxSource": "/futures-info-data",
			"sAjaxDataProp": "",
			"order": [[ 0, "asc" ]],
			"oSearch": {"bSmart": false},
			"aoColumns": [
			      { "mData": "symbol"},
		          { "mData": "currentDate" },
				  { "mData": "expiryDate" },
				  { "mData": "totalOI" },
				  { "mData": "oiChange" },
				  { "mData": "futuresPremium" },
				  { "mData": "prevDate" },
				  { "mData": "dayPremiumChange" }
			]
	 
			
	 });
	 
		oSettings.aoPreSearchCols[ iCol ].sSearch = "^\\s*"+'1'+"\\s*$";
		oSettings.aoPreSearchCols[ iCol ].bRegex = false;
		oSettings.aoPreSearchCols[ iCol ].bSmart= false;});

