/**
 * Created by lrlarson on 10/9/14.
 */

var dataHost = "data/cageData.cfc";

var title = '';
var keyword = -1;
var publishDate = -1;
var searchString = '';
var author = '';
var publisher = '';
var editor = '';
var translator = '';
var randomLoad = 0;


var handlePageLoad = function(){
    checkLibState();
    getControlValuesInitial();
    getFilteredValues();
}

var handleSearchChange = function(event) {
    randomLoad = 0;
    getControlValues();
    getFilteredValues();

}

var getFilteredValues = function(){
    $('#showBooks').hide();
    $('#hideBooks').show();
   if (randomLoad == 0){
    $.ajax({
        url: dataHost,
        data: {
            method: 'searchTitles',
            returnFormat: 'json',
            title:title,
            keyword:keyword,
            publishDate:publishDate,
            searchString:searchString,
            author:author,
            publisher:publisher,
            editor:editor,
            translator:translator
        },
        method: 'GET',
        dataType: "json",
        async: true,
        success: function (d, r, o) {
            workReturn = $.serializeCFJSON({
                data: d
            });

            var numberOfRecords = {
                number: workReturn.data.length
            };

            console.log(workReturn);


            var booksTemplateScript = $('#books-template').html();
            booksTemplate= Handlebars.compile(booksTemplateScript);
            $('#booksDisplay').empty();
            $('#booksDisplay').append(booksTemplate(workReturn));

            $('#showBooks').show();
            $('#hideBooks').hide();
            $('#titlesText').text(numberOfRecords.number + ' Books Selected');    

        },
        error:function(d,r,o){
            console.log(d,r,o);
        }
    
    });
   }else{// Random load ----
         $.ajax({
        url: dataHost,
        data: {
            method: 'getRandomTitles',
            returnFormat: 'json'
        },
        method: 'GET',
        dataType: "json",
        async: true,
        success: function (d, r, o) {
            workReturn = $.serializeCFJSON({
                data: d
            });

            var numberOfRecords = {
                number: workReturn.data.length
            };

            console.log(workReturn);


            var booksTemplateScript = $('#books-template').html();
            booksTemplate= Handlebars.compile(booksTemplateScript);
            $('#booksDisplay').empty();
            $('#booksDisplay').append(booksTemplate(workReturn));

            $('#showBooks').show();
            $('#hideBooks').hide();
            $('#titlesText').text('10 Random Books Selected. (Click Reset to see another 10, or use Search By)');

        },
        error:function(d,r,o){
            console.log(d,r,o);
        }
    
    });
   
   }
}




var getControlValues = function(){
    title = $('#selectTitles').val();
    keyword = $('#selectKeyword').val();
    publishDate = $('#selectDate').val();
    searchString = $('#searchInput').val();
    author = $('#searchAuthor').val();
    publisher = $('#publisher').val();
    editor = $('#editor').val();
    translator = $('#translator').val();
    var time = Math.round(new Date().getTime() / 1000);

    //State
    var searchState = [];
    var isLocalAvailable = isLocalStorageNameSupported();
    if (isLocalAvailable) {
        if (localStorage.getItem('libState')) {
            retrievedObject = localStorage.getItem('libState');
            searchState = JSON.parse(retrievedObject);

        }
    }
    var searchItem = {
        title: title,
        keyword: keyword,
        publishDate: publishDate,
        searchString: searchString,
        author: author,
        publisher:publisher,
        editor:editor,
        translator:translator,
        minute: time
    };
    searchState.push(searchItem);
    if (isLocalAvailable) {
        localStorage.setItem('libState', JSON.stringify(searchState));
        //console.log(searchState);

        //end state
    }



}

var getControlValuesInitial = function(){
    title = $('#selectTitles').val();
    keyword = $('#selectKeyword').val();
    publishDate = $('#selectDate').val();
    searchString = $('#searchInput').val();
    author = $('#searchAuthor').val();
    publisher = $('#publisher').val();
    editor = $('#editor').val();
    translator = $('#translator').val();
    var time = Math.round(new Date().getTime() / 1000);




}


var     checkLibState = function(){
    var searchState = [];
    if (localStorage.getItem('libState')){
        retrievedObject = localStorage.getItem('libState');
        searchState = JSON.parse(retrievedObject);
        //alert(searchState);
    }

    if (searchState.length){
        var stateRecords = searchState.length;
        //alert('There is a search state' + searchState.length);
        $.each(searchState,function(index, obj) {

            console.log('in the each  ' +obj.minute + ' ' + index);
            if (index == stateRecords - 1){
                console.log('index found');
                //check here for time record
                var thisMoment = Math.round(new Date().getTime() / 1000);
                thatMoment = obj.minute;
                if (thisMoment - thatMoment < 15){
                    randomload = 0;
                    title = obj.title;
                    keyword =  obj.keyword;
                    publishDate = obj.publishDate;
                    searchString =  obj.searchString;
                    author =  obj.author;
                    publisher = obj.publisher;
                    editor = obj.editor;
                    translator = obj.translator;
                    updateControlValues();
                }else{
                //alert('load random?');
                randomLoad = 1;
                }
            }

        });
    }else{
       randomLoad = 1; 
    }
}


var updateControlValues = function(){
    $('#selectTitles').val(title);
    $('#selectKeyword').val(keyword);
    $('#selectDate').val(publishDate);
    $('#searchInput').val(searchString);
    $('#searchAuthor').val(author);
    $('#publisher').val(publisher);
    $('#editor').val(editor);
    $('#translator').val(translator);

}


var setControlValues = function(){
    title = $('#selectTitles').val();
    keyword = $('#selectKeyword').val();
    publishDate = $('#selectDate').val();
    searchString = $('#searchInput').val();
    author = $('#searchAuthor').val();
    publisher = $('#publisher').val();
    editor = $('#editor').val();
    translator = $('#translator').val();



}
var reset = function(){
    //alert('reset called');

    controls = $('select');
    for (i=0;i<controls.length;i++){
        if (controls[i].id == 'selectTitles'){
            controls[i].value = '';
        }else{
            controls[i].value = -1;
          //  $('#'  + controls[i].id).css('background-color','#8c8c84');
        }
    }
    controlTexts = $('input[type="text"]');
    for (i=0;i<controlTexts.length;i++){
        controlTexts[i].value = '';
    }
    setControlValues();
    // to handle stored search parameters
    getControlValues();
    randomLoad = 1;
    getFilteredValues();
    
}




var substringMatcher = function(strs) {
    return function findMatches(q, cb) {
        var matches, substrRegex;

        matches = [];

       // q = '^' + q;
        

        // regex used to determine if a string contains the substring `q`
        substrRegex = new RegExp(q, 'i');

        $.each(strs, function(i, str) {
            if (substrRegex.test(str)) {
                matches.push({ value: str });
            }
        });

        cb(matches);
    };
};

function isLocalStorageNameSupported()
{
    var testKey = 'test', storage = window.sessionStorage;
    try
    {
        storage.setItem(testKey, '1');
        storage.removeItem(testKey);
        return true;
    }
    catch (error)
    {
        return false;
    }
}