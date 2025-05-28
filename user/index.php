<?php
// user/index.php
// Just a navigation page—no DB calls needed here
?>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>CS306 Phase III – Triggers & Procedures</title>
</head>
<body>
  <h1>Group 31 – Phase III Interface</h1>

  <h2>Test Triggers</h2>
  <ul>
    <li><a href="trigger1.php">trg_after_review_insert</a></li>
    <li><a href="trigger2.php">trg_before_movie_insert</a></li>
    <li><a href="trigger3.php">trg_after_rating_update</a></li>
    <li><a href="trigger4.php">trg_before_belongs_insert</a></li>
    <li><a href="trigger5.php">trg_before_review_insert</a></li>
  </ul>

  <h2>Run Stored Procedures</h2>
  <ul>
    <li><a href="sp1.php">get_movies_by_genre</a></li>
    <li><a href="sp2.php">average_rating_for_movie</a></li>
    <li><a href="sp3.php">movie_awards_summary</a></li>
    <li><a href="sp4.php">top_rated_movies</a></li>
    <li><a href="sp5.php">box_office_summary_by_director</a></li>
  </ul>

  <p>
    <a href="../support_tickets/tickets.php">Submit/View Support Tickets</a>
    &nbsp;|&nbsp;
    <a href="../admin/index.php">Admin: All Tickets</a>
  </p>
</body>
</html>
