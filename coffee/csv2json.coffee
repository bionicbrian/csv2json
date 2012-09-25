C2J = {}

C2J.csv_to_array = (input) ->
  elements = input.split(/","/)
  elements = _.map(elements, (el) -> return el.replace(/^"*([^"]*)"*$/,"$1"))
  elements

C2J.stripToArray = (input, startRow, trailingRows) ->
	if startIndex then startIndex = startRow - 1 else startIndex = 0
	  # Split the string into an array of rows
	  rows = input.split(/[\n\r]+/)
	  # Lose the intro metadata, if any
	  rows = rows[startIndex...rows.length]
	  # Lose the footer
	  for [1..trailingRows]
	    rows.pop() 

C2J.csv_to_json = (input, data_types, startRow, trailingRows) ->
	rows = C2J.stripToArray(input, startRow, trailingRows)

  # Each row splits into an array of columns called `rows`
  rows = _.map rows, (line) ->
    line_array = line.split(/","/)
    line_array[0] = line_array[0].replace(/^"/, '')
    last = line_array.length - 1
    line_array[last] = line_array[last].replace(/"$/, '')
    line_array

  # The column headers (to be object keys)
  header = rows[0] 
  report_rows = rows[1...rows.length]
  json_array = []
  
  # Convert rows of arrays into objects
  _.each report_rows, (row) ->
    i = 0
    row_object = {}

    _.each row, (element) ->
      switch data_types[i]
        when "string" then element += ''
        when "integer" then element = parseInt(element)
        when "float" then element = parseFloat(element)
        else element += ''
      row_object[header[i] + ''] = element
      i += 1
    json_array.push(row_object)

  # Return an array of objects, voila!
  return json_array

