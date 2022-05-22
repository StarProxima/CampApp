<?php
$mysql_host = "localhost";
$mysql_user = "rustamxa_test";
$mysql_password = "test";
$mysql_database = "rustamxa_test";


$mysqli = new mysqli($mysql_host, $mysql_user, $mysql_password, $mysql_database);
print($mysqli->connect_error);
$mysqli->set_charset('utf8');
//mysqli_query($resource, 'set names utf8 collate utf8_unicode_ci');

function fixSQLinjection($string)
{
    global $mysqli;
    
    $str = $string;
    $str = str_replace(array(' ','(', ')', '}', '{', ']', '[','-'), '', $str);
    $str = trim($str);
    $str = $mysqli->real_escape_string($str);
    $str = htmlspecialchars($str, ENT_QUOTES);

    return $str;
}

if (isset($_GET["action"]))
{
    $action = $_GET['action'];

    if ($action == "get_timetable_json")
    {
        if (isset($_GET["index"])) { 
            $index = $_GET['index'];
        }
        if (isset($_GET["weekday"])) { 
            $weekday = $_GET['weekday'];
        }
    }
    else if ($action == "get_all_eventToTimeTable")
    {
    }
    else if ($action == "get_avg_score_for_timetable_event")
    {
      if (isset($_GET["index"])) { 
            $index = $_GET['index'];
        }
        if (isset($_GET["date"])) { 
            $date = $_GET['date'];
        }
      	if (isset($_GET["dayCount"])) { 
            $dayCount = $_GET['dayCount'];
        }
    }
    else if ($action == "get_all_reviews_for_timetable_event")
    {
      if (isset($_GET["index"])) { 
            $index = $_GET['index'];
        }
        if (isset($_GET["date"])) { 
            $date = $_GET['date'];
        }
      	if (isset($_GET["dayCount"])) { 
            $dayCount = $_GET['dayCount'];
        }
    }
  	else if ($action == "get_all_achievements")
    {
    }
    else if ($action == "get_child_achievements")
    {
      if (isset($_GET["index"])) { 
            $index = $_GET['index'];
        }
    }
    else if ($action == "get_eventToTimetable_info")
    {
      if (isset($_GET["index"])) { 
            $index = $_GET['index'];
        }
    }
  else if ($action == "add_review")
    {
      if (isset($_GET["childInd"])) { 
            $index = $_GET['childInd'];
        }
    if (isset($_GET["starCount"])) { 
            $starCount = $_GET['starCount'];
        }
    if (isset($_GET["textReview"])) { 
            $textReview = $_GET['textReview'];
        }
     if (isset($_GET["date"])) { 
            $date = $_GET['date'];
        }
  	if (isset($_GET["eventInd"])) { 
            $eventInd = $_GET['eventInd'];
        }
    }
   	else if ($action == "get_marked_achievements_for_child")
    {
      if (isset($_GET["index"])) { 
            $index = $_GET['index'];
        }
    }
  
}

if (isset($_POST["action"])) 
{ 
    $action = $_POST['action'];
	
    if ($action == "create_new_game")
    {
        if (isset($_POST["login"])) { 
            $login = $_POST['login'];
        }
        if (isset($_POST["password"])) { 
            $password = $_POST['password'];
        }
        if (isset($_POST["game"])) { 
            $game = $_POST['game'];
        }
      if (isset($_POST["eventInd"])) { 
            $eventInd = $_POST['eventInd'];
        }
      
    }
 
    if(!is_numeric($float_z))
        $float_z = -1; // случай спасения от инъекции
   if(!is_numeric($num))
        $num = -1; 
  
}



$error_messages_1 = "Нет такого расписания или оно пустое";

//$hash_password = hash('sha256', $password);
if ($action == get_timetable_json && $index != null && $weekday != null )
{

  	$q = $mysqli->query("SELECT name FROM timeTable Where timeTable.ind = ".$index);
    if ($q->num_rows != 0)
    {
      	$name = $q->fetch_assoc()[name];
        $checkQ = $mysqli->query("SELECT weekdays FROM eventsOfTimeTable Inner Join eventToTimeTable on eventToTimeTable.ind = eventInd AND timeTableInd = ". $index ." ORDER BY fromTime");
        $infoQ = $mysqli->query("SELECT eventInd, fromTime, toTime, name, description, urlMap, urlPhoto FROM eventsOfTimeTable Inner Join eventToTimeTable on eventToTimeTable.ind = eventInd AND timeTableInd = ". $index ." ORDER BY fromTime");
       $json ="{ \"tableName\": \"".$name."\", \"events\" : ";
      
      	if ($infoQ->num_rows != 0 )
        {
          
            while($infoQRow=$infoQ->fetch_assoc())
            { 
             $checkQRow=$checkQ->fetch_assoc();
             if ($checkQRow["weekdays"] & pow(2,$weekday-1) != 0)
             	$output[]=$infoQRow;
            } 
          
        	$json_timetables = json_encode($output,JSON_UNESCAPED_UNICODE);
            $json = $json.$json_timetables."}";
           print($json);
          
        }
        else
        { 
            print("{\"error\":{\"code\":1,\"message\":\"$error_messages_1\"}}"); 
        }
    }
    else
    { 
        print("{\"error\":{\"code\":1,\"message\":\"$error_messages_1\"}}"); 
    }
  
}
else if ($action == get_all_eventToTimeTable)
{
  	$infoQ = $mysqli->query("SELECT ind, name FROM eventToTimeTable");
  
  	while($infoQRow=$infoQ->fetch_assoc())
    { 
        $output[]=$infoQRow;
    } 
	print(json_encode($output,JSON_UNESCAPED_UNICODE));
}
else if ($action == get_avg_score_for_timetable_event && $index != null && $date != null && $dayCount != null )
{
  	$infoQ = $mysqli->query("SELECT score, date FROM reviews where eventInd = ".$index);
  	$count = 0;
    $sum = 0;
  
  	while($infoQRow=$infoQ->fetch_assoc())
    { 
        $interval = (new DateTime($date))->diff( new DateTime($infoQRow['date']));
    
     if ($interval->format('%R') == "+" && (int)($interval->format('%a')) <= (int)$dayCount)
     {
       $count +=1;
       $sum += $infoQRow['score'];
     }
    } 
  	if ($count !=0)
		print($sum/$count);
    else
      print('0');
}
else if ($action == get_all_reviews_for_timetable_event && $index != null && $date != null && $dayCount != null)
{
  	$infoQ = $mysqli->query("SELECT score, date, comments FROM reviews where eventInd = ".$index);
    $count = 0;
  	while($infoQRow=$infoQ->fetch_assoc())
    { 
     $interval = (new DateTime($date))->diff( new DateTime($infoQRow['date']));
    
     if ($interval->format('%R') == "+" && (int)($interval->format('%a')) <= (int)$dayCount)
     {
       $count +=1;
       $output[]=$infoQRow;
     }
    } 
  	if ($count !=0)
		print(json_encode($output,JSON_UNESCAPED_UNICODE));
    else
        print("[]");
}
else if ($action == get_all_achievements)
{
  	$infoQ = $mysqli->query("SELECT ind, name, scores, urlPhoto, description FROM achievements");
  
  	while($infoQRow=$infoQ->fetch_assoc())
    { 
        $output[]=$infoQRow;
    } 
	print(json_encode($output,JSON_UNESCAPED_UNICODE));
}
else if ($action == get_child_achievements && $index != null)
{
  	$infoQ = $mysqli->query("SELECT ind, urlPhoto, getData FROM achievementsAndChildren Inner Join achievements 
    on achievements.ind = achievementsAndChildren.achievementInd Where childInd = ".$index);
  
  	while($infoQRow=$infoQ->fetch_assoc())
    { 
        $output[]=$infoQRow;
    } 
	print(json_encode($output,JSON_UNESCAPED_UNICODE));
}
else if ($action == get_eventToTimetable_info && $index != null)
{
  	$infoQRow = $mysqli->query("SELECT name, description, urlPhoto FROM eventToTimeTable Where ind = ".$index)->fetch_assoc();
  
	print("{\"name\":\"".$infoQRow[name]."\", \"description\":\"".$infoQRow[description]."\",\"urlPhoto\":\"".$infoQRow[urlPhoto]."\"}");
}
else if ($action == add_review && $index != null && $starCount != null && $textReview != null && $eventInd != null && $date != null)
{
  	$check = $mysqli->query("SELECT * FROM reviews Where childInd = ".$index." And eventInd = ".$eventInd)->num_rows;
  	if ($check != 0) {
      print("UPDATE reviews SET `date` = \"".$date."\", `score` = ".$starCount.", `comments` = \"".$textReview."\" WHERE `childInd` = ".$index." AND `eventInd` = ".$eventInd);
      $mysqli->query("UPDATE reviews SET `date` = \"".$date."\", `score` = ".$starCount.", `comments` = \"".$textReview."\" WHERE `childInd` = ".$index." AND `eventInd` = ".$eventInd);
      
    } else {
      print("INSERT INTO reviews (`eventInd`,`date`,`score`,`comments`,`childInd`) VALUES (".$eventInd.",\"".$date."\",".$starCount.",\"".$textReview."\",".$index.")");
      $mysqli->query("INSERT INTO reviews (`eventInd`,`date`,`score`,`comments`,`childInd`) VALUES (".$eventInd.",\"".$date."\",".$starCount.",\"".$textReview."\",".$index.")");
    }
	print("{\"error\":{\"code\":0,\"message\":\"\"}}"); 
}
else if ($action == get_marked_achievements_for_child && $index != null)
{
  	$infoQ = $mysqli->query("SELECT name, `description`, scores, urlPhoto, (achievementsAndChildren.childInd = ".$index.") as \"isReceived\", getData
    FROM achievements LEFT OUTER Join achievementsAndChildren on achievements.ind = achievementsAndChildren.achievementInd GROUP BY name");
  
  	while($infoQRow=$infoQ->fetch_assoc())
    { 
      $output[]=$infoQRow;
    } 
	print(json_encode($output,JSON_UNESCAPED_UNICODE));
}
$mysqli->close();
?>