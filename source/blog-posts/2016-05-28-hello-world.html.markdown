---
title: Hello World
date: 2016-05-28 03:42 UTC
tags: welcome
category: Misc
---
Welcome to my blog. In the times to come, this space on my little home page would contain (hopefully) interesting articles on the myraid of things that interest me. So stay tuned!

<pre><code class="java">
 public void welcome() {
  welcome(); //Welcome forever since ye so precious....
 }
</code></pre>


<?php
    header('Access-Control-Allow-Origin: *');
    $url = "https://apps.abhis.ws/gitlab-snipetter-1.0/getSnippet?projectid=18&snippetid=4";
    $response = file_get_contents($url);
    $obj = json_decode($response);
?>
<pre><code class="language-java"><?php echo $obj->{'content'} ?></code></pre>