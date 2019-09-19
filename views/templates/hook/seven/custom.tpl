{*
    * 2007-2019 PrestaShop
    *
    * NOTICE OF LICENSE
    *
    * This source file is subject to the Academic Free License (AFL 3.0)
    * that is bundled with this package in the file LICENSE.txt.
    * It is also available through the world-wide-web at this URL:
    * http://opensource.org/licenses/afl-3.0.php
    * If you did not receive a copy of the license and are unable to
    * obtain it through the world-wide-web, please send an email
    * to license@prestashop.com so we can send you a copy immediately.
    *
    * DISCLAIMER
    *
    * Do not edit or add to this file if you wish to upgrade PrestaShop to newer
    * versions in the future. If you wish to customize PrestaShop for your
    * needs please refer to http://www.prestashop.com for more information.
    *
    * @author PrestaShop SA <contact@prestashop.com>
    * @copyright 2007-2019 PrestaShop SA
    * @license http://opensource.org/licenses/afl-3.0.php Academic Free License (AFL 3.0)
    * International Registered Trademark & Property of PrestaShop SA
    *}
    
        <form id="mp_custom_checkout" class="mp-checkout-form" method="post" action="{$redirect}">
    
            <input id="amount" type="hidden" value="{$amount|escape:'htmlall':'UTF-8'}" />
            <input id="payment_method_id" type="hidden" name="payment_method_id" />
            <input id="payment_type_id" type="hidden" name="payment_type_id" />
            <input name="mercadopago_coupon" type="hidden" class="mercadopago_coupon_ticket" />
            <input type="hidden" id="card_token_id" name="card_token_id" />
    
            <div class="row frame-checkout-custom-seven">
                <div class="col-xs-12 col-md-12 col-12">
                    <a class="link-checkout-custom" id="button-show-payments">{l s='Con qué tarjetas puedo pagar'
                        mod='mercadopago'} ⌵ </a>
    
                    {if $site_id == "mla"}
                    <span> | </span>
                    <a class="link-checkout-custom" id="mp_checkout_link" href="https://www.mercadopago.com.ar/cuotas"
                        target="_blank">
                        {l s='Ver promociones vigentes' mod='mercadopago'}
                    </a>
                    {/if}
                </div>
    
                <div class="col-xs-12 col-md-12 col-12">
                    <div class="frame-payments" id="frame-payments">
                        {if count($credit) != 0}
                        <p class="subtitle-payments">{l s='Tarjetas de crédito' mod='mercadopago'}</p>
                        {foreach $credit as $tarjeta}
                        <img src="{$tarjeta['image']|escape:'html':'UTF-8'}" class="img-fluid img-tarjetas" />
                        {/foreach}
                        {/if}
    
                        {if count($debit) != 0}
                        <p class="subtitle-payments pt-10">{l s='Tarjetas de débito' mod='mercadopago'}</p>
                        {foreach $debit as $tarjeta}
                        <img src="{$tarjeta['image']|escape:'html':'UTF-8'}" class="img-fluid img-tarjetas" />
                        {/foreach}
                        {/if}
                    </div>
                </div>
    
                {if $coupon == true}
                <div id="mercadopago-form-custom-coupon" class="col-xs-12 col-md-12 col-12">
                    <h3 class="title-custom-checkout">{l s='Ingresa tu cupón de descuento' mod='mercadopago'}</h3>
    
                    <div class="form-group">
                        <div class="col-md-9 col-xs-8 pb-10 pl-0 mp-m-col">
                            <input type="text" id="couponCode" class="form-control mp-form-control" autocomplete="off"
                                maxlength="24" placeholder="{l s='Ingresá tu cupón' mod='mercadopago'}" />
                        </div>
    
                        <div class="col-md-3 col-xs-4 pb-10 pr-0 text-center mp-m-col">
                            <input type="button" class="btn btn-primary mp-btn" id="applyCoupon"
                                value="{l s='Aplicar' mod='mercadopago'}">
                        </div>
                    </div>
                </div>
                {/if}
    
                <div id="mercadopago-form" class="col-xs-12 col-md-12 col-12">
                    <h3 class="title-custom-checkout">{l s='Ingresa los datos de tu tarjeta' mod='mercadopago'}</h3>
    
                    <div class="form-group">
                        <div class="col-md-12 col-12 pb-10 px-0 mp-m-col">
                            <label for="" class="pb-5">{l s='Número de Tarjeta' mod='mercadopago'} <em
                                    class="mp-required">*</em></label>
                            <input id="id-card-number" data-checkout="cardNumber" type="text"
                                class="form-control mp-form-control" autocomplete="off" />
                            <div id="id-card-number-status" class="status"></div>
                        </div>
                    </div>
    
                    <div class="form-group">
                        <div class="col-md-12 col-12 pb-10 px-0 mp-m-col">
                            <label for="" class="pb-5">{l s='Nombre y apellido del titular de la tarjeta' mod='mercadopago'}
                                <em class="mp-required">*</em></label>
                            <input type="text" class="form-control mp-form-control" autocomplete="off" />
                        </div>
                    </div>
    
                    <div class="form-group">
                        <div class="col-md-6 col-6 pb-20 pl-0 mp-m-col">
                            <label for="" class="pb-5">{l s='Fecha de vencimiento' mod='mercadopago'} <em
                                    class="mp-required">*</em></label>
                            <input type="text" class="form-control mp-form-control" autocomplete="off"
                                placeholder="MM/AAAA" />
                        </div>
    
                        <div class="col-md-6 col-6 pb-20 pr-0 mp-m-col">
                            <label for="" class="pb-5">{l s='Código de seguridad' mod='mercadopago'} <em
                                    class="mp-required">*</em></label>
                            <input type="text" class="form-control mp-form-control" autocomplete="off"
                                placeholder="{l s='CVV' mod='mercadopago'}" />
                            <small class="pt-5">Últimos 3 números del dorso</small>
                        </div>
                    </div>
    
                    <div class="col-md-12 col-12 frame-title">
                        <h3 class="title-custom-checkout">{l s='Cuántas cuotas querés pagar' mod='mercadopago'}</h3>
                    </div>
    
                    <div class="form-group">
                        <div id="container-issuers" class="issuers-options col-md-6 col-6 pb-20 pl-0 mp-m-col">
                            <label for="id-issuers-options" class="issuers-options pb-5">{l s='Banco emisor' mod='mercadopago'}</label>
                            <select class="issuers-options form-control mp-form-control mp-select pointer" id="id-issuers-options"
                                data-checkout="issuer" name="issuersOptions" type="text"></select>
                        </div>
    
                        <div id="container-installments" class="col-md-6 col-6 pb-20 pr-0 mp-m-col">
                            <label for="id-installments" class="pb-5">{l s='Seleccione el número de cotas'
                                mod='mercadopago'}</label>
                            <select class="form-control mp-form-control mp-select pointer" id="id-installments"
                                data-checkout="installments" name="installments" type="text"></select>
                            <div id="id-installments-status" class="status"></div>
    
                            <div class="row">
                                <div class="col">
                                    <div class="mp-text-cft"></div>
                                </div>
                            </div>
    
                            <div class="row">
                                <div class="col">
                                    <div class="mp-text-tea"></div>
                                </div>
                            </div>
    
                        </div>
                    </div>
    
                    <div class="col-md-12 col-12 frame-title">
                        <h3 class="title-custom-checkout">{l s='Ingresá tu número de documento' mod='mercadopago'}</h3>
                    </div>
    
                    <div class="form-group">
                        <div class="col-md-4 col-4 pb-20 pl-0 mp-m-col">
                            <label for="" class="pb-5">{l s='Tipo' mod='mercadopago'}</label>
                            <select class="form-control mp-form-control mp-select pointer"></select>
                        </div>
    
                        <div class="col-md-8 col-8 pb-20 pr-0 mp-m-col">
                            <label for="" class="pb-5">{l s='Número de documento' mod='mercadopago'}</label>
                            <input type="text" class="form-control mp-form-control" autocomplete="off" />
                        </div>
                    </div>
    
                    <div class="form-group">
                        <div class="form-check">
                            <div class="col-md-12 col-xs-12 col-12 pb-10 px-0 mp-m-col">
                                <input class="form-check-input mp-checkbox" type="checkbox" value="" id="defaultCheck1">
                                <label class="form-check-label fl-left pl-10" for="defaultCheck1">{l s='Guardar la tarjeta'
                                    mod='mercadopago'}</label>
                            </div>
                        </div>
                    </div>
    
                    <div class="col-md-12 col-xs-12 col-12 px-0 mp-m-col">
                        <p class="all-required"><em class="mp-required text-bold">*</em> {l s='Campo obligatorio'
                            mod='mercadopago'}</p>
                    </div>
                </div>
    
            </div>
        </form>
    
        <script type="text/javascript" src="{$module_dir|escape:'htmlall':'UTF-8'}/views/js/jquery-1.11.0.min.js"></script>
    
        {if $public_key != ''}
        <script type="text/javascript">
            if (window.Mercadopago === undefined) {
                $.getScript("https://secure.mlstatic.com/sdk/javascript/v1/mercadopago.js")
                    .done(function (script, textStatus) {
                        Mercadopago.setPublishableKey("{$public_key|escape:'javascript':'UTF-8'}");
                    });
            }
        </script>
        {/if}
    
        <script type="text/javascript">
          
          // first load force to clear all fields
              $("#id-card-number").val("");
            //  $("#id-security-code").val("");
            //  $("#id-card-holder-name").val("");
            //  $("#id-doc-number").val("");
          
            //collapsible payments
            var show_payments = document.querySelector("#button-show-payments");
            var frame_payments = document.querySelector("#frame-payments");
    
            show_payments.onclick = function () {
                if (frame_payments.style.display == "block") {
                    frame_payments.style.display = "none";
                } else {
                    frame_payments.style.display = "block";
                }
            };
    
            var cardBefore = "";
            var site_id = "{$site_id|escape:'javascript':'UTF-8'}";
    
    
            $("input[data-checkout='cardNumber'], input[name='card-types']")
                .bind("change", function () {
                    loadCard();
                });
    
            function loadCard() {
                if ($("#id-card-number").val() == cardBefore) {
                    return;
                }
    
                cardBefore = $("#id-card-number").val();
    
                //limpa o cupom
                //removerCoupon();
                //limpa validação
                $("#id-card-number-status").html("");
                $("#id-card-number").removeClass("form-error");
    
                var bin = getBin();
                if (bin.length == 6) {
    
                    var json = {}
                    json.bin = bin;
                    Mercadopago.getPaymentMethod(json, setPaymentMethodInfo);
                    if (site_id != "MLM") {
                        Mercadopago.getIdentificationTypes();
                    }
    
    
                } else if (bin.length < 6) {
                    $("#id-card-number").css('background-image', '');
                    $("#id-installments").html('');
                    if (site_id == "MLM" || site_id == "MPE") {
                        $("#id-issuers-options").html('');
                    }
    
                }
            }
    
            function getBin() {
                var card = $("#id-card-number").val().replace(/ /g, '').replace(/-/g,
                    '').replace(/\./g, '');
                var bin = card.substr(0, 6);
    
                return bin;
            }
    
            function returnAmount() {
                if ($("#amount_discount").text() != "") {
                    return $("#total_amount_discount").text();
                } else {
                    return $("#amount").val();
                }
            }
    
            // Estabeleça a informação do meio de pagamento obtido
            function setPaymentMethodInfo(status, result) {
                console.log('setPaymentMethodInfo status:' + status);
                console.log(result);
    
                if (status != 404 && status != 400 && result != undefined) {
                    //adiciona a imagem do meio de pagamento
                    var payment_method = result[0];
                    var amount = returnAmount();
                    var bin = getBin();
                    if (site_id === "MLM" || site_id === "MLA" || site_id === "MPE" || site_id === 'MLU') {
                        // check if the issuer is necessary to pay
                        var issuerMandatory = false,
                            additionalInfo = result[0].additional_info_needed;
    
                        for (var i = 0; i < additionalInfo.length; i++) {
                            if (additionalInfo[i] == "issuer_id") {
                                issuerMandatory = true;
                            }
                        }
    
                        if (issuerMandatory) {
                            var payment_method_issue = 0;
                            if (site_id === "MLM" || site_id === "MPE") {
                                payment_method_issue = document.getElementById("credit_option").value;
                            } else {
                                payment_method_issue = result[0].id;
                            }
                            Mercadopago.getIssuers(payment_method_issue, showCardIssuers);
    
                        } else {
                            document.querySelector("#id-issuers-options").options.length = 0;
                            document.querySelector("#id-issuers-options").style.display = 'none';
                            document.querySelector(".issuers-options").style.display = 'none';
                            $("#container-installments").removeClass('col-md-6');
                            $("#container-installments").addClass('col-md-12, pl-0');
                        }
                    }
    
                    $("#id-card-number").css(
                        "background",
                        "url(" + payment_method.secure_thumbnail +
                        ") 98% 50% no-repeat");
    
                    $("#payment_method_id").val(payment_method.id);
    
                    $("#payment_type_id").val(payment_method.payment_type_id);
    
                    loadInstallments();
    
                } else {
                    $("#id-card-number").css('background-image', '');
                    $("#id-installments").html('');
                }
            }
    
            function loadInstallments() {
                //load Installment
                var bin = getBin();
                var json = {}
                json.amount = returnAmount();
                json.bin = bin;
    
                if (site_id === "MLM" || site_id === "MLA" || site_id === "MLU") {
                    var issuerId = document.querySelector('#id-issuers-options').value;
                    if (issuerId != undefined && issuerId != "-1") {
                        json.issuer_id = issuerId;
                    }
                }
                try {
                    Mercadopago.getInstallments(json, setInstallmentInfo);
                } catch (e) {
                    console.info(e);
                }
    
            }
    
            function returnAmount() {
                console.log('returnAmount');
                return $("#amount").val();
            }
    
            //Mostre as parcelas disponíveis no div 'installmentsOption'
            function setInstallmentInfo(status, installments) {
              if( $("#id-installments option") != undefined ){
                $("#id-installments option").remove();
              }
                console.log('setInstallmentInfo status: ' + status);
                console.log(installments);
    
                if (status != 404 && status != 400 && installments.length > 0) {
                   var options = new Option("{l s='Choice' mod='mercadopago'}...", "", true, true);
                   $("#id-installments").append(options);
                    var installments = installments[0].payer_costs;
                    $.each(installments, function (key, value) {
                      options = new Option(value.recommended_message, value.installments);                   
                      // tax resolution 51/2017 arg
                        var dataInput = "";
                        var tax = value.labels;
                        if (tax.length > 0) {
                            for (var l = 0; l < tax.length; l++) {
                                if (tax[l].indexOf('CFT_') !== -1) {
                                    dataInput = tax[l]
                                }
                            }
                        }
                        options.setAttribute("data-tax", dataInput);
                        $("#id-installments").append(options);
    
                    });
                } else {
                    console.error("Installments Not Found.");
                }
                taxesInstallments();
            }
    
            function taxesInstallments() {
                var selectorInstallments = document.querySelector("#id-installments");
                showTaxes(selectorInstallments);
            }
    
            function showTaxes(selectorInstallments) {
                var tax = null;
    
                if (selectorInstallments.selectedIndex > -1) {
                    tax = selectorInstallments.options[selectorInstallments.selectedIndex].getAttribute('data-tax');
                }
    
                var cft = ""
                var tea = ""
    
                if (tax != null) {
                    var tax_split = tax.split('|');
                    cft = tax_split[0].replace('_', ' ');
                    tea = tax_split[1].replace('_', ' ');
    
                    if (cft == "CFT 0,00%" && tea == "TEA 0,00%") {
                        cft = ""
                        tea = ""
                    }
    
                }
    
                $(".mp-text-cft").html(cft);
                $(".mp-text-tea").html(tea);
            }
          
    function showCardIssuers(status, issuers) {
    
            var issuersSelector = null;
            var id_issuers_options = null;
            var issuers_options = null;
        var container_issuers = null;
        var container_installments = null;
    
            var opcaoPagamento = $("#opcaoPagamentoCreditCard").val();
                issuersSelector = document.querySelector("#id-issuers-options"), fragment = document
                .createDocumentFragment();
                id_issuers_options = document.querySelector("#id-issuers-options");
                issuers_options = document.querySelector(".issuers-options");
          container_issuers = document.querySelector("#container-issuers");
    
            if (issuers.length > 0) {
                issuersSelector.options.length = 0;
                var option = new Option("{l s='Choose' mod='mercadopago'}...", '-1');
                fragment.appendChild(option);
                for (var i = 0; i < issuers.length; i++) {
                    if (issuers[i].name != "default") {
                        option = new Option(issuers[i].name, issuers[i].id);
                    } else {
                        option = new Option("Otro", issuers[i].id);
                    }
                    fragment.appendChild(option);
                }
                issuersSelector.appendChild(fragment);
                issuersSelector.removeAttribute('disabled');
          $("#container-installments").removeClass('col-md-12, pl-0');
          $("#container-installments").addClass('col-md-6');
    
                id_issuers_options.removeAttribute('style');
          issuers_options.removeAttribute('style');
            }
    
        }
          
      if (site_id === "MLM" || site_id === "MLA" || site_id === "MPE" || site_id === "MLU") {
            $("#id-issuers-options").change(function() {
    
                var issuerId = $('#id-issuers-options').val();
                var amount = returnAmount();
    
                Mercadopago.getInstallments({
                    "bin" : getBin(),
                    "amount" : amount,
                    "issuer_id" : issuerId
                }, setInstallmentInfo);
    
    
            });
        }
    
        if (site_id === "MLA") {
            $("#id-installments").change(taxesInstallments);
            $(".mp-text-cft").show();
            $(".mp-text-tea").show();
        }
    
    
        </script>