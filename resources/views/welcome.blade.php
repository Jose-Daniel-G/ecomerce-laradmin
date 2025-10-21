@extends('layouts.auth')

@section('title', 'Iniciar Sesión')

@section('content')
    <!-- MAIN CONTENT -->
   <!-- hero area -->
    {{-- <div class="container-lg home_2_hero_wrp pb-2">
        <div class="home_2_hero">
            <div class="container">
                <div class="hero_slider_active">
                    <div class="single_hero_slider bg-3">
                        <div class="container">
                            <div class="row align-items-center">
                                <div class="col-lg-6 col-sm-7">
                                    <div class="hero_content text-center text-sm-start">
                                        <p>Get up to 50% off Today only</p>
                                        <h1>iPhone 11 Pro Max </h1>
                                        <div class="price">
                                            <span class="org_price">$450.00</span>
                                            <span class="prev_price">$550.45</span>
                                        </div>
                                        <div class="hero_btn">
                                            <a class="default_btn rounded" href="shop-grid.html">Shop Now</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-sm-5 d-none d-sm-block">
                                    <div class="hero_img">
                                        <img loading="lazy"  src="{{ asset('template/assets/images/iphone.png')}}" alt="phone">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="single_hero_slider bg-1">
                        <div class="container">
                            <div class="row align-items-center">
                                <div class="col-sm-6">
                                    <div class="hero_content text-center text-sm-start">
                                        <p>Get up to 50% off Today only</p>
                                        <h1>iPhone 12 Pro Max </h1>
                                        <div class="price">
                                            <span class="org_price">$450.00</span>
                                            <span class="prev_price">$550.45</span>
                                        </div>
                                        <div class="hero_btn">
                                            <a class="default_btn rounded" href="shop-grid.html">Shop Now</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 d-none d-sm-block">
                                    <div class="hero_img">
                                        <img loading="lazy"  src="{{ asset('template/assets/images/iphone-12.png')}}" alt="phone">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="single_hero_slider bg-2">
                        <div class="container">
                            <div class="row align-items-center">
                                <div class="col-sm-6">
                                    <div class="hero_content text-center text-sm-start">
                                        <p>Get up to 50% off Today only</p>
                                        <h1>Apple iPhone XR</h1>
                                        <div class="price">
                                            <span class="org_price">$450.00</span>
                                            <span class="prev_price">$550.45</span>
                                        </div>
                                        <div class="hero_btn">
                                            <a class="default_btn rounded" href="shop-grid.html">Shop Now</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-6 d-none d-sm-block">
                                    <div class="hero_img">
                                        <img loading="lazy"  src="{{ asset('template/assets/images/iphone-xr.png')}}" alt="phone">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> --}}
 <!-- Slider principal -->
    <div class="swiper mb-4">
        <!-- Contenedor de slides -->
        <div class="swiper-wrapper">
            @foreach ($covers as $cover)
                <div class="swiper-slide" id="{{ $cover->id }}">
                    <img src="{{ $cover->image }}" 
                        class="img-fluid w-100 d-block object-fit-cover" 
                        style="aspect-ratio: 3 / 1; object-position: center;" 
                        alt="{{ $cover->title }}">
                </div>
            @endforeach
        </div>

        <!-- Paginación -->
        <div class="swiper-pagination"></div>

        <!-- Botones de navegación -->
        <div class="swiper-button-prev"></div>
        <div class="swiper-button-next"></div>
    </div>

    <!-- new arrive -->
    <section class="new_arrive section_padding_b">
        <div class="container">
            <div class="d-flex align-items-start justify-content-between">
                <h2 class="section_title_2">Ultimos productos</h2>
                {{-- <div class="seemore_2 pt-2">
                    <a href="#">See More <span><i class="las la-angle-right"></i></span></a>
                </div> --}}
            </div>
            <div class="row gy-4">
                <div class="col-lg-3 col-sm-6">
                    <div class="single_new_arrive">
                        <div class="sna_img">
                            <img loading="lazy"  class="prd_img" src="{{ asset('template/assets/images/laptop-3.png')}}" alt="product">
                            <span class="tag">Hot</span>
                            <div class="prodcut_hovcont">
                                <a href="javascript:void(0)" class="icon open_quickview" tabindex="0">
                                   <i class="icon-search-left"></i>
                                </a>
                                <a href="#" class="icon" tabindex="0">
                                    <i class="icon-heart"></i>
                                </a>
                            </div>
                        </div>
                        <div class="sna_content">
                            <a href="product-view.html">
                                <h4>HP Pavilion 15</h4>
                            </a>
                            <div class="ratprice">
                                <div class="price">
                                    <span class="org_price">$45.00</span>
                                    <span class="prev_price">$55.45</span>
                                </div>
                                <div class="rating">
                                    <div class="d-flex align-items-center justify-content-start">
                                        <div class="rating_star">
                                            <span><i class="las la-star"></i></span>
                                            <span><i class="las la-star"></i></span>
                                            <span><i class="las la-star"></i></span>
                                            <span><i class="las la-star"></i></span>
                                            <span><i class="las la-star"></i></span>
                                        </div>
                                        <p class="rating_count">(150)</p>
                                    </div>
                                </div>
                            </div>
                            <div class="product_adcart">
                                <button class="default_btn">Ver mas</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="single_new_arrive">
                        <div class="sna_img">
                            <img loading="lazy"  class="prd_img" src="{{ asset('template/assets/images/hd-monitor.png')}}" alt="product">
                            <div class="prodcut_hovcont">
                                <a href="javascript:void(0)" class="icon open_quickview" tabindex="0">
                                   <i class="icon-search-left"></i>
                                </a>
                                <a href="#" class="icon" tabindex="0">
                                    <i class="icon-heart"></i>
                                </a>
                            </div>
                        </div>
                        <div class="sna_content">
                            <a href="product-view.html">
                                <h4>SAMSUNG 27" Class Curved</h4>
                            </a>
                            <div class="ratprice">
                                <div class="price">
                                    <span class="org_price">$45.00</span>
                                    <span class="prev_price">$55.45</span>
                                </div>
                                <div class="rating">
                                    <div class="d-flex align-items-center justify-content-start">
                                        <div class="rating_star">
                                            <span><i class="las la-star"></i></span>
                                            <span><i class="las la-star"></i></span>
                                            <span><i class="las la-star"></i></span>
                                            <span><i class="las la-star"></i></span>
                                            <span><i class="las la-star"></i></span>
                                        </div>
                                        <p class="rating_count">(150)</p>
                                    </div>
                                </div>
                            </div>
                            <div class="product_adcart">
                                <button class="default_btn">Ver mas</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="single_new_arrive">
                        <div class="sna_img">
                            <img loading="lazy"  class="prd_img" src="{{ asset('template/assets/images/headphone-3.png')}}" alt="product">
                            <div class="prodcut_hovcont">
                                <a href="javascript:void(0)" class="icon open_quickview" tabindex="0">
                                   <i class="icon-search-left"></i>
                                </a>
                                <a href="#" class="icon" tabindex="0">
                                    <i class="icon-heart"></i>
                                </a>
                            </div>
                        </div>
                        <div class="sna_content">
                            <a href="product-view.html">
                                <h4>COWIN E7 Active</h4>
                            </a>
                            <div class="ratprice">
                                <div class="price">
                                    <span class="org_price">$45.00</span>
                                    <span class="prev_price">$55.45</span>
                                </div>
                                <div class="rating">
                                    <div class="d-flex align-items-center justify-content-start">
                                        <div class="rating_star">
                                            <span><i class="las la-star"></i></span>
                                            <span><i class="las la-star"></i></span>
                                            <span><i class="las la-star"></i></span>
                                            <span><i class="las la-star"></i></span>
                                            <span><i class="las la-star"></i></span>
                                        </div>
                                        <p class="rating_count">(150)</p>
                                    </div>
                                </div>
                            </div>
                            <div class="product_adcart">
                                <button class="default_btn">Ver mas</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-sm-6">
                    <div class="single_new_arrive">
                        <div class="sna_img">
                            <img loading="lazy"  class="prd_img" src="{{ asset('template/assets/images/phone-1.png')}}" alt="product">
                            <div class="prodcut_hovcont">
                                <a href="javascript:void(0)" class="icon open_quickview" tabindex="0">
                                   <i class="icon-search-left"></i>
                                </a>
                                <a href="#" class="icon" tabindex="0">
                                    <i class="icon-heart"></i>
                                </a>
                            </div>
                        </div>
                        <div class="sna_content">
                            <a href="product-view.html">
                                <h4>Xiaomi Note 7 Pro</h4>
                            </a>
                            <div class="ratprice">
                                <div class="price">
                                    <span class="org_price">$45.00</span>
                                    <span class="prev_price">$55.45</span>
                                </div>
                                <div class="rating">
                                    <div class="d-flex align-items-center justify-content-start">
                                        <div class="rating_star">
                                            <span><i class="las la-star"></i></span>
                                            <span><i class="las la-star"></i></span>
                                            <span><i class="las la-star"></i></span>
                                            <span><i class="las la-star"></i></span>
                                            <span><i class="las la-star"></i></span>
                                        </div>
                                        <p class="rating_count">(150)</p>
                                    </div>
                                </div>
                            </div>
                            <div class="product_adcart">
                                <button class="default_btn">Ver mas</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--  END CONTENT -->
@endsection
 
