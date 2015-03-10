var au = [];

initMurphy = function() {
    murphygame = "1. e4 Nh6 2. Nh3 Rg8 3. Rg1 Nc6 4. Nc3 Ne5 5. Nd5 Rh8 6. Rh1 Nc6 7. Nc3 Ng8 8. Nb1 Nb8 9. Ng1 e6 10. g3 Ne7 11. Ne2 Ng6 12. g4 Be7 13. Ng3 d6 14. Be2 Qd7 15. d3 Kd8 16. Qd2 Qe8 17. Kd1 Nd7 18. Nc3 Rb8 19. Rb1 Nb6 20. Na4 Bd7 21. b3 Rg8 22. Rg1 Kc8 23. Bb2 Qf8 24. Kc1 Be8 25. Bc3 Nh8 26. b4 Bd8 27. Qh6 Na8 28. Qf6 Ng6 29. Be5 Be7 30. Nc5 Kd8 31. Nh1 Bd7 32. Kb2 Rh8 33. Kb3 Bc8 34. Ka4 Qe8+ 35. Ka5 Nb6 36. Bf4 Nd7 37. Qc3 Ra8 38. Na6 Bf8 39. Kb5 Ne7 40. Ka5 Nb8 41. Qc6 Ng8 42. Kb5 Ke7 43. Ka5 Qd8";
    chess.readPGN(murphygame, true);
    chess.navigate(-86);
    console.log("initMurphy");
    CAJsetAudioQuality(2);
}


//var sounddir = "../plain-notes/"
//var soundnames = ["A4", "ASHARP4", "B4", "C4", "C5", "CSHARP4", "CSHARP5", "D4", "D5", "DSHARP4", "DSHARP5", "E4", "F4", "FSHARP4", "G4", "GSHARP4"]
var sounddir = "clean-mono/";
var soundnames = ["HARPSICHORD1", "HARPSICHORD2", "HARPSICHORD3", "HARPSICHORD4", "hash1", "hash2", "hornandgtrs1", "hornandgtrs2",  "Sys1Mono", "Sys3Mono", "Sys4Mono", "Sys5Mono", "TrainTrack1", "TrainTrack2", "TrainTrack3", "TrainTrack4"];

var soundsloaded = 0;
// start on low quality
var audiotracks = 4;

function shuffleArray(array) {
    for (var i = array.length - 1; i > 0; i--) {
        var j = Math.floor(Math.random() * (i + 1));
        var temp = array[i];
        array[i] = array[j];
        array[j] = temp;
    }
}

// Just shuffle once
shuffleArray(soundnames);

makeSound = function(name,id) {
    types = [ "mp3","aac", "ogg"];
    for(var i = 0; i < types.length; ++i)
    {
        var sURL = name + "." + types[i];
        soundManager.defaultOptions.loops=9999;
        soundManager.defaultOptions.autoLoad = true;
        soundManager.defaultOptions.autoPlay = true;
        soundManager.defaultOptions.volume = 0;
        if (soundManager.canPlayURL(sURL)) {
            var s = soundManager.createSound( { id: id, url: sURL 
                , onplay: function()
                {
                    soundsloaded++;
                    var x=document.getElementById("soundstatus");
                    x.innerHTML = "Sounds Loaded: " + soundsloaded + "/" + audiotracks;
                }} );
            return s;
        }
    }
    console.log("Unable to create sound");

}


// Translate a speaker position into a pan position
panmap = function(val) 
{
    var maps = ({ 1: 0, 2: 50, 3:100, 4:50, 5:0, 6:-50, 7:-100, 8:-50 });
    return maps[val];
}

var updateMatrix = [];
var speakerlist = [];
function buildUpdateMatrix() {
    var pos = 0;
    for(var i = 0; i < 64; ++i)
    {
            var check = true;
            
            // avoid duplicates, as long as there is enough tracks to support it!
            if(audiotracks * 8 < 64)
                panval = Math.floor(Math.random()*8)+1;
            else
            {
                while(check)
                {
                    check = false;
                    panval = Math.floor(Math.random() * 8)+1;
                    for(var j = 0; j < i; ++j)
                    {
                        if(updateMatrix[j].track == pos && updateMatrix[j].panval == panval)
                            check = true;
                    }
                }
            }

            updateMatrix[i] = {track: pos, panval: panval};
            pos++;
            if(pos >= audiotracks)
                pos = 0;
    }
    shuffleArray(updateMatrix);
    console.log("Wiring: ");
    for(var i = 0; i < 8; ++i)
    {
        var line = "";
        for(var j = 0; j < 8; ++j)
        {
            var cellnum = (7-i)*8 + (7-j);
            var cell = (cellnum+1) + ": (" + (updateMatrix[cellnum].track+1) + "," + updateMatrix[cellnum].panval + ") | "; 
            line += ("          " + cell).slice(-15);
        }
        console.log(line);
    }

    console.log("Track outputs:");
    speakerlist = [];
    for(var i = 0; i < audiotracks; ++i)
    {
        var speakers = [];
        for(var j = 0; j < 64; ++j)
        {
            if(updateMatrix[j].track == i)
                speakers.push(updateMatrix[j].panval);
        }
        speakers.sort();
        speakerlist.push(speakers);
        console.log("track " + (i+1) + " connected to speakers: " + speakers);
    }
};

setupsounds = function() {
    for(var i = 0; i < audiotracks; ++i)
    {
        if(typeof(au[i])=='undefined')
            au[i] = makeSound(sounddir + soundnames[i], soundnames[i]);
    }
    for(i = audiotracks; i < soundnames; ++i)
    {
        if(typeof(au[i])=='undefined')
        {
            au[i].unload();
            delete au[i];
        }
    }
    buildUpdateMatrix();
}

CAJsetAudioQuality = function(quality) {
    if(quality == 0)
    { audiotracks = 4; }
    else if(quality == 1)
    { audiotracks = 8; }
    else if(quality == 2)
    { audiotracks = 16; }
    else
    {
        console.log("Invalid quality level");
    }
    setupsounds();
}

soundManager.setup({
  url: 'soundmanager2/swf/'
  , flashVersion: 9
  // optional: use 100% HTML5 mode where available
  // preferFlash: false,
  , onready: function() {
      setupsounds(); 
      if(window.location.search == "?murphy")
      {
        initMurphy(); 
        document.getElementById("topinfo").style.display = 'none';
      }

    }
  , ontimeout: function() {
    // Hrmm, SM2 could not start. Missing SWF? Flash blocked? Show an error, etc.?
  }
});


addEventListener("keydown", function(e) {
    if(e.keyCode == 37)
    {chess.navigate(-1); }
    if(e.keyCode == 39)
        {chess.navigate(1); }
}, false);


var newVolumes = []

var prevBoardSound = []

function chrisInitUpdate(){
    var i, cell;

    for(i = 0; i < audiotracks; ++i)
    {
        newVolumes[i] = { count: 0, pan: 0} ;
    }
    
    if(prevBoardSound.length == 0)
    {
        for(cell = 0; cell < 64; ++cell)
        {
            prevBoardSound[cell] = false;
        }
    }
    console.log("new move");
}


function chrisUpdateVolume(cell, value){
    var celloccupied = (value > 0);
    if(cell < 16 || cell >= 48)
    {
        celloccupied = !celloccupied
    }

    if(prevBoardSound[cell] != celloccupied)
    {
        console.log((updateMatrix[cell].track+1) + "," + (speakerlist[updateMatrix[cell].track].indexOf(updateMatrix[cell].panval)+1) + ":(" + (cell+1) +","+updateMatrix[cell].panval+") "+ (celloccupied ? "on" : "off"));
        prevBoardSound[cell] = celloccupied;
    }


   
    if(celloccupied)
    {
        newVolumes[updateMatrix[cell].track].count++;
        newVolumes[updateMatrix[cell].track].pan += panmap(updateMatrix[cell].panval);
    }
}

function chrisFinaliseUpdate()
{
    for(i = 0; i < audiotracks; ++i)
    {
        var val = newVolumes[i];
        var volume = 0;
        if(val.count == 1)
            volume = 50;
        else if(val.count == 2)
            volume = 75;
        else if(val.count == 3)
            volume = 90;
        else if(val.count >= 4)
            volume = 100;

        var pan = 0;
        if(val.count > 0)
        { pan = val.pan / val.count; }
        
      //  console.log(i, volume, pan);

        if(!(au[i] === undefined))
        {
            au[i].setVolume(volume);
            au[i].setPan(pan);
        }
    }
}