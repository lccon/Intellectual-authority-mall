create index idx_module_typeAndId on roof_place(module_type, module_type_id);

create index idx_module_info on business_collected(user_id, module_type, module_type_id);

