// JavaScript Document

var length = 0;
var premiereYear = 0;
var manuscriptLocation = 0;
var ensembleType = 0;
var instrumentType = 0;
var specificInstrument = 0;
var searchString = '';
var collaborators = 0;
var recordings = 0;
var published = 0;
var numberString = 0;
var numberLimit = 0;
var cunningham = 0;
var dateDisplay = 0;

var pageRecordID = 0;



var getRadioValue = function(){
if (document.getElementById('radioNumber_0').checked){
return 1;
	} else if (document.getElementById('radioNumber_1').checked){
return 2;		
	} else if (document.getElementById('radioNumber_2').checked){
return 3;		
	}
};

var resetSearch = function(){

//document.getElementById('selectCollaborator').value = 0;
controls = $('select');
for (i=0;i<controls.length;i++){
controls[i].value = 0;	
	}
textControls = $('input:text');
	for(i=0;i<textControls.length;i++){
		textControls[i].value = '';
	}
document.getElementById('numberOfPlayers').value = '';	
updateFilters();
};

var setSort = function(){
	
};

var updateFilters = function(){
length = $('#selectLength').val();
premiereYear = $('#selectPremiere').val();
manuscriptLocation = $('#selectManuscript').val();
ensembleType = $('#selectEnsembleType').val();
instrumentType = $('#selectInstrumentType').val();
specificInstrument = $('#selectSpecificInstrument').val();
searchString = $('#stringSearch').val();
collaborators = $('#selectCollaborator').val();
recordings = $('#selectRecording').val();
//published = $('#selectPublished').val();
published = 0;
numberString = $('#numberOfPlayers').val();
if (numberString == ''){
	numberString = 0;
	}
numberLimit = getRadioValue();
cunningham = $('#selectCunningham').val();
if ($('#checkByDate').is(':checked') == true){
	dateDisplay = 1;	
}else{
	dateDisplay = 0;	
}


getFilteredWorks(length,premiereYear,manuscriptLocation,ensembleType,instrumentType,specificInstrument,searchString,collaborators,recordings,published,numberString,numberLimit,cunningham,dateDisplay);
}

var getFilteredWorks = function(length,premiereYear,manuscriptLocation,ensembleType,instrumentType,specificInstrument,searchString,collaborators,recordings,published,numberString,numberLimit,cunningham,dateDisplay){
						document.getElementById("worksTable").innerHTML = '';
						//document.getElementById("detailsTable").innerHTML = '';
						$("#pleaseClickTable").show();
						//document.getElementById("scalarDetails").innerHTML = '';
						//document.getElementById("recordingsTable").innerHTML = '';
						$("#loading").show();
						$("#pleaseClickTable").show();
						var cageProxy = new cageJSON();
						cageProxy.setCallbackHandler(getFilteredWorksReturn);
						cageProxy.setErrorHandler(myErrorHandler); 
						cageProxy.getWorks(length,premiereYear,manuscriptLocation,ensembleType,instrumentType,specificInstrument,searchString,collaborators,recordings,published,numberString,numberLimit,cunningham,dateDisplay);
}

var getFilteredWorksReturn = function(filteredWorks){

						//document.getElementById("worksTable").innerHTML = '';
						$("#loading").hide();
						
						if(filteredWorks.DATA.length > 0){
							if(filteredWorks.DATA.length < 20){
								var target = 20 - filteredWorks.DATA.length;
								
							$(".content").css("height:644px");	
							}else{
							var target = 0;	
							}
						
						for(i=0;i<filteredWorks.DATA.length;i++){ 
						var row = document.createElement("tr");
						row.id = filteredWorks.DATA[i][0];
						row.className = 'danceRow';
						var cell1 = document.createElement("td");
						cell1.className = 'tableRegularCell';
						//var cell2 = document.createElement("td");
						cell1.innerHTML = '<a href = "John-Cage-Work-Detail.cfm?work_ID=' + filteredWorks.DATA[i][0] + '">'  + filteredWorks.DATA[i][1] +'</A>';
						//cell2.innerHTML = '<i>' + filteredWorks.DATA[i][3] +'</i>';
						row.appendChild(cell1);
						//row.appendChild(cell2);
						
						document.getElementById("worksTable").appendChild(row);
						}
						if (target !=0){
							for(i=0;i<target+1;i++){
							var row = document.createElement("tr");
							row.className = 'danceRow';
							var cell1 = document.createElement("td");
							cell1.className = 'tableRegularCell';
							cell1.innerHTML = '&nbsp &nbsp';
							row.appendChild(cell1);
							document.getElementById("worksTable").appendChild(row);
							
						}
						
							}
						$('td').click(function(event){
								$('.highlight').removeClass('highlight');
								$(this).toggleClass("highlight");
								});		
						}else{
						//there are no results
						
						var row = document.createElement("tr");
						
						var cell1 = document.createElement("td");
						var cell2 = document.createElement("td");
						cell1.innerHTML = '<i>No works met the criteria...</i>';
						row.appendChild(cell1);
						document.getElementById("worksTable").appendChild(row);
						}
						
					
}

var getWorkDetails = function(work_ID){
						
						//document.getElementById("detailsTable").innerHTML = '';
						//document.getElementById("recordingsTable").innerHTML = '';
						
						//$("#loading").show();
						
						var cageProxy = new cageJSON();
						cageProxy.setCallbackHandler(getWorkDetailReturn);
						cageProxy.setErrorHandler(myErrorHandler);
						cageProxy.getWorkDetails_3(work_ID);
						/*
						var cageProxyRecording = new cageJSON();
						cageProxyRecording.setCallbackHandler(getRecordingReturn);
						cageProxyRecording.setErrorHandler(myErrorHandler);
						cageProxyRecording.getRecordSummary(work_ID);
						*/
}

var getWorkDetailReturn = function(workDetail){
	$("#pleaseClickTable").hide();
	
	detailHTML = '<tr class="danceRow">';
	detailHTML += ' <td class="tableRegularCellData">';
	detailHTML += '<span  class="field">Work Title</span><br />';
	detailHTML += '<span id="titleField"> <i>' + workDetail.DATA[0][1] + '</i> </span> </td></tr>';
	
	if (workDetail.DATA[0][2]){
	detailHTML += '<tr class="danceRow">';
	detailHTML += ' <td class="tableRegularCellData">';
	detailHTML += '<span  class="field">Alt. Title</span><br />';
	detailHTML += '<span id="dataField"> <i>'  + workDetail.DATA[0][2] + ' </i></span> </td></tr>';	
	}
	
	if (workDetail.DATA[0][3]){
	detailHTML += '<tr class="danceRow">';
	detailHTML += ' <td class="tableRegularCellData">';
	detailHTML += '<span  class="field">2nd Alt. Title</span><br />';
	detailHTML += '<span id="dataField"> <i>'  + workDetail.DATA[0][3] + ' </i></span> </td></tr>';	
	}
	
	if (workDetail.DATA[0][4]){
	detailHTML += '<tr class="danceRow">';
	detailHTML += ' <td class="tableRegularCellData">';
	detailHTML += '<span  class="field">Date</span><br />';
	detailHTML += '<span id="dataField"> '  + workDetail.DATA[0][4] + ' </span> </td></tr>';	
	}
	
	if (workDetail.DATA[0][7]){
	detailHTML += '<tr class="danceRow">';
	detailHTML += ' <td class="tableRegularCellData">';
	detailHTML += '<span  class="field">Instrumentation</span><br />';
	detailHTML += '<span id="dataField"> '  + workDetail.DATA[0][7] + ' </span> </td></tr>';
	}
	
	
	if (workDetail.DATA[0][8]){
	detailHTML += '<tr class="danceRow">';
	detailHTML += ' <td class="tableRegularCellData">';
	detailHTML += '<span  class="field">Length</span><br />';
	detailHTML += '<span id="dataField"> '  + workDetail.DATA[0][8] + ' </span> </td></tr>';	
	}
	
	if (workDetail.DATA[0][10]){
	detailHTML += '<tr class="danceRow">';
	detailHTML += ' <td class="tableRegularCellData">';
	detailHTML += '<span  class="field">Comments</span><br />';
	detailHTML += '<span id="dataField"> '  + workDetail.DATA[0][10] + ' </span> </td></tr>';
	}
	
	//document.getElementById("detailsTable").innerHTML = detailHTML;
	//document.getElementById("detailLink").innerHTML = '<a href="John-Cage-Work-Detail.cfm?work_ID=' + workDetail.DATA[0][0] + '">Details/Permalink</a>';
	linkHTML = '<a href="John-Cage-Work-Detail.cfm?work_ID=' + workDetail.DATA[0][0] + '">Details/Permalink</a>';
	$('#detailsTable').html(detailHTML);
	$('#detailLink').html(linkHTML);
}

var getRecordDetails = function(record_ID){
						
						$('#detailsTable2').html('');
						//document.getElementById("recordingsTable").innerHTML = '';
						
						//$("#loading").show();
						
						var cageProxy = new cageJSON();
						pageRecordID = record_ID;
						cageProxy.setCallbackHandler(getRecordDetailsReturn);
						cageProxy.setErrorHandler(myErrorHandler);
						cageProxy.getRecordDetails(record_ID);
						
}

var getRecordDetailsReturn = function(recordDetail){
	$('#recordingHeader').html('');
	headerHTML = ' <td class="labelCell"  height="30"> Record Detail <span style="padding-left:170px"> <a href="javascript:getRecordSummary(' + pageWorkID+ ')">Close</a></td>';
	$('#recordingHeader').html(headerHTML);
	
	if (recordDetail.DATA[0][6]){
recordDetailHTML = '    <tr class="danceRow"> <td class="tableRegularCellDataRecording">';
recordDetailHTML +=  '<img src="../db_images/Discog/DiscImages/' + recordDetail.DATA[0][6] + '" width="100" height="100" style="padding-right:5px; padding-left:90px; padding-top:15px">';
recordDetailHTML += '</td> </tr>';
	}
	
	
	if (recordDetail.DATA[0][1]){
recordDetailHTML += '<tr class="danceRow"> <td class="tableRegularCellDataRecordingData"> <span  class="field">Recording Title</span><br />';
recordDetailHTML += recordDetail.DATA[0][1] + '</td></tr>';
	}

if (recordDetail.DATA[0][3]){
recordDetailHTML += ' <tr class="danceRow"><td class="tableRegularCellDataRecordingData"><span  class="field">Label</span><br />';
recordDetailHTML +=     recordDetail.DATA[0][3] + '</td></tr>';
}


recordDetailHTML += ' <tr class="danceRow"><td class="tableRegularCellDataRecordingData"><span  class="field" >Medium</span><span style="padding-left:10px;">';
recordDetailHTML +=     recordDetail.DATA[0][2] + '</span><span  class="field" style="padding-left:20px;" > Year Released </span><span style="padding-left:10px;">';
recordDetailHTML += recordDetail.DATA[0][5] +'</span></td></tr>';

if (recordDetail.DATA[0][7]){
recordDetailHTML += ' <tr class="danceRow"><td class="tableRegularCellDataRecordingData"><span  class="field">Performers</span><br />';
recordDetailHTML +=     recordDetail.DATA[0][7] + '</td></tr>';
}

if (recordDetail.DATA[0][10]){
recordDetailHTML += ' <tr class="danceRow"><td class="tableRegularCellDataRecordingData"><span  class="field">Comments</span><br />';
recordDetailHTML +=     recordDetail.DATA[0][10] + '</td></tr>';
}

if (recordDetail.DATA[0][4]){
recordDetailHTML += ' <tr class="danceRow"><td class="tableRegularCellDataRecordingData"><span  class="field">Recording Number</span><br />';
recordDetailHTML +=     recordDetail.DATA[0][4] + '</td></tr>';
}

$('#detailsTable2').html(recordDetailHTML);	

}


var getRecordSummary = function(work_ID){
	$('#detailsTable2').html('');
						//document.getElementById("recordingsTable").innerHTML = '';
						
						//$("#loading").show();
						
						var cageProxy = new cageJSON();
						//pageRecordID = record_ID;
						cageProxy.setCallbackHandler(getRecordSummaryReturn);
						cageProxy.setErrorHandler(myErrorHandler);
						cageProxy.getRecordSummary(pageWorkID);
						

}

var getRecordSummaryReturn = function(recordSummary){
	$('#recordingHeader').html('');
	headerHTML = '  <td class="labelCell"  height="30"  >Recordings Summary (click for details) </td>';
	$('#recordingHeader').html(headerHTML);
	
	for(i=0;i<recordSummary.DATA.length;i++){
	var row = document.createElement("tr");
	row.className = 'danceRow';
	var cell1 = document.createElement("td");
	cell1.className = 'tableRegularCell';
	var cell2 = document.createElement("td");
	cell2.className = 'tableRegularCellData';	
	cell1.innerHTML = '<a href="javascript:getRecordDetails(' + recordSummary.DATA[i][0] +')">'+ recordSummary.DATA[i][1] + '</a>';
	row.appendChild(cell1);
	cell2.innerHTML = '<a href="javascript:getRecordDetails(' + recordSummary.DATA[i][0] +')"><img src="../db_images/Discog/DiscImages/' + recordSummary.DATA[i][3] + ' " width="75" height="75" style="padding-right:5px"></a>';
	row.appendChild(cell2);
	document.getElementById("detailsTable2").appendChild(row);
	}
}

// Error handler for the asynchronous functions. 
            var myErrorHandler = function(statusCode, statusMsg) 
            { 
                alert('Status: ' + statusCode + ', ' + statusMsg); 
            } 
	
	
