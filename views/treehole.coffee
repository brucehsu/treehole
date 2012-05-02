jQuery ($) ->
    $('#add_category').submit (event)->
        event.preventDefault()
        $.ajax
            type: 'post'
            url: '/create/category'
            data: $('#add_category').serialize()
            success: (data) ->
                if data['success']
                    $('<a href="/category/' + data['name'] + '">' + data['name'] + '</a><br />').insertBefore($('#add_category'))
                    $('#add_cat_name').val('')
                else
                    alert('Failed')