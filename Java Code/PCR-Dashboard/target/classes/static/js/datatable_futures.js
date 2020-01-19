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
	 
	 $('.dataTables_filter input').unbind().bind('keyup', function() {
		   var searchTerm = this.value.toLowerCase()
		   if (!searchTerm) {
			   table.draw();   
		     return;
		   }
		   $.fn.dataTable.ext.search.push(function(settings, data, dataIndex) {
		      for (var i=0;i<data.length;i++) {
		         if (data[i].toLowerCase() == searchTerm) return true
		      }
		      return false
		   })
		   table.draw();   
		   $.fn.dataTable.ext.search.pop()
		})
	 


