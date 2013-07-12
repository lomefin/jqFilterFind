Jquery Filter Finder
=======================
by @lomefin

JQFF tries to help people solve the problem of finding or filtering through sets of DOM elements.
It uses micro-data as its main component an requires a few lines of code to run.

Fastest way to use
--------------------

Download the latest file (lib/FilterFinder.js)

Add the script in your page
```<script src="[SCRIPT_DIR]/FilterFinder.js"></script>```

Initialize the script

```
<script>
    $(function(){
		new FilterFinder().bind();
	});
</script>
```

This assumes three things:

1. You've got jquery
2. You've got your elements with the class ```card``` and it has some info on the ```data-lookup``` field
3. You've got a container for the toolkit of class ```filter-finder-container```

Example of elements

```
<div class="filter-finder-container"></div>
<div class="card" data-lookup="Banana">
	<h1>I love bananas</h1>
</div>
<div class="card" data-lookup="Pear">
	<h1>I love pears</h1>
</div>
```


