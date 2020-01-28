Last login: Tue Dec 31 12:07:15 on console

The default interactive shell is now zsh.
To update your account to use zsh, please run `chsh -s /bin/zsh`.
For more details, please visit https://support.apple.com/kb/HT208050.
gcdoyle:~ cdoyle$ cd projects/fortytude
gcdoyle:fortytude cdoyle$ vi .git/config
gcdoyle:fortytude cdoyle$ ssh library
Welcome to Ubuntu 16.04.2 LTS (GNU/Linux 5.3.11-x86_64-linode131 x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Mon Jan 27 14:19:26 UTC 2020

  System load:  0.18                Processes:           216
  Usage of /:   34.4% of 154.65GB   Users logged in:     0
  Memory usage: 79%                 IP address for eth0: 66.175.209.123
  Swap usage:   6%

  Graph this data and manage this system at:
    https://landscape.canonical.com/
New release '18.04.3 LTS' available.
Run 'do-release-upgrade' to upgrade to it.

Last login: Wed Dec 18 16:19:30 2019 from 155.247.22.56
cdoyle@tulweb01:~$ sudo mysql
[sudo] password for cdoyle:
Sorry, try again.
[sudo] password for cdoyle:
sudo: 1 incorrect password attempt
cdoyle@tulweb01:~$ su
Password:
root@tulweb01:/home/cdoyle# mysql
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 211787
Server version: 5.7.28-0ubuntu0.16.04.2 (Ubuntu)

Copyright (c) 2000, 2019, Oracle and/or its affiliates. All rights reserved.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> show databases
    -> ;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
| temple_library     |
+--------------------+
5 rows in set (0.00 sec)

mysql> use temple_library
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> show tables;
+-------------------------------------------------+
| Tables_in_temple_library                        |
+-------------------------------------------------+
| access                                          |
| actions                                         |
| aggregator_category                             |
| aggregator_category_feed                        |
| aggregator_category_item                        |
| aggregator_feed                                 |
| aggregator_item                                 |
| authmap                                         |
| backup_migrate_destinations                     |
| backup_migrate_profiles                         |
| backup_migrate_schedules                        |
| backup_migrate_sources                          |
| batch                                           |
| block                                           |
| block_custom                                    |
| block_node_type                                 |
| block_role                                      |
| blocked_ips                                     |
| blogapi_files                                   |
| cache                                           |
| cache_admin_menu                                |
| cache_block                                     |
| cache_bootstrap                                 |
| cache_coffee                                    |
| cache_content                                   |
| cache_emfield_xml                               |
| cache_entity_comment                            |
| cache_entity_file                               |
| cache_entity_node                               |
| cache_entity_taxonomy_term                      |
| cache_entity_taxonomy_vocabulary                |
| cache_entity_user                               |
| cache_features                                  |
| cache_feeds_http                                |
| cache_field                                     |
| cache_filter                                    |
| cache_form                                      |
| cache_image                                     |
| cache_libraries                                 |
| cache_location                                  |
| cache_menu                                      |
| cache_page                                      |
| cache_panels                                    |
| cache_path                                      |
| cache_pulled_tweets                             |
| cache_rules                                     |
| cache_search_api_solr                           |
| cache_sessions                                  |
| cache_token                                     |
| cache_update                                    |
| cache_views                                     |
| cache_views_data                                |
| captcha_points                                  |
| captcha_sessions                                |
| ckeditor_input_format                           |
| ckeditor_settings                               |
| comment                                         |
| conditional_fields                              |
| content_group                                   |
| content_group_fields                            |
| ctools_access_ruleset                           |
| ctools_css_cache                                |
| ctools_custom_content                           |
| ctools_object_cache                             |
| custom_breadcrumb                               |
| custom_breadcrumbs_paths                        |
| date_format_locale                              |
| date_format_type                                |
| date_formats                                    |
| entries                                         |
| environment_indicator_environment               |
| facetapi                                        |
| feeds_importer                                  |
| feeds_item                                      |
| feeds_log                                       |
| feeds_push_subscriptions                        |
| feeds_source                                    |
| feeds_tamper                                    |
| field_config                                    |
| field_config_instance                           |
| field_data_body                                 |
| field_data_comment_body                         |
| field_data_field_address                        |
| field_data_field_alert_text                     |
| field_data_field_alt_title                      |
| field_data_field_anchor_tag                     |
| field_data_field_archive_label                  |
| field_data_field_category                       |
| field_data_field_city                           |
| field_data_field_collection_date                |
| field_data_field_collection_emphasis_bottom     |
| field_data_field_collection_emphasis_image      |
| field_data_field_collection_emphasis_ref        |
| field_data_field_collection_footage             |
| field_data_field_collection_id                  |
| field_data_field_collection_sort_title          |
| field_data_field_contact_name                   |
| field_data_field_custom_keys                    |
| field_data_field_db_access_notes                |
| field_data_field_db_connect_url                 |
| field_data_field_db_description                 |
| field_data_field_db_format                      |
| field_data_field_db_mobile_url                  |
| field_data_field_db_online                      |
| field_data_field_db_proxy                       |
| field_data_field_db_trial_end                   |
| field_data_field_department_department          |
| field_data_field_ensemble_video                 |
| field_data_field_event_date                     |
| field_data_field_event_interest                 |
| field_data_field_event_location                 |
| field_data_field_event_path                     |
| field_data_field_event_tags                     |
| field_data_field_event_type                     |
| field_data_field_featured_image                 |
| field_data_field_feed_item_description          |
| field_data_field_file                           |
| field_data_field_form_type                      |
| field_data_field_group_committee                |
| field_data_field_highlight_image_caption        |
| field_data_field_homepage_highlight_image       |
| field_data_field_homepage_highlight_s           |
| field_data_field_hours_open                     |
| field_data_field_howdoi_category                |
| field_data_field_index_terms                    |
| field_data_field_inline_collection_image        |
| field_data_field_keywords                       |
| field_data_field_location                       |
| field_data_field_location_directory             |
| field_data_field_location_image                 |
| field_data_field_master_program_                |
| field_data_field_minutes_date                   |
| field_data_field_newicontext                    |
| field_data_field_node_redirect                  |
| field_data_field_page_image                     |
| field_data_field_page_type                      |
| field_data_field_parent_location                |
| field_data_field_person_address                 |
| field_data_field_person_building                |
| field_data_field_person_city                    |
| field_data_field_person_dept2                   |
| field_data_field_person_email                   |
| field_data_field_person_fax                     |
| field_data_field_person_firstname               |
| field_data_field_person_head                    |
| field_data_field_person_homepage                |
| field_data_field_person_im1                     |
| field_data_field_person_im2                     |
| field_data_field_person_im3                     |
| field_data_field_person_indicator               |
| field_data_field_person_lastname                |
| field_data_field_person_midname                 |
| field_data_field_person_phone                   |
| field_data_field_person_pic                     |
| field_data_field_person_roomnumber              |
| field_data_field_person_secondtitle             |
| field_data_field_person_state                   |
| field_data_field_person_title                   |
| field_data_field_person_zip                     |
| field_data_field_policy_category                |
| field_data_field_policy_link                    |
| field_data_field_policy_pdf                     |
| field_data_field_pubdate                        |
| field_data_field_publication_category           |
| field_data_field_redirect                       |
| field_data_field_room                           |
| field_data_field_school                         |
| field_data_field_springshare_uid                |
| field_data_field_staff_category                 |
| field_data_field_state                          |
| field_data_field_subject                        |
| field_data_field_subjects                       |
| field_data_field_tabname                        |
| field_data_field_time                           |
| field_data_field_type                           |
| field_data_field_type_of_material               |
| field_data_field_urban_subjects                 |
| field_data_field_user_ref                       |
| field_data_field_zip_code                       |
| field_data_taxonomy_vocabulary_2                |
| field_data_taxonomy_vocabulary_3                |
| field_data_taxonomy_vocabulary_4                |
| field_data_taxonomy_vocabulary_5                |
| field_data_taxonomy_vocabulary_6                |
| field_group                                     |
| field_revision_body                             |
| field_revision_comment_body                     |
| field_revision_field_address                    |
| field_revision_field_alert_text                 |
| field_revision_field_alt_title                  |
| field_revision_field_anchor_tag                 |
| field_revision_field_archive_label              |
| field_revision_field_category                   |
| field_revision_field_city                       |
| field_revision_field_collection_date            |
| field_revision_field_collection_emphasis_bottom |
| field_revision_field_collection_emphasis_image  |
| field_revision_field_collection_emphasis_ref    |
| field_revision_field_collection_footage         |
| field_revision_field_collection_id              |
| field_revision_field_collection_sort_title      |
| field_revision_field_contact_name               |
| field_revision_field_custom_keys                |
| field_revision_field_db_access_notes            |
| field_revision_field_db_connect_url             |
| field_revision_field_db_description             |
| field_revision_field_db_format                  |
| field_revision_field_db_mobile_url              |
| field_revision_field_db_online                  |
| field_revision_field_db_proxy                   |
| field_revision_field_db_trial_end               |
| field_revision_field_department_department      |
| field_revision_field_ensemble_video             |
| field_revision_field_event_date                 |
| field_revision_field_event_interest             |
| field_revision_field_event_location             |
| field_revision_field_event_path                 |
| field_revision_field_event_tags                 |
| field_revision_field_event_type                 |
| field_revision_field_featured_image             |
| field_revision_field_feed_item_description      |
| field_revision_field_file                       |
| field_revision_field_form_type                  |
| field_revision_field_group_committee            |
| field_revision_field_highlight_image_caption    |
| field_revision_field_homepage_highlight_image   |
| field_revision_field_homepage_highlight_s       |
| field_revision_field_hours_open                 |
| field_revision_field_howdoi_category            |
| field_revision_field_index_terms                |
| field_revision_field_inline_collection_image    |
| field_revision_field_keywords                   |
| field_revision_field_location                   |
| field_revision_field_location_directory         |
| field_revision_field_location_image             |
| field_revision_field_master_program_            |
| field_revision_field_minutes_date               |
| field_revision_field_newicontext                |
| field_revision_field_node_redirect              |
| field_revision_field_page_image                 |
| field_revision_field_page_type                  |
| field_revision_field_parent_location            |
| field_revision_field_person_address             |
| field_revision_field_person_building            |
| field_revision_field_person_city                |
| field_revision_field_person_dept2               |
| field_revision_field_person_email               |
| field_revision_field_person_fax                 |
| field_revision_field_person_firstname           |
| field_revision_field_person_head                |
| field_revision_field_person_homepage            |
| field_revision_field_person_im1                 |
| field_revision_field_person_im2                 |
| field_revision_field_person_im3                 |
| field_revision_field_person_indicator           |
| field_revision_field_person_lastname            |
| field_revision_field_person_midname             |
| field_revision_field_person_phone               |
| field_revision_field_person_pic                 |
| field_revision_field_person_roomnumber          |
| field_revision_field_person_secondtitle         |
| field_revision_field_person_state               |
| field_revision_field_person_title               |
| field_revision_field_person_zip                 |
| field_revision_field_policy_category            |
| field_revision_field_policy_link                |
| field_revision_field_policy_pdf                 |
| field_revision_field_pubdate                    |
| field_revision_field_publication_category       |
| field_revision_field_redirect                   |
| field_revision_field_room                       |
| field_revision_field_school                     |
| field_revision_field_springshare_uid            |
| field_revision_field_staff_category             |
| field_revision_field_state                      |
| field_revision_field_subject                    |
| field_revision_field_subjects                   |
| field_revision_field_tabname                    |
| field_revision_field_time                       |
| field_revision_field_type                       |
| field_revision_field_type_of_material           |
| field_revision_field_urban_subjects             |
| field_revision_field_user_ref                   |
| field_revision_field_zip_code                   |
| field_revision_taxonomy_vocabulary_2            |
| field_revision_taxonomy_vocabulary_3            |
| field_revision_taxonomy_vocabulary_4            |
| field_revision_taxonomy_vocabulary_5            |
| field_revision_taxonomy_vocabulary_6            |
| file_managed                                    |
| file_usage                                      |
| files                                           |
| filter                                          |
| filter_format                                   |
| flag_actions                                    |
| flag_content                                    |
| flag_counts                                     |
| flag_types                                      |
| flags                                           |
| flexslider_optionset                            |
| flood                                           |
| guides                                          |
| history                                         |
| homebox_pages                                   |
| homebox_users                                   |
| image_effects                                   |
| image_styles                                    |
| job_schedule                                    |
| languages                                       |
| ldap_servers                                    |
| locales_source                                  |
| locales_target                                  |
| location                                        |
| location_instance                               |
| menu_custom                                     |
| menu_links                                      |
| menu_router                                     |
| migrate_field_mapping                           |
| migrate_group                                   |
| migrate_log                                     |
| migrate_map_templedatabase                      |
| migrate_map_templedatabasesubjects              |
| migrate_map_templestaffperson                   |
| migrate_map_templestaffpersonpics               |
| migrate_message_templedatabase                  |
| migrate_message_templedatabasesubjects          |
| migrate_message_templestaffperson               |
| migrate_message_templestaffpersonpics           |
| migrate_status                                  |
| mollom                                          |
| mollom_form                                     |
| node                                            |
| node_access                                     |
| node_comment_statistics                         |
| node_revision                                   |
| node_type                                       |
| notify                                          |
| notify_bytecount                                |
| notify_subscriptions                            |
| notify_unpublished_queue                        |
| oauth_common_consumer                           |
| oauth_common_context                            |
| oauth_common_nonce                              |
| oauth_common_provider_consumer                  |
| oauth_common_provider_token                     |
| oauth_common_token                              |
| page_manager_handlers                           |
| page_manager_pages                              |
| page_manager_weights                            |
| panelizer_defaults                              |
| panelizer_entity                                |
| panels_display                                  |
| panels_layout                                   |
| panels_mini                                     |
| panels_node                                     |
| panels_pane                                     |
| panels_renderer_pipeline                        |
| path_redirect                                   |
| qtip                                            |
| queue                                           |
| quicktabs                                       |
| redirect                                        |
| registry                                        |
| registry_file                                   |
| role                                            |
| role_permission                                 |
| roomkeys                                        |
| rules_config                                    |
| rules_dependencies                              |
| rules_rules                                     |
| rules_scheduler                                 |
| rules_sets                                      |
| rules_tags                                      |
| rules_trigger                                   |
| search_api_index                                |
| search_api_item                                 |
| search_api_item_string_id                       |
| search_api_server                               |
| search_api_task                                 |
| search_dataset                                  |
| search_index                                    |
| search_node_links                               |
| search_total                                    |
| semaphore                                       |
| sequences                                       |
| services_endpoint                               |
| services_user                                   |
| sessions                                        |
| specialties                                     |
| stylizer                                        |
| system                                          |
| taxonomy_index                                  |
| taxonomy_manager_merge                          |
| taxonomy_term_data                              |
| taxonomy_term_hierarchy                         |
| taxonomy_term_relation                          |
| taxonomy_term_synonym                           |
| taxonomy_vocabulary                             |
| temple_noid_hoh_noid                            |
| temple_noid_hoh_project                         |
| temple_noid_noid                                |
| temple_noid_patron_prefix                       |
| temple_noid_patron_suffix                       |
| temple_noid_project                             |
| temple_noid_templana_project                    |
| trigger_assignments                             |
| twitter                                         |
| twitter_account                                 |
| url_alias                                       |
| users                                           |
| users_roles                                     |
| variable                                        |
| views_data_export                               |
| views_data_export_object_cache                  |
| views_display                                   |
| views_view                                      |
| watchdog                                        |
| webform                                         |
| webform_component                               |
| webform_emails                                  |
| webform_last_download                           |
| webform_roles                                   |
| webform_submissions                             |
| webform_submitted_data                          |
| webform_validation_rule                         |
| webform_validation_rule_components              |
| wysiwyg                                         |
| wysiwyg_user                                    |
| xmlsitemap                                      |
| xmlsitemap_sitemap                              |
| zipcodes                                        |
+-------------------------------------------------+
431 rows in set (0.00 sec)

mysql> describe temple_noid_project
    -> ;
+---------+--------------+------+-----+---------+----------------+
| Field   | Type         | Null | Key | Default | Extra          |
+---------+--------------+------+-----+---------+----------------+
| pid     | int(10)      | NO   | PRI | NULL    | auto_increment |
| code    | varchar(1)   | NO   |     | NULL    |                |
| project | varchar(7)   | YES  |     | NULL    |                |
| label   | varchar(256) | YES  |     | NULL    |                |
+---------+--------------+------+-----+---------+----------------+
4 rows in set (0.01 sec)

mysql> describe temple_noid_noid;
+-----------+------------+------+-----+---------+-------+
| Field     | Type       | Null | Key | Default | Extra |
+-----------+------------+------+-----+---------+-------+
| noid      | varchar(7) | YES  |     | NULL    |       |
| last_date | int(11)    | YES  |     | NULL    |       |
+-----------+------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> select * from temple_noid_noid;
+--------+-----------+
| noid   | last_date |
+--------+-----------+
| 000372 |         1 |
+--------+-----------+
1 row in set (0.00 sec)

mysql> describe temple_noid_hoh_noid;
+-----------+------------+------+-----+---------+-------+
| Field     | Type       | Null | Key | Default | Extra |
+-----------+------------+------+-----+---------+-------+
| noid      | varchar(5) | YES  |     | NULL    |       |
| last_date | int(7)     | YES  |     | NULL    |       |
+-----------+------------+------+-----+---------+-------+
2 rows in set (0.00 sec)

mysql> describe temple_noid_templana_project;
+---------+--------------+------+-----+---------+----------------+
| Field   | Type         | Null | Key | Default | Extra          |
+---------+--------------+------+-----+---------+----------------+
| pid     | int(10)      | NO   | PRI | NULL    | auto_increment |
| project | varchar(5)   | YES  |     | NULL    |                |
| label   | varchar(256) | YES  |     | NULL    |                |
+---------+--------------+------+-----+---------+----------------+
3 rows in set (0.00 sec)

mysql> describe temple_noid_patron_prefix;
+--------+---------+------+-----+---------+----------------+
| Field  | Type    | Null | Key | Default | Extra          |
+--------+---------+------+-----+---------+----------------+
| pid    | int(10) | NO   | PRI | NULL    | auto_increment |
| prefix | char(1) | YES  |     | NULL    |                |
+--------+---------+------+-----+---------+----------------+
2 rows in set (0.00 sec)

mysql> describe temple_noid_patron_suffix;
+--------+---------+------+-----+---------+----------------+
| Field  | Type    | Null | Key | Default | Extra          |
+--------+---------+------+-----+---------+----------------+
| pid    | int(10) | NO   | PRI | NULL    | auto_increment |
| suffix | char(1) | YES  |     | NULL    |                |
+--------+---------+------+-----+---------+----------------+
2 rows in set (0.00 sec)

mysql> select * from temple_noid_project;
+-----+------+---------+-------------------------------------------------+
| pid | code | project | label                                           |
+-----+------+---------+-------------------------------------------------+
|   1 | A    | MANU    | UA Manuscripts                                  |
|   3 |      |         | NULL                                            |
|   4 | A    | BULC    | Bulletin Clippings                              |
|   5 | A    | INRP    | Inquirer Photos                                 |
|   6 | J    | PJAP    | PJAC Photos                                     |
|   7 | T    | LITF    | Littell Collection Folders                      |
|   8 | T    | PFP     | Templana Photos                                 |
|   9 | D    | NCP     | Dance Collection Photos                         |
|  10 | D    | NCE     | Dance Collection Ephemera                       |
|  11 | T    | ETDPD   | ETD Digitized Theses                            |
|  12 | H    | TUAP    | Ambler Images TU Ambler                         |
|  13 | H    | PHWP    | Ambler Images PHSW                              |
|  14 | A    | GP      | UA General Photographs                          |
|  16 | C    | B       | Zines                                           |
|  17 | B    | PR      | Paul Robeson                                    |
|  18 | A    | PAMH    | Urban Archives Pamphlet Collection              |
|  19 | A    | INQC    | Inquirer Clippings                              |
|  20 | T    | TTP     | Temple Times                                    |
|  21 | A    | FRRP    | Frank Zahn Railroad Photograph Collection       |
|  22 | J    | B       | PJAC Books                                      |
|  23 | M    | WHLVF   | Levy Family                                     |
|  24 | R    | COCM    | CLIR Cochran                                    |
|  25 | K    | FICB    | Novels- DSC                                     |
|  26 | B    | PH      | Blockson Pamphlet Collection                    |
|  27 | R    | M       | SCRC CLIR Manuscripts                           |
|  28 | S    | SFCB    | Sci-Fi - DSC                                    |
|  29 | A    | PVI     | WPVI Log Books                                  |
|  30 | A    | CBS     | KYW Log Books                                   |
|  31 | A    | HAP     | Housing Association Prints and Negatives        |
|  32 | J    | GOM     | Gomborow Papers                                 |
|  33 | J    | M       | Jewish Archives Manuscripts                     |
|  34 | A    | BNP     | Bulletin Negatives and Misc Prints              |
|  35 | T    | CPP     | Conwell Family Photographs                      |
|  36 | M    | ELLP    | Ellis Photographs                               |
|  37 | A    | KNF     | IHOR2:Kensington Y                              |
|  38 | A    | GRT     | Germantown YWCA                                 |
|  39 | M    | MJC     | JCRC                                            |
|  40 | A    | CLA     | Pennsylvania Child Labor Association            |
|  41 | J    | MJY     | Jewish Ys Centers of Phila, Neighborhood Centre |
|  42 | J    | MJCC    | Jewish Community Centers of Greater Phila       |
|  43 | T    | OLDSP   | Oak Lane Day School                             |
|  45 | V    | AV      | SCRC A/V General                                |
+-----+------+---------+-------------------------------------------------+
42 rows in set (0.00 sec)

mysql> select * form temple_noid_patron_suffix;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'form temple_noid_patron_suffix' at line 1
mysql> select * from temple_noid_patron_suffix;
+-----+--------+
| pid | suffix |
+-----+--------+
|   1 | A      |
|   2 | B      |
|   3 | D      |
|   4 | I      |
|   5 | M      |
|   6 | R      |
+-----+--------+
6 rows in set (0.00 sec)

mysql> select * from temple_noid_noid;
+--------+-----------+
| noid   | last_date |
+--------+-----------+
| 000372 |         1 |
+--------+-----------+
1 row in set (0.00 sec)

mysql> packet_write_wait: Connection to 66.175.209.123 port 22: Broken pipe
gcdoyle:fortytude cdoyle$ ssh library
Welcome to Ubuntu 16.04.2 LTS (GNU/Linux 5.3.11-x86_64-linode131 x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  System information as of Tue Jan 28 17:28:52 UTC 2020

  System load:  0.83                Processes:           212
  Usage of /:   34.5% of 154.65GB   Users logged in:     0
  Memory usage: 80%                 IP address for eth0: 66.175.209.123
  Swap usage:   6%

  Graph this data and manage this system at:
    https://landscape.canonical.com/
New release '18.04.3 LTS' available.
Run 'do-release-upgrade' to upgrade to it.

Last login: Mon Jan 27 14:19:27 2020 from 73.81.120.9
cdoyle@tulweb01:~$
cdoyle@tulweb01:~$ cd /var/www/temple_library/code/all/modules/temple
-bash: cd: /var/www/temple_library/code/all/modules/temple: No such file or directory
cdoyle@tulweb01:~$ cd /var/www/temple_library/code/sites/all/modules/temple
cdoyle@tulweb01:/var/www/temple_library/code/sites/all/modules/temple$ ll
total 204
drwxrwsr-x  51 jmoore webadmin 4096 Mar 13  2019 ./
drwxrwsr-x 116 jmoore webadmin 4096 Mar 13  2019 ../
drwxrwsr-x   2 cdoyle webadmin 4096 Mar 18  2019 collections_export/
drwxrwsr-x  10 jmoore webadmin 4096 May 18  2017 exportables/
drwxrwsr-x   2 jmoore webadmin 4096 May 18  2017 library_hours/
drwxrwsr-x   2 jmoore webadmin 4096 May 25  2017 temple_ada_compliance/
  1 <?php
  2
  3 /**
  4  * Implements hook_menu(). Title generated page title.
  5  */
  6 function temple_noid_hoh_menu() {
  7   $items = array();
  8   $items['scrc/hoh/noid'] = array(
  9     'title' => 'Oral History NOID Generator',
 10     'page callback' => 'temple_noid_hoh_generator_page_callback',
 11     'access arguments' => array('generate noids'),
 12   );
 13   return $items;
 14 }
 15
 16 /**
 17  * Implements hook_permissions().
 18  */
 19 function temple_noid_hoh_permission() {
 20   $permissions = array();
 21   $permissions['generate noids'] = array(
 22     'title' => t('Generate NOIDs'),
 23     'description' => t('Allows a user to generate general NOIDs'),
 24   );
 25   return $permissions;
 26 }
 27
 28 /**
 29  * Builds the page for NOID generation.
 30  */
 31 function temple_noid_hoh_generator_page_callback(){
 32
 33   // Preferred syntax:
 34   $output = array();
 35   $output['noid_form'] = drupal_get_form('temple_noid_hoh_noid_generation_form');
 36   $output['project_create_form'] = drupal_get_form('temple_noid_hoh_project_create_form');
 37   return $output;
 38 }
 39
 40 /**
 41  * Provides the NOID generation form.
 42  */
 43 function temple_noid_hoh_noid_generation_form() {
 44   $options = temple_noid_hoh_get_projects();
 45   $form['project_prefix_wrapper'] = array(
 46     '#prefix' => '<div class="noid-generator">',
 47     '#suffix' => '</div>',
 48   );
 49   $form['project_prefix_wrapper']['project_prefix'] = array(
 50     '#title' => t('Project Name'),
 51     '#description' => t('Select the project name'),
 52     '#options' => $options,
 53     '#type' => 'select',
 54     '#default_value' => !empty($form_state['values']['project_prefix']) ? $form_state['values']['project_prefix'] : null,
"temple_noid_hoh.module" 208L, 6409C                                                                                                                                        2,0-1         Top