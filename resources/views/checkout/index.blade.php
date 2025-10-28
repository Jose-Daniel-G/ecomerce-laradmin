<div class="text-secondary mb-n5" x-data="{ pago: 1 }">
    <div class="row">
        <div class="col-lg-6 bg-white">
            <div class="p-4 p-lg-5 mx-auto" style="max-width: 40rem;">
                <h1 class="mb-3">
                    <span class="fs-4 fw-semibold">Pago</span>
                </h1>

                <div class="card border shadow-sm">
                    <ul class="list-group list-group-flush">
                        {{-- Opción: Tarjeta --}}
                        <li class="list-group-item">
                            <label class="d-flex align-items-center">
                                <input class="form-check-input me-2" type="radio" x-model="pago" value="1">
                                <span>Tarjeta de débito / crédito</span>
                                <img src="{{ asset('img/credit-cards.png') }}" alt="Tarjetas" class="ms-auto" style="height: 24px;">
                            </label>

                            <div class="p-3 bg-light text-center border-top mt-2" x-cloak x-show="pago==1">
                                <i class="fa-regular fa-credit-card fa-5x mb-3 text-muted"></i>
                                <p class="mb-0 small">
                                    Luego de hacer clic en <strong>"Pagar ahora"</strong>, se abrirá el checkout de
                                    Niubiz para completar tu compra de forma segura.
                                </p>
                            </div>
                        </li>

                        {{-- Opción: Depósito / Yape --}}
                        <li class="list-group-item">
                            <label class="d-flex align-items-center">
                                <input class="form-check-input me-2" type="radio" x-model="pago" value="2">
                                <span>Depósito Bancario o Yape</span>
                            </label>

                            <div class="p-3 bg-light border-top mt-2" x-show="pago==2">
                                <div class="small">
                                    <p class="fw-semibold mb-1">1. Pago por depósito o transferencia bancaria:</p>
                                    <ul class="list-unstyled mb-3">
                                        <li>BCP soles: <strong>159-866545321-18</strong></li>
                                        <li>CCI: <strong>002-866545321</strong></li>
                                        <li>Razón social: Ecommerce J.D.G</li>
                                        <li>RUC: 2356493321</li>
                                    </ul>

                                    <p class="fw-semibold mb-1">2. Pago por Yape:</p>
                                    <ul class="list-unstyled">
                                        <li>Yape al número: <strong>986 654 321</strong> (Ecommerce J.D.G)</li>
                                        <li>Enviar el comprobante a: <strong>986 654 321</strong></li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>

            </div>
        </div>
    </div>
</div>

@push('js')
    <script type="text/javascript" src="{{ config('services.niubiz.url_js') }}"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            let purchaseNumber = Math.floor(Math.random() * 1000000000);
            let amount = parseFloat("{{ Cart::instance('shopping')->subtotal() }}");

            VisanetCheckout.configure({
                sessiontoken: "{{ $session_token }}",
                channel: "web",
                merchantid: "{{ config('services.niubiz.merchant_id') }}",
                purchasenumber: purchaseNumber,
                amount: amount,
                expirationminutes: "20",
                timeouturl: "about:blank",
                merchantlogo: "{{ asset('img/comercio.png') }}",
                formbuttoncolor: "#000000",
                action: "{{ route('checkout.paid') }}?amount=" + amount + "&purchasenumber=" + purchaseNumber,
                complete: function(params) {
                    console.log('Transacción completada:', params);
                    Swal.fire({
                        icon: 'success',
                        title: 'Pago finalizado correctamente',
                        text: 'Tu transacción fue procesada exitosamente.'
                    });
                }
            });
        });
    </script>
@endpush
