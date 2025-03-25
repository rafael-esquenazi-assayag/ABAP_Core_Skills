@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Connection'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity z2390_I_Connection_R
  as select from /DMO/I_Connection_R

{
  key AirlineID,
  key ConnectionID,

      //      _Airline.CurrencyCode,
      //      _Flight.PlaneType,
      //
      //      DepartureAirport,
      //      DestinationAirport
      
      // All languages are displayed
      //_Airline._Currency._Text.CurrencyName

      // Display warning
      //_Airline._Currency._Text[ Language = 'E' ].CurrencyName

      // Warning vanishes
      _Airline._Currency._Text[ 1: Language = 'E' ].CurrencyName

      //_Flight.OccupiedSeats
      //        sum(_Flight.OccupiedSeats) as TotalOccupiedSeats


}
where
      AirlineID    = 'AA'
  and ConnectionID = '0017'

//  and _Airline.CurrencyCode = 'EUR'
//  and _Flight.PlaneType     = '747-400'

//  group by
//    AirlineID,
//    ConnectionID
