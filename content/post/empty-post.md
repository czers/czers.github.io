+++
title = "empty post"
description = "Empty post (everything has to start with something)"
tags = ["",""]
categories = ["drafts"]
draft = true
date = "2017-04-07T22:17:56+02:00"

+++

Testing syntax highlighting:

{{< highlight html >}}
<section id="main">
  <div>
    <h1 id="title">{{ .Title }}</h1>
    {{ range .Data.Pages }}
      {{ .Render "summary"}}
    {{ end }}
  </div>
</section>
{{< /highlight >}}
