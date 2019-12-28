$(document).ready( function () {
	 var table = $('#pcrTable').DataTable({
			"sAjaxSource": "/pcrdata",
			"sAjaxDataProp": "",
			"order": [[ 0, "asc" ]],
			"aoColumns": [
			      { "mData": "symbol"},
		          { "mData": "currentDate" },
				  { "mData": "pcrEODNSE" }
			]
	 })
});