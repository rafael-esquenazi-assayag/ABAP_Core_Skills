CLASS zcl_2390_intro DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_2390_intro IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*    DATA var TYPE string.
    DATA var TYPE /lrn/s4d430_ind_struct.


    SELECT FROM /LRN/S4D430_IND_CDS_View
         FIELDS *
           INTO TABLE @DATA(result).

  ENDMETHOD.

ENDCLASS.
