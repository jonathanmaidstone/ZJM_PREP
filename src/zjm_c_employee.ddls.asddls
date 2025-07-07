@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Another View'
@Metadata.ignorePropagatedAnnotations: false
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZJM_C_EMPLOYEE as select from ZJM_R_EMPLOYEE
{
    key EmployeeId,
    FirstName,
    LastName,
    BirthDate,
    EntryDate,
    DepartmentId,
    AnnualSalary,
    CurrencyCode,
    CreatedBy,
    CreatedAt,
    LocalLastChangedBy,
    LocalLastChangedAt,
    LastChangedAt
}
