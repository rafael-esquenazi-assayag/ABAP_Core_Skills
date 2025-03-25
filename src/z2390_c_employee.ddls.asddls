@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee (Consumption)'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
//    serviceQuality: #X,
//    sizeCategory: #S,
//    dataClass: #MIXED
    serviceQuality: #D,
    sizeCategory: #M,
    dataClass: #MASTER
}
define view entity Z2390_C_Employee
  as select from Z2390_R_EMPLOYEE
{
  key EmployeeId,
      FirstName,
      LastName,
      BirthDate,
      EntryDate,

      DepartmentId,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      AnnualSalary,
      CurrencyCode,
      CreatedBy,
      CreatedAt,
      LocalLastChangedBy,
      LocalLastChangedAt,
      LastChangedAt
}
