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


Options
---------

You can configure a lot of how the Filter/Finder works. The options dictionary is the way.

When initializing the FilterFinder, make sure you pass your options dictionary like in the following example:

```
<script>
	var options = { cardClass: 'row'}
    $(function(){
		new FilterFinder(options).bind();
	});
</script>
```

The options element considers the following (example shows the default values)

```
#Container information
cardClass: 'card' #Class name from the element which contains the information (known as card in JQFF)
containerClass: 'filter-finder-container' #Class name from the container element which will have JQFF inputs

#Data information
filters: [] #What microdata elements will be filtered
finder: 'lookup' #What microdata element will have the finder

#Style information
filterClass: 'input-medium' #Class of the filter select input
finderClass: 'input-medium search-query' #Class of the filter text input 
foundClass: 'found' #Class added to an element that complies with the search
notFoundClass: 'hidden' #Class added to an element that does not comply with the search

#Method information
finderComparer: function(value1,value2) #Read below
squatcher: function(value) #Read below
```