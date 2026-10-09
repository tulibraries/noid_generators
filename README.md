# README
NOID Generators is a Ruby on Rails application used by Temple University Libraries to generate identifiers for digital collection materials. It provides a web interface for selecting a project or collection, entering any required descriptive codes, and generating an identifier in the appropriate format.

The application supports General, Oral Histories, Templana (Complex), Bulletin, and Mosley Photographs generators. Each follows collection-specific formatting rules, combining project codes, dates, sequential numbers, and additional fields where required.

Users log in to generate identifiers, while administrators can also manage projects.

# login

Two types of login: admin and user

Admin can create generators through Projects, and also generate noids; users can only generate noids

