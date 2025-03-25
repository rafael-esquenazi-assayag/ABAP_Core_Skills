extend view entity Z2390_C_EmployeeQueryP with
association [1..1] to I_Country as _ZZCountryZem on $projection.ZZCountryZem = _ZZCountryZem.Country
{
  //    base_data_source_name.element_name
  Employee.ZZTitleZem,
  Employee.ZZCountryZem,

  concat_with_space( Employee.FirstName, Employee.LastName, 1 ) as ZZFullNameZem,

  _ZZCountryZem.IsEuropeanUnionMember                           as ZZEUBasedZem
}
