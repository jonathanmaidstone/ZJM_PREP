@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Test'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Zm_Test_Annotation as  select from /lrn/employ_dep
  {
    key employee_id           as EmployeeId,
        first_name            as FirstName,
        last_name             as LastName,
        cast (
        birth_date as /dmo/flight_date preserving type )            as BirthDate,
        entry_date            as EntryDate,
        department_id         as DepartmentId,
        //    annual_salary as AnnualSalary,
        //    currency_code as CurrencyCode,
        created_by            as CreatedBy,
        created_at            as CreatedAt,
        local_last_changed_by as LocalLastChangedBy,
        local_last_changed_at as LocalLastChangedAt,
        last_changed_at       as LastChangedAt
  }
