@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Department'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZJM_R_DEPMENT2
  as select from zjm_depment2
  association [0..1] to ZJM_R_EMPLOYEE as _Head      on $projection.DepartmentHead = _Head.EmployeeId
  association [0..1] to ZJM_R_EMPLOYEE as _Assistant on $projection.DepartmentAssistant = _Assistant.EmployeeId
  association [0..*] to zjm_depment2t  as _Text      on $projection.Id = _Text.id 

{
  key id                    as Id,
      coalesce( _Text[1:spras = 'D'].description, 
      _Text[1:spras = 'E'].description )   
           as Description,
      department_head       as DepartmentHead,

      department_assistant  as DepartmentAssistant,

      created_by            as CreatedBy,
      created_at            as CreatedAt,
      local_last_changed_by as LocalLastChangedBy,
      local_last_changed_at as LocalLastChangedAt,
      last_changed_at       as LastChangedAt,

      _Head,
      _Assistant
}
