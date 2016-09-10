<html>
<head>
<title>160.16.119.131</title>
</head>
<body>
<p>IDFA => <input id="idfa" type="text" value="20454994-6C8E-450D-872D-24E29D47D724" size="50"></input></p>
<?php
  if(isset($_GET['idfa']) && isset($_GET['adId'])) {
    $res = generateQuery($_GET['idfa'], $_GET['adId']);
    echo $res . "<br/>";
  }
  ?>
<img src="images/ad1.jpg" onClick="runPHP(1)">
<img src="images/ad2.gif" onClick="runPHP(2)">
<img src="images/ad3.jpg" onClick="runPHP(3)">
<img src="images/ad4.jpg" onClick="runPHP(4)">
<img src="images/ad5.jpg" onClick="runPHP(5)">
<img src="images/ad6.jpg" onClick="runPHP(6)">
<img src="images/ad7.jpg" onClick="runPHP(7)">
</body>
</html>

<script type="text/javascript">
function runPHP(adId) {
  console.log("runPHP");
  var idfa = document.getElementById("idfa").value;
  window.location.href = 'ad.php?idfa=' + idfa + '&adId=' + adId;
}
</script>

<?php
  function generateQuery($idfa, $adId) {
    $sql = "INSERT INTO relay_idfa_ad (idfa,ad_id) values ('${idfa}',${adId})";
    sendQuery($sql);
    return $sql;
  }

  function sendQuery($sql) {
    $con=mysqli_connect("127.0.0.1","root","root","adokore_db");
    if (mysqli_connect_errno()) {
      echo "Failed to connect to MySQL: " . mysqli_connect_error();
    }
    mysqli_query($con, $sql);
    mysqli_close($con);
  }
  ?>