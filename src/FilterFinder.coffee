class JQFilterFinder

  defaults:
    {
      cardClass: 'card'
      containerClass: 'filter-finder-container'
      filters: []
      finder: 'lookup'
      filterClass: 'input-medium'
      finderClass: 'input-medium search-query'
      foundClass: 'found'
      notFoundClass: 'hidden'
    }
  bind: =>
    squatcher = @options.squatcher
    @filters = {}
    @searchTerms = []
    $(@options.filters).each (idx,item)=>
      @filters[item] = ['']

    $(@options.filters).each (_idx,filter)=>
      $('.'+@options.cardClass).each (idx,card)=>
        cardData = $(card).data(filter)
        @filters[filter].push cardData if cardData? 
      @filters[filter] = @filters[filter].unique()
      
    $('.'+@options.cardClass).each (idx,card)=>
      cardData = squatcher($(card).data(@options.finder))
      $(card).data @options.finder,cardData
      @searchTerms.push cardData if cardData? and cardData.length > 0

    @searchTerms = @searchTerms.unique()
    
    @buildComponent()

  buildComponent: =>
    container = $('.'+@options.containerClass)

    $(@options.filters).each (idx,filterName)=>
      filter = $('<select>').attr('name','filter-'+filterName).addClass(@options.filterClass)
      label  = $('<label>').attr('for','filter-'+filterName).text(filterName)
      container.append(label).append(filter)
      $(@filters[filterName]).each (_idx,filterValue)->
        filter.append $('<option>').val(filterValue).text(filterValue)

    finder = $('<input type="text">').addClass(@options.finderClass)
    container.append(finder)

    finder.on 'keyup',{cardClass: @options.cardClass, finder:@options.finder},@finderChanged

  finderComparer: (searchQuery,elementValue)->
    value = searchQuery.toLowerCase().replace /[ ]/g,""
    rx = new RegExp(value)
    elementValue.match(rx) isnt null

  squatcher: (value)->
    value.toLowerCase().replace /[ ]/g,""

  finderChanged: (evt)=>
    comparer = @options.finderComparer
    foundClass = @options.foundClass
    notFoundClass = @options.notFoundClass
    finder = @options.finder
    options = @options
    value = $(evt.delegateTarget).val()

    $('.'+evt.data.cardClass).each (idx,card)->
      if comparer(value,$(card).data(finder))
        $(card).addClass(foundClass)
        $(card).removeClass(notFoundClass)
      else
        $(card).addClass(notFoundClass)
        $(card).removeClass(foundClass)

  constructor: (options={})->
    @default = $.extend true, @defaults, {finderComparer: @finderComparer, squatcher: @squatcher}
    console.debug "JQFilterFinder starting"
    @options = $.extend true, @defaults, options
    console.debug "Options: ", @options
    window.options = @options
    window.instance = @


window.JQFilterFinder ?= JQFilterFinder

