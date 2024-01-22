<!--begin::Toolbar-->
<div class="toolbar justify-content-between" id="kt_toolbar">

    <div data-kt-swapper="true" data-kt-swapper-mode="prepend" data-kt-swapper-parent="{default: '#kt_content_container', 'lg': '#kt_toolbar_container'}" class="page-title d-flex align-items-center flex-wrap me-3 mb-5 mb-lg-0">
        {{-- <h1 class="d-flex align-items-center text-dark fw-bolder fs-3 my-1">{{ bindSectionFromUrl(request()->segment(2)) }}</h1> --}}

        <span class="h-20px border-gray-200 border-start mx-4"></span>
        <ul class="breadcrumb breadcrumb-separatorless fw-bold fs-7 my-1">
            <!--begin::Item-->
            <li class="breadcrumb-item text-muted">
                <a href="{{ route('admin.index') }}" class="text-muted text-hover-primary"> Dashboard </a>
            </li>
        
            <!--end::Item-->
            @foreach ($breadcrumbs as $bread)
                @if($bread != null)
                    <li class="breadcrumb-item">
                        <span class="bullet bg-gray-200 w-5px h-2px"></span>
                    </li>
                    <li class="breadcrumb-item {{ $bread['active'] ?? '' }}">
                        @if(array_key_exists('link' , $bread))
                        <a href="{{ $bread['link']  }}"> {{ $bread['text'] }} </a>
                        @else
                        {{ $bread['text'] }}
                        @endif
                    </li>
                @endif
            @endforeach
        </ul>
        <!--end::Breadcrumb-->
    </div>

    @if(!empty($button))
        <div class="d-flex align-items-center py-1 mx-5">
            <a href="{{  $button['link'] ?? '#'  }}" class="btn btn-sm btn-primary">{{ $button['text'] ?? '#'  }}</a>
        </div>
    @endif
    <!--begin::Container-->

    <!--end::Container-->
</div>
<!--end::Toolbar-->
