@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee (Query)'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z2390_C_EMPLOYEEQUERY
  as select from Z2390_R_EMPLOYEE
{
  key EmployeeId,
      FirstName,
      LastName,
      BirthDate,
      EntryDate,
      DepartmentId,

      _Department.Description                  as DepartmentDescription,
      _Department._Assistant.LastName          as AssistantName,

      @EndUserText.label: 'Employee Role'
      case EmployeeId
        when _Department.DepartmentHead      then 'H'
        when _Department.DepartmentAssistant then 'A'
        else ' '
      end                                      as Employee,


      @EndUserText.label: 'Monthly Salary'
      @Semantics.amount.currencyCode: 'CurrencyCode'
      cast( AnnualSalary as abap.fltp ) / 12.0 as MonthlySalary,

      CurrencyCode,
      
      /*
      AnnualSalary,
      CurrencyCode,
      CreatedBy,
      CreatedAt,
      LocalLastChangedBy,
      LocalLastChangedAt,
      LastChangedAt,
      Description,
      */

      /* Associations */
      _Department
}
