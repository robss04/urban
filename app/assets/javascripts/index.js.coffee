$ ->
  pageBody = $('#content')
  templates = Handlebars.templates
  
  # Generic AJAX for handling GET requests
  # Takes the URL for the JSON and the template function to call
  showPage = (url, templateFunc) =>
    $.ajax url,
      dataType: 'json',
      success: (data) =>
        # Call the template and pass in the data,
        # then replace the content of
        # <section id="content"></section> with it
        pageBody.html(templateFunc(data))
  
  # Show the User template when the user
  # clicks on the name of the user (in the span tag)
  pageBody.on 'click', 'ul li span', (e) ->
    id = $(@).parent().data('id')
    showPage "/api/users/#{id}", templates.user
  
  # Show the Users template when the user
  # clicks the "Back to Users" link
  pageBody.on 'click', '#back-to-users', (e) ->
    showPage '/api/users', templates.users
  
  # Show the User Add Form when the user
  # clicks on the "Add User" button
  pageBody.on 'click', 'button.show-add-form', (e) ->
    # No need to get data, so don't need the showPage function
    pageBody.html templates.user_add
  
  # Submit the new user data via an AJAX POST request
  # when the add form is submitted. Serialize takes
  # the form data and puts it in the header of the request.
  pageBody.on 'submit', 'form#user-add-form', (e) ->
    e.preventDefault()
    $.ajax "/api/users",
      type: 'POST'
      data: $(@).serialize()
      dataType: 'text'
      success: (x) ->
        # Back to the Users page
        showPage '/api/users', templates.users
  
  # Show the User Edit Form when the user
  # clicks an Edit button next to a row. We need
  # to pre-populate this form with User data,
  # so we make an AJAX call to get it.
  pageBody.on 'click', 'ul li button.edit', (e) ->
    id = $(@).parent().data('id')
    showPage "/api/users/#{id}", templates.user_edit
  
  # Submit the updated user data via an AJAX PUT request
  # when the edit form is submitted. Serialize takes
  # the form data and puts it in the header of the request.
  pageBody.on 'submit', 'form#user-edit-form', (e) ->
    e.preventDefault()
    id = $(@).data('id')
    $.ajax "/api/users/#{id}",
      type: 'PUT'
      data: $(@).serialize()
      dataType: 'text'
      success: (x) ->
        # Back to the Users page
        showPage '/api/users', templates.users
  
  # Delete a User using an AJAX DELETE request
  # when a Delete button is clicked for a row
  pageBody.on 'click', 'ul li button.delete', (e) ->
    id = $(@).parent().data('id')
    $.ajax "/api/users/#{id}",
      type: 'DELETE'
      dataType: 'text'
      success: ->
        # Redisplay the updated Users list
        showPage '/api/users', templates.users
  
  # Show the Users list on initial page load
  showPage '/api/users', templates.users