@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@AbapCatalog.dataMaintenance: #NOT_ALLOWED
@EndUserText.label: 'Test'
@Metadata.allowExtensions: true
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Zjm_Test
  as select from /dmo/flight
{
  key carrier_id                                                       as CarrierId,
  key connection_id                                                    as ConnectionId,

      avg( seats_max - seats_occupied as abap.dec(15,2))               as seatsfree,

      @Semantics.amount.currencyCode:'ConvertedCurrency'
      avg( currency_conversion( amount => price,
      source_currency => currency_code,
      target_currency => cast('EUR' as waers),
      exchange_rate_date => $session.system_date ) as abap.curr(17,2)) as convertedPrice,
      cast('EUR' as waers)                                             as ConvertedCurrency
}
group by
  carrier_id,
  connection_id
