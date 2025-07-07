@AbapCatalog.sqlViewName: 'ZJMTEST'
@AbapCatalog.compiler.compareFilter: true

@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'DDIC based'
@Metadata.ignorePropagatedAnnotations: true
define view Zjm_Legacy as select from /dmo/flight
{
    key carrier_id as CarrierId,
    key connection_id as ConnectionId,
    key flight_date as FlightDate,
    price as Price,
    currency_code as CurrencyCode,
    plane_type_id as PlaneTypeId,
    seats_max as SeatsMax,
    seats_occupied as SeatsOccupied, 
    $projection.seatsmax - $projection.seatsoccupied as SeatsFree

// can't refer to a calculated column in the same DDIC-based view
//    case $projection.seatsfree when 0 then 'X' else '' end as FullyBooked
}
