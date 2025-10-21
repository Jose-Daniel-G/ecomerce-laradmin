<!-- navbar -->
<nav class="home-2">
    <div class="container">
        <div class="d-flex align-items-center justify-content-between">
            <a href="index-2.html" class="mobile_logo d-block d-lg-none">
                <img loading="lazy" src="{{ asset('vendor/adminlte/dist/img/JDcompany.png') }}" alt="logo">
            </a>
            <div class="all_category otherpage d-none d-lg-block" id="all-categories-menu-container">
                <div class="bars text-white d-flex align-items-center justify-content-center" id="menu-button">
                    <span class="icon">
                        <i class="las la-bars"></i>
                    </span>
                    <span class="icon_text">All categories</span>
                </div>
                <div class="sub_categories_wrp" id="sub-categories-wrapper">
                    <div class="sub_categories">
                        <h5 class="d-block position-relative d-lg-none subcats_title">
                            All categories
                        </h5>
                        <div class="category-scroll-content">
                            @foreach ($families as $family)
                                @if ($family->categories->isNotEmpty())
                                    <div class="singlecats withsub">
                                        <span class="img_wrp">
                                            <i class="las la-desktop"></i>
                                        </span>
                                        <span class="txt">{{ $family->name }}</span>
                                        <span class="wsicon"><i class="las la-angle-right"></i></span>

                                        <div class="mega_menu">
                                            {{-- Agrupamos las categorías de 2 en 2 --}}
                                            @foreach ($family->categories->chunk(2) as $pair)
                                                <div class="single_mega_menu">
                                                    @foreach ($pair as $category)
                                                        <div class="mega_menu_wrap">
                                                            <h4>{{ $category->name }}</h4>
                                                            <div class="mega_categories">
                                                                @foreach ($category->subcategories as $subcategory)
                                                                    <a
                                                                        href="{{ route('subcategories.show', $subcategory) }}">
                                                                        {{ $subcategory->name }}
                                                                    </a>
                                                                @endforeach
                                                            </div>
                                                        </div>
                                                    @endforeach
                                                </div>
                                            @endforeach
                                        </div>
                                    </div>
                                @else
                                    <ul class="list-unstyled mb-0">
                                        <li>
                                            <a href="{{ route('families.show', $family) }}" class="singlecats">
                                                <span class="txt">{{ $family->name }}</span>
                                                <span class="img_wrp">
                                                    <i class="fa-solid fa-angle-right"></i>
                                                </span>
                                            </a>
                                        </li>
                                    </ul>
                                @endif
                            @endforeach

                        </div>
                    </div>
                </div>
            </div>
            <div class="search_wrap d-none d-lg-block">
                <div class="search d-flex">
                    {{-- <div class="search_category">
                        <select class="nice_select">
                            <option value="">All category</option>
                            <option value="">Men</option>
                        </select>
                    </div> --}}
                    {{-- <div class="search_input">
                        <input type="text" placeholder="Search product..." id="show_suggest">
                    </div> --}}
                    {{-- <div class="search_subimt">
                        <button>
                            <span class="d-none d-sm-inline-block">Search</span>
                            <span class="d-sm-none d-inline-block"><i class="icon-search-left"></i></span>
                        </button>
                    </div> --}}
                        <input type="text" class="form-control" placeholder="Search product..." id="show_suggest">

                </div>
                <div class="search_suggest shadow-sm">
                    <div class="search_result_product">
                        <a href="" class="single_sresult_product">
                            <div class="sresult_img">
                                <img loading="lazy" src="{{ asset('template/assets/images/laptop-2.png') }}"
                                    alt="product">
                            </div>
                            <div class="sresult_content">
                                <h4>HP Pavilion 15</h4>
                                <div class="price">
                                    <span class="org_price">$45.00</span>
                                </div>
                            </div>
                        </a>
                        <a href="" class="single_sresult_product">
                            <div class="sresult_img">
                                <img loading="lazy" src="{{ asset('template/assets/images/laptop-1.png') }}"
                                    alt="product">
                            </div>
                            <div class="sresult_content">
                                <h4>HP Pavilion 15</h4>
                                <div class="price">
                                    <span class="org_price">$45.00</span>
                                </div>
                            </div>
                        </a>

                    </div>
                </div>
            </div>
            <div class="header_icon d-flex align-items-center">
                {{-- <a href="wish-list.html" class="icon_wrp text-center wishlist ms-0">
                    <span class="icon">
                        <i class="icon-heart"></i>
                    </span>
                    <span class="icon_text">Wish List</span>
                    <span class="pops">6</span>
                </a> --}}
                <div class="position-relative myacwrap">
                    <a href="javascript:void(0)" class="icon_wrp text-center myacc">
                        <span class="icon">
                            <i class="icon-user-line"></i>
                        </span>
                        <span class="icon_text">Account</span>
                    </a>
                    <div class="myacc_cont">
                        <div class="ac_join">
                            <p>Welcome to JDcompany Shop</p>
                            <div class="account_btn d-flex justify-content-between">
                                <a class="default_btn" href="{{ route('welcome.login') }}">{{ __('actions.login') }}</a>
                                <a class="default_btn second"
                                    href="{{ route('welcome.register') }}">{{ __('register') }}</a>
                            </div>
                        </div>
                        {{-- <div class="ac_links">
                            <a href="account.html" class="myac">
                                <i class="lar la-id-card"></i> My Account
                            </a>
                            <a href="account-order-history.html">
                                <i class="las la-gift"></i> My Order
                            </a>
                            <a href="wish-list.html">
                                <i class="lar la-heart"></i> My Wishlist
                            </a>
                            <a href="shopping-cart.html">
                                <i class="icon-cart"></i> My Cart
                            </a>
                            <a href="login.html">
                                <i class="las la-power-off"></i> Log out
                            </a>
                        </div> --}}
                    </div>
                </div>
                <div class="shopcart">
                    <a href="shopping-cart.html" class="icon_wrp text-center d-none d-lg-block">
                        <span class="icon">
                            <i class="icon-cart"></i>
                        </span>
                        <span class="icon_text">Cart</span>
                        <span class="pops">8</span>
                    </a>
                    {{-- <div class="shopcart_dropdown">
                        <div class="cart_droptitle">
                            <h4 class="text_lg">2 Items</h4>
                        </div>
                        <div class="cartsdrop_wrap">
                            <a href="product-view.html" class="single_cartdrop mb-3">
                                <span class="remove_cart"><i class="las la-times"></i></span>
                                <div class="cartdrop_img">
                                    <img loading="lazy" src="{{ asset('template/assets/images/shoes-5.png') }}"
                                        alt="product">
                                </div>
                                <div class="cartdrop_cont">
                                    <h5 class="text_lg mb-0 default_link">
                                        Men casual shoes
                                    </h5>
                                    <p class="mb-0 text_xs text_p">x1 <span class="ms-2">$450</span></p>
                                </div>
                            </a>
                            <a href="product-view.html" class="single_cartdrop">
                                <span class="remove_cart"><i class="las la-times"></i></span>
                                <div class="cartdrop_img">
                                    <img loading="lazy" src="{{ asset('template/assets/images/headphone-2.png') }}"
                                        alt="product">
                                </div>
                                <div class="cartdrop_cont">
                                    <h5 class="text_lg mb-0 default_link">
                                        Men casual shoes
                                    </h5>
                                    <p class="mb-0 text_xs text_p">x1 <span class="ms-2">$450</span></p>
                                </div>
                            </a>
                        </div>
                        <div class="total_cartdrop">
                            <h4 class="text_lg text-uppercase mb-0">Sub Total:</h4>
                            <h4 class="text_lg mb-0 ms-2">$980.00</h4>
                        </div>
                        <div class="cartdrop_footer d-flex mt-3">
                            <a href="shopping-cart.html" class="default_btn w-50 text_xs px-1">View Cart</a>
                            <a href="checkout.html" class="default_btn second ms-3 w-50 text_xs px-1">Checkout</a>
                        </div>
                    </div> --}}
                </div>
            </div>

        </div>
    </div>
</nav>
