<!DOCTYPE html>
<html>
<head>
    <meta http-eqiv='content-type' content='text/html;charset=utf-8'>
    <title>chefrecentupdates</title>
    <link rel=stylesheet href="http://jashkenas.github.com/docco/resources/docco.css">
</head>
<body>
<div id=container>
    <div id=background></div>
    <table cellspacing=0 cellpadding=0>
    <thead>
      <tr>
        <th class=docs><h1>chefrecentupdates</h1></th>
        <th class=code></th>
      </tr>
    </thead>
    <tbody>
        <tr><td class='docs'><p>Enable verbose mode if you want a bit more detail about what happened</p>

</td><td class=code><div class=highlight><pre>
<span class="c">#!/bin/bash</span>

<span class="nv">VERBOSE</span><span class="o">=</span>0
<span class="k">if</span> <span class="o">[</span> x<span class="nv">$1</span> <span class="o">==</span> x<span class="s2">&quot;-v&quot;</span> <span class="o">]</span>
<span class="k">then</span>
<span class="k">    </span><span class="nv">VERBOSE</span><span class="o">=</span>1
<span class="k">fi</span>

<span class="nb">echo</span> <span class="s2">&quot;Finding Chef client logs...&quot;</span>
</pre></div></td></tr><tr><td class=docs>

<p>For each Chef client log file... 
You may need to update your path for this one. </p>

</td><td class=code><div class=highlight><pre>
<span class="k">for </span>i in <span class="sb">`</span>ls -rt /var/log/chef/client.log*<span class="sb">`</span>
<span class="k">do</span>
</pre></div></td></tr><tr><td class=docs>

<p>Find the part of the file where the resources are updated. </p>

</td><td class=code><div class=highlight><pre>
    <span class="nv">COUNT</span><span class="o">=</span><span class="sb">`</span>zgrep -A 20 <span class="s2">&quot;Resources updated this run&quot;</span> <span class="nv">$i</span> | grep <span class="s2">&quot;INFO:  &quot;</span> | wc -l<span class="sb">`</span>
    <span class="k">if</span> <span class="o">[</span> <span class="nv">$COUNT</span> -gt 0 <span class="o">]</span> 
    <span class="k">then</span>
<span class="k">        </span><span class="nb">echo</span> <span class="s2">&quot;$COUNT resources updated in $i:&quot;</span>
        zgrep -A 20 <span class="s2">&quot;Resources updated this run&quot;</span> <span class="nv">$i</span> | grep <span class="s2">&quot;INFO:  &quot;</span> 
        <span class="nb">echo</span>
<span class="nb">    </span><span class="k">else</span>
<span class="k">        if</span> <span class="o">[</span> <span class="nv">$VERBOSE</span> -eq 1 <span class="o">]</span> 
        <span class="k">then</span>
<span class="k">            </span><span class="nb">echo</span> <span class="s2">&quot;Nothing updated in $i&quot;</span>
            <span class="nb">echo</span>
<span class="nb">        </span><span class="k">fi</span>
<span class="k">    fi</span>
<span class="k">done</span>



</pre></div></td></tr><tr><td class=docs>

</td><td class=code><div class=highlight><pre>

</pre></div></td></tr><tr><td class=docs></td><td class='code'></td></tr>
    </tbody>
    </table>
</div>
</body>
</html>
