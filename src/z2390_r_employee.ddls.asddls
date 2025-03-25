//@AbapCatalog.dataMaintenance: #RESTRICTED
//@AbapCatalog.viewEnhancementCategory: [#NONE]
@AbapCatalog: {
   dataMaintenance: #RESTRICTED,
   viewEnhancementCategory: [#PROJECTION_LIST],
   extensibility.dataSources: [ 'Employee' ],
   extensibility.elementSuffix: 'ZSS'
}

@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee (Entity)'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
//    serviceQuality: #X,
    serviceQuality: #D,
//    sizeCategory: #S,
    sizeCategory: #M,
//    dataClass: #MIXED
    dataClass: #MASTER
}
define view entity Z2390_R_EMPLOYEE
//  as select from z2390employ
  as select from z2390employ as Employee
  association [1..1] to Z2390_R_DEPARTMENT as _Department on $projection.DepartmentId = _Department.Id
{
  key employee_id           as EmployeeId,
      first_name            as FirstName,
      last_name             as LastName,
      birth_date            as BirthDate,
      entry_date            as EntryDate,
      department_id         as DepartmentId,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      annual_salary         as AnnualSalary,
      @EndUserText.label: 'Currency Key'
      currency_code         as CurrencyCode,
      created_by            as CreatedBy,
      created_at            as CreatedAt,
      local_last_changed_by as LocalLastChangedBy,
      local_last_changed_at as LocalLastChangedAt,
      last_changed_at       as LastChangedAt,

      _Department.Description,

      _Department
}
