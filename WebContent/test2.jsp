<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>jQuery UI Autocomplete - Default functionality</title>
  <script src="js/jquery-1.10.2.js"></script>
  <script src="js/jquery-ui.js"></script>
  <link rel="stylesheet" href="css/jquery-ui.css">
  <script>
  $(function() {
    var availableTags = [
                         {
                             "value": "Jurassic Park",
                             "label": "Jurassic Park"
                         },
                         {
                             "value": "Miss Congeniality 2: ARMED AND FABULOUS",
                             "label": "Miss Congeniality 2: ARMED AND FABULOUS"
                         },
                         {
                             "value": "Eternal Sunshine of the Spotless Mind",
                             "label": "Eternal Sunshine of the Spotless Mind"
                         },
                         {
                             "value": "The Princess Bride",
                             "label": "The Princess Bride"
                         },
                         {
                             "value": "From Russia with Love",
                             "label": "From Russia with Love"
                         },
                         {
                             "value": "Octopussy",
                             "label": "Octopussy"
                         },
                         {
                             "value": "Assault on Precinct 13",
                             "label": "Assault on Precinct 13"
                         },
                         {
                             "value": "The Polar Express",
                             "label": "The Polar Express"
                         },
                         {
                             "value": "External Sunshine of the Spotless Mind",
                             "label": "External Sunshine of the Spotless Mind"
                         },
                         {
                             "value": "2001: A Space Odyssey",
                             "label": "2001: A Space Odyssey"
                         }
                     ]
    $( "#tags" ).autocomplete({
      source: availableTags
    });
  });
  </script>
</head>
<body>
 
<div class="ui-widget">
  <label for="tags">Tags: </label>
  <input id="tags">
</div>
 
 
</body>
</html>