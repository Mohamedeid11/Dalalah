<script>
    $(function() {
        $('.mini-editor').each(function(e) {
            CKEDITOR.replace(this.id, {
                // Define the toolbar groups as it is a more accessible solution.
                toolbarGroups: [
                    {
                        "name": "basicstyles"
                        , "groups": ['basicstyles']
                    }
                    ,{
                        "name": "styles"
                        , "groups": ["styles"]
                    }
                    , {
                        "name": 'colors'
                        , "groups": ['TextColor', 'BGColor']
                    }
                    , {
                        "name": 'paragraph'
                        , "groups": ['list', 'blocks']
                    }, 
                 ]
                , contentsCss: '{{ asset("front_assets/css/font.css") }}'
                , font_names: 'advertisingBold;' +
                    'advertisingExtraBold;' +
                    'advertisingLight;' +
                    'advertisingMedium;' +
                    'Mohand;' +
                    'MohandBold;' +
                    CKEDITOR.config.font_names,
                // Remove the redundant buttons from toolbar groups defined above.
                removeButtons: 'Underline,Strike,Subscript,Superscript,Anchor,Styles,Specialchar,PasteFromWord'
            });
        });

        $('.full-editor').each(function(e) {
            CKEDITOR.replace(this.id, {
                // Define the toolbar groups as it is a more accessible solution.
                toolbarGroups: [
                    { name: 'document', groups: [ 'mode', 'document', 'doctools' ] },
                        { name: 'clipboard', groups: [ 'clipboard', 'undo' ] },
                        { name: 'editing', groups: [ 'find', 'selection', 'spellchecker' ] },
                        { name: 'forms' },
                        '/',
                        { name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
                        { name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi' ] },
                        { name: 'links' },
                        { name: 'insert' },
                        '/',
                        { name: 'styles' },
                        { name: 'colors' },
                        { name: 'tools' },
                        { name: 'others' },
                        { name: 'about' }
                 ]
                , contentsCss: '{{ asset("front_assets/css/font.css") }}'
                , font_names: 'advertisingBold;' +
                    'advertisingExtraBold;' +
                    'advertisingLight;' +
                    'advertisingMedium;' +
                    'Mohand;' +
                    'MohandBold;' +
                    CKEDITOR.config.font_names,
                // Remove the redundant buttons from toolbar groups defined above.
                removeButtons: 'Underline,Strike,Subscript,Superscript,Anchor,Styles,Specialchar,PasteFromWord'
            });
        });
    });

</script>
