--
-- The Archetype is configured with "hibernate.hbm2ddl.auto" value="create-drop" in "persistence.xml".
--
-- This will cause hibernate to populate the database when the application is started by processing the files that
-- were configured in the hibernate.hbm2ddl.import_files property.
--
-- This file is responsible for loading the BLC out-of-box ROLES and PERMISSIONS.
--

--
-- Create BLC PERMISSIONS (These permissions are required for the admin)
--
INSERT INTO BLC_ADMIN_PERMISSION (ADMIN_PERMISSION_ID, DESCRIPTION, NAME, PERMISSION_TYPE, IS_FRIENDLY) VALUES (-18900,'Read Custom Field','PERMISSION_READ_CUSTOM_FIELD','READ', FALSE);
INSERT INTO BLC_ADMIN_PERMISSION (ADMIN_PERMISSION_ID, DESCRIPTION, NAME, PERMISSION_TYPE, IS_FRIENDLY) VALUES (-18901,'All Custom Field','PERMISSION_ALL_CUSTOM_FIELD','ALL', FALSE);

--
-- Create BLC ENTITY PERMISSIONS (These are specific permissions for CRUD operations on each entity being
--  managed by the BLC Admin).   Maps permissions above to allowed entity operations.
--
INSERT INTO BLC_ADMIN_PERMISSION_ENTITY (ADMIN_PERMISSION_ENTITY_ID, CEILING_ENTITY, ADMIN_PERMISSION_ID) VALUES (-18900,'com.broadleafcommerce.customfield.domain.CustomField',-18900);
INSERT INTO BLC_ADMIN_PERMISSION_ENTITY (ADMIN_PERMISSION_ENTITY_ID, CEILING_ENTITY, ADMIN_PERMISSION_ID) VALUES (-18901,'com.broadleafcommerce.customfield.domain.CustomField',-18901);

-- Mapping permissions to friendly permissions
INSERT INTO BLC_ADMIN_PERMISSION (ADMIN_PERMISSION_ID, DESCRIPTION, NAME, PERMISSION_TYPE, IS_FRIENDLY) VALUES (-18902,'View Custom Fields','PERMISSION_CUSTOM_FIELD', 'READ', TRUE);
INSERT INTO BLC_ADMIN_PERMISSION_XREF (ADMIN_PERMISSION_ID, CHILD_PERMISSION_ID) VALUES (-18902, -18900);

INSERT INTO BLC_ADMIN_PERMISSION (ADMIN_PERMISSION_ID, DESCRIPTION, NAME, PERMISSION_TYPE, IS_FRIENDLY) VALUES (-18903,'Maintain Custom Fields','PERMISSION_CUSTOM_FIELD', 'ALL', TRUE);
INSERT INTO BLC_ADMIN_PERMISSION_XREF (ADMIN_PERMISSION_ID, CHILD_PERMISSION_ID) VALUES (-18903, -18901);

--
--
-- Mapping from Roles to permissions
--
INSERT INTO BLC_ADMIN_ROLE_PERMISSION_XREF (ADMIN_ROLE_ID, ADMIN_PERMISSION_ID) VALUES (-1,-18903);

--
-- Create BLC SECTIONS (These modules are required for the admin left navigation)
--
INSERT INTO BLC_ADMIN_SECTION (ADMIN_SECTION_ID, DISPLAY_ORDER, ADMIN_MODULE_ID, NAME, SECTION_KEY, URL, USE_DEFAULT_HANDLER, CEILING_ENTITY) VALUES (-18900, 2000, -5,'Custom Field Management','CustomFieldManagement','/custom-field-management',FALSE,'com.broadleafcommerce.customfield.domain.CustomField');

--
--
-- Mapping from Sections to Permissions
--

--Custom Field Management
INSERT INTO BLC_ADMIN_SEC_PERM_XREF (ADMIN_SECTION_ID, ADMIN_PERMISSION_ID) VALUES (-18900,-18902);
INSERT INTO BLC_ADMIN_SEC_PERM_XREF (ADMIN_SECTION_ID, ADMIN_PERMISSION_ID) VALUES (-18900,-18903);
