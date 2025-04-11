@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Joins and Unions in CDS view definitions'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity z2390_C_CDS_Joins_Unions
  as select from /dmo/customer as c
    inner join   /dmo/travel   as t on c.customer_id = t.customer_id
{
  key c.customer_id                                     as id,
  key 'C'                                               as type,
      concat_with_space( c.last_name, c.first_name, 1 ) as name,

      @EndUserText.label: 'Number of Bookings'
      count( distinct t.travel_id )                     as TravelsCount
}
group by
  c.customer_id,
  c.last_name,
  c.first_name

union all

select from  /dmo/agency as a
  inner join /dmo/travel as t on a.agency_id = t.agency_id
{
  key a.agency_id                  as id,
  key 'A'                          as type,
      a.name,

      // @EndUserText.label: 'Number of Bookings'
      count( distinct t.travel_id) as TravelsCount
}
group by
  a.agency_id,
  a.name
