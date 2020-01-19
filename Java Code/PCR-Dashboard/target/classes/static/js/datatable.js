$(document).ready( function () {
	 var table = $('#pcrTable').DataTable({
			"sAjaxSource": "/pcrdata",
			"sAjaxDataProp": "",
			"order": [[ 0, "asc" ]],
			"onkeyup":searchFuncion,
			"aoColumns": [
			      { "mData": "symbol"},
		          { "mData": "currentDate" },
				  { "mData": "pcrEODNSE" }
			]
	 })
});

var searchFuncion = function(){
		   var searchTerm = this.value.toUpperCase()
		   if (!searchTerm) {
			   table.draw();   
		     return;
		   }
		   
	$.fn.dataTable.ext.search.push(function(settings, data, dataIndex) {
		      for (var i=0;i<data.length;i++) {
		         if (data[i].toUpperCase() == searchTerm) return true
		      }
		      return false
		   })
		   table.draw();   
		   $.fn.dataTable.ext.search.pop()
		};

// $('#pcrTable_filter input').unbind().bind('keyup', searchFuncion );
		
		//$('#pcrTable_filter input').on('keyup', searchFuncion );
		
		//$('#pcrTable_filter input').onkeyup = searchFuncion ;
		
// $('.pcrTable_filter input').on('keyup', searchFuncion );


 //$( pcrTable.table().container() ).on( 'keyup', 'dataTables_filter input', searchFuncion);