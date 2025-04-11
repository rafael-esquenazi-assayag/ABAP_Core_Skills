CLASS zcl_2390_path_expr DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_2390_path_expr IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    SELECT
*    FROM /lrn/c_employee_ann
    FROM z2390_c_employeequery
    FIELDS employeeid,
           firstname,
           lastname,
           departmentid,
           departmentdescription,
           assistantname,
           \_department\_head-lastname AS headname
    INTO TABLE @DATA(result).

    out->write( result ).

  ENDMETHOD.
ENDCLASS.
