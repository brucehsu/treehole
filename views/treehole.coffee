jQuery ($) ->
    $('#add_category').submit (event)->
        event.preventDefault()
        $.ajax
            type: 'post'
            url: '/create/category'
            data: $('#add_category').serialize()
            success: (data) ->
                if data['success']
                    $('<a href="/category/' + data['name'] + '">' + data['name'] + '</a><br />').insertBefore($('#add_category')).hide().fadeIn()
                    $('#add_cat_name').val('')
                    $('#add_post select').append('<option value="' + data['name'] + '">' + data['name'] + '</option>')
                else
                    alert('Failed')

    $('#add_post').submit (event)->
        event.preventDefault()
        $.ajax
            type: 'post'
            url: '/create/post'
            data: $('#add_post').serialize()
            success: (data) ->
                if data['success']
                    $('<div id="post"><h4>' + data['title'] + '</h4><div id="created_at">in <a href="/category/' + data['category'] + '">' + data['category'] + '</a>, ' + data['created_at'] + '</div><hr /><p>' + data['content'] + '</p>' + '<div id="post_actions"><a class="del_' + data['id'] + '" href="#" id="del_btn">Delete</a></div>').insertAfter($('#post_form')).hide().fadeIn(1500)
                    $('#add_post_title').val('')
                    $('#add_post_content').val('')
                else
                    alert('Failed!')

    $('[id^=del_]').click (event)->
        event.preventDefault()
        post_id = /del_(\d+)/.exec($(this).attr('id'))[1]
        $.ajax
            type: 'delete'
            url: '/delete/post/' + post_id
            data: $(this).serialize()
            success: (data) ->
                if data['success']
                    $('.post_' + post_id).fadeOut()
                else
                    alert('Failed!')