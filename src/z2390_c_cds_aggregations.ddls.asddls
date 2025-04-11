@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Aggregations in CDS View Definitions'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity z2390_C_CDS_Aggregations
  as select from /DMO/I_Connection_R
{
  key AirlineID,
  key ConnectionID,

      concat_with_space(
        concat_with_space(
          concat_with_space(
            concat(
               concat( AirlineID,
                       ConnectionID ),
               ': ' ),
            DepartureAirport, 1 ),
         '->', 1 ),
      DestinationAirport, 1 )                       as Description

  ,
      count( distinct _Flight.FlightDate )          as NumberOfFlights,
      min( _Flight.FlightDate )                     as FirstFlightDate,
      sum( _Flight.OccupiedSeats )                  as TotalOccupiedSeats,
      avg( _Flight.OccupiedSeats as abap.dec(15,2)) as AverageOccupation
}
group by
  AirlineID,
  ConnectionID,
  DepartureAirport,
  DestinationAirport
