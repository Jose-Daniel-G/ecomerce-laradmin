    <div class="container mt-5">
        <div class="row g-4">
            
            {{-- Columna izquierda: Direcciones de envío --}}
            <div class="col-lg-8">
                {{-- @livewire('shipping-addresses') --}}
            </div>

            {{-- Columna derecha: Resumen de compra --}}
            <div class="col-lg-4">
                <div class="card shadow-sm mb-4">
                    <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
                        <span class="fw-semibold">
                            Resumen de compra (155)
                        </span>
                        <a href="{{ route('cart.index') }}" class="text-white">
                            <i class="fa-solid fa-cart-shopping"></i>
                        </a>
                    </div>

                    <div class="card-body">
                        <ul class="list-unstyled mb-4">
                                <li class="d-flex align-items-center mb-3">
                                    <figure class="flex-shrink-0 me-3 mb-0">
                                        <img src="images/n-image.png" alt=""
                                             class="rounded" style="width: 48px; height: 48px; object-fit: cover;">
                                    </figure>
                                    <div class="flex-grow-1">
                                        <p class="mb-1 fw-semibold small">Radio</p>
                                        <p class="mb-0 text-muted">$12000</p>
                                    </div>
                                    <div class="text-end ms-2">
                                        <span class="badge bg-secondary">3</span>
                                    </div>
                                </li>
                        </ul>

                        <hr>

                        <div class="d-flex justify-content-between fw-semibold">
                            <span>Total</span>
                            <span>$12500</span>
                        </div>
                    </div>
                </div>

                <a href="{{ route('checkout.index') }}" class="btn btn-primary w-100">
                    Siguiente
                </a>
            </div>

        </div>
    </div>
