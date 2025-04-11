CLASS zcl_2390_parameter DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_2390_PARAMETER IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    SELECT
*     FROM /LRN/C_Employee_Ann
*     FROM /lrn/c_employee_qry
      FROM Z2390_C_EmployeeQueryP(
              p_target_curr = 'JPY' )
*              ,
*              p_date        = @sy-datum )
    FIELDS employeeid,
           firstname,
           lastname,
           departmentid,

           departmentdescription,
           assistantname,
           \_department\_head-lastname AS headname,

          MonthlySalaryConverted,
          CurrencyCodeUSD,
*          CurrencyCode,
          CompanyAffiliation

    INTO TABLE @DATA(result).

    out->write( result ).

  ENDMETHOD.
ENDCLASS.
