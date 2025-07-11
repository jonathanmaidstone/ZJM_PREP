@AbapCatalog:{ viewEnhancementCategory: [#NONE], dataMaintenance: #RESTRICTED }
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employee Model View'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #D,
    sizeCategory: #M,
    dataClass: #MASTER
}
define view entity ZJM_R_EMPLOYEE
  as select from zjmemploy
  association [1..1] to ZJM_R_DEPMENT as _Department on $projection.DepartmentId = _Department.Id


{
  key employee_id             as EmployeeId,
      first_name              as FirstName,
      last_name               as LastName,
      birth_date              as BirthDate,
      entry_date              as EntryDate,
      department_id           as DepartmentId,
      _Department.Designation as DepartmentName,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      annual_salary           as AnnualSalary,
      currency_code           as CurrencyCode,
      created_by              as CreatedBy,
      created_at              as CreatedAt,
      local_last_changed_by   as LocalLastChangedBy,
      local_last_changed_at   as LocalLastChangedAt,
      last_changed_at         as LastChangedAt,

      _Department

}
