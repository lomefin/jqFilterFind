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

This assumes two things:
1. [x] You've got jquery
2. [x] You've got your elements with the class 'card' and it has some info on the 'data-lookup' field


