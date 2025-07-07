CLASS zcl_jm_fill_texttable DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_jm_fill_texttable IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA table TYPE TABLE OF zjm_depment2t.

delete from zjm_depment2t.
delete from zjm_depment2.

insert zjm_depment2 from (
select  from zjM_depment
fields  id, department_head, department_assistant ).


    table = VALUE #(
    (  id = 'SALE' spras = 'D' description = 'Vertrieb' )
    "(  id = 'ADMIN' spras = 'D' description =' Verwaltung' )
    ( id = 'SALE' spras = 'E' description = 'Sales' )
    ( id = 'ADMIN' spras = 'E' description = 'Administration' )
    ).

    INSERT zjm_depment2t FROM TABLE @table.

if sy-subrc = 0.
out->write( 'Done' ).
else.
out->write( 'Error filling table' ).
endif.

  ENDMETHOD.
ENDCLASS.
