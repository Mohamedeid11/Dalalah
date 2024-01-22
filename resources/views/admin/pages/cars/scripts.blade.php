<script>

    let model = @json(old('brand', $car->car_model_id));
    let extension = @json(old('model', $car->car_model_extension_id));

    $('#brand').on('change', function() {
        let $brandId = this.value;
        getModels($brandId);
    });

    $('#model').on('change', function() {
        let modelId = this.value;
        getExtensions(modelId);
    });

    $(function() {
        getModels($('#brand').val());
        getExtensions($('#model').val());
    })

    function getModels(brandId) 
    {
        if (brandId) {
            $.ajax({
                url: "{{ route('ajax.get.models') }}"
                , type: "GET"
                , data: {
                    "_token": "{{ csrf_token() }}"
                    , value: brandId
                , }
                , dataType: "json"
                , success: function(data) {
                    if (data) {
                        $('#model').empty();
                        $('#model').focus;
                        $('#model').append('<option value="" disabled selected>-- Select Model --</option>');
                        let array = data.data;
                        array.forEach(myFunction);

                        function myFunction(item, index) {
                            checkModel = model == item.id ? true : false;
                            select = `<option value="${item.id}" ${checkModel ? 'selected' :''}>${item.name.en}</option>`;
                            $('#model').append(select);
                        }
                        getExtensions($('#model').val());
                        // $('#extension').empty();
                    }
                }
            });
        } else {
            $('#model').empty();
        }
    }

    function getExtensions(modelId) 
    {
        if (modelId) {
            $.ajax({
                url: "{{ route('ajax.get.extension') }}"
                , type: "GET"
                , data: {
                    "_token": "{{ csrf_token() }}"
                    , value: modelId
                , }
                , dataType: "json"
                , success: function(data) {
                    if (data) {
                        $('#extension').empty();
                        $('#extension').focus;
                        $('#extension').append('<option value="" disabled selected>-- Select Extension --</option>');
                        let array = data.data;
                        array.forEach(myFunction);

                        function myFunction(item, index) {
                            checkId = false;
                            if (extension == item.id) {
                                checkId = true;
                            }
                            select = `<option value="${item.id}" ${checkId ? 'selected' :''}>${item.name}</option>`;
                            $('#extension').append(select);
                        }
                    }
                }
            });
        } else {
            $('#extension').empty();
        }
    }

    $(function() {
        $("#add_car").validate({
            // Specify validation rules
            rules: {
                //
            },
            // Specify validation error messages
            messages: {
                //
            }
            , highlight: function(element) {
                $(element).parent().addClass('error')
            }
            , unhighlight: function(element) {
                $(element).parent().removeClass('error')
            },
            // Make sure the form is submitted to the destination defined
            // in the "action" attribute of the form when valid
            submitHandler: function(form) {
                $(".submit").css('background-color', 'green');
                $(".submit").attr('disabled', 'disabled');
                form.submit();
            }
        });
    });

</script>
