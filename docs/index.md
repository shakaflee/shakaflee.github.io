---
layout: default
title: Home
---

<div class="index-h2">
  <h2> Recent 6 posts</h2>
</div>

<div class="page-post">

  {% for post in site.posts limit:6 %}
    <a class ="page-post-item" href="{{ post.url }}">
      <img class = "page-post-item-img" src="{{ post.icon-img }}">
      <div class="page-post-item-text">
        <p>{{ post.title }}</p>
      </div>
    </a>
  {% endfor %}

</div>