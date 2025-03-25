@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Enter Department (Query)'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z2390_C_DepartmentQuery
  //  as select distinct from Z2390_C_EMPLOYEEQUERY
  //  as select from Z2390_C_EMPLOYEEQUERY_2
  with parameters
    p_target_curr : /dmo/currency_code,
    @EndUserText.label: 'Date of evaluation'
    @Environment.systemField: #SYSTEM_DATE
    p_date        : abap.dats
//  as select from Z2390_C_EmployeeQueryP( p_target_curr: $parameters.p_target_curr,
//                                         p_date: $parameters.p_date )
  as select from Z2390_C_EmployeeQueryP(
            p_target_curr: $parameters.p_target_curr,
            p_date:        $parameters.p_date ) as e
     right outer join Z2390_R_DEPARTMENT as d
     on e.DepartmentId = d.Id 
{
//  DepartmentId,
//  DepartmentDescription,
  d.Id,
  d.Description,
  avg( e.CompanyAffiliation as abap.dec(11,1) ) as AverageAffiliation,
  //@Semantics.amount.currencyCode: 'CurrencyCodeUSD'
  @Semantics.amount.currencyCode: 'CurrencyCode'
  sum( e.AnnualSalaryConverted )                as TotalSalary,
//  CurrencyCodeUSD
  e.CurrencyCode
}

group by
//  DepartmentId,
//  DepartmentDescription,
  d.Id,
  d.Description,
//  CurrencyCodeUSD
  e.CurrencyCode
