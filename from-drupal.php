<?php

/**
 * Implements hook_menu(). Title generated page title.
 */
function temple_noid_menu() {
  $items = array();
  $items['scrc/noid'] = array(
    'title' => 'General NOID Generator',
    'page callback' => 'temple_noid_generator_page_callback',
    'access arguments' => array('generate noids'),
  );
  return $items;
}

/**
 * Implements hook_permissions().
 */
function temple_noid_permission() {
  $permissions = array();
  $permissions['generate noids'] = array(
    'title' => t('Generate NOIDs'),
    'description' => t('Allows a user to generate general NOIDs'),
  );
  return $permissions;
}

/**
 * Builds the page for NOID generation.
 */
function temple_noid_generator_page_callback(){

  // Preferred syntax:
  $output = array();
  $output['noid_form'] = drupal_get_form('temple_noid_noid_generation_form');
  $output['project_create_form'] = drupal_get_form('temple_noid_project_create_form');
  return $output;
}

/**
 * Provides the NOID generation form.
 */
function temple_noid_noid_generation_form() {
  $options = temple_noid_get_projects();
  $form['project_prefix_wrapper'] = array(
    '#prefix' => '<div class="noid-generator">',
    '#suffix' => '</div>',
  );
  $form['project_prefix_wrapper']['project_prefix'] = array(
    '#title' => t('Project Name'),
    '#description' => t('Select the project name'),
    '#options' => $options,
    '#type' => 'select',
    '#default_value' => !empty($form_state['values']['project_prefix']) ? $form_state['values']['project_prefix'] : null,
  );
  $form['project_prefix_wrapper']['submit'] = array(
    '#type' => 'submit',
    '#value' => t('Generate NOID'),
  );

  return $form;
}

function temple_noid_noid_generation_form_validate($form, &$form_state) {
  if (strlen($form_state['values']['project_prefix']) > 7 || strlen($form_state['values']['project_prefix']) < 1) {
    form_set_error('project_prefix', t('Please select a Project Name from the list.'));
  }
}

function temple_noid_noid_generation_form_submit($form, &$form_state) {
  $month = date('m', REQUEST_TIME);
  $year = date('Y', REQUEST_TIME);
  $noid_number = db_query("SELECT noid from {temple_noid_noid}")->fetchField();
  $last_date = db_query("SELECT last_date from {temple_noid_noid}")->fetchField();

  if ($last_date != $month) {$noid_number = 0;}
  $noid_number++;
  $build_noid = "";
  $length = strlen($noid_number);
  if ($length < 5) {
    $padding = (5 - $length);
    for ($i=0;$i<=$padding;$i++){
      $build_noid .= "0";  // just the right amount of 0s
    }
    $noid_number = $build_noid . $noid_number;
  }

  db_update('temple_noid_noid')
  ->fields(array(
      'last_date' => $month,
      'noid' => $noid_number,
      ))
  ->execute();

  drupal_set_message(t('Your NOID "%projectZ%year%month%noid_number" has been created.',
    array(
      '%project' => $form_state['values']['project_prefix'],
      '%noid_number' => $noid_number,
      '%year' => $year,
      '%month' => $month,
    ))
  );
   $form_state['rebuild'] = TRUE;
}


/**
 * Form to create a project.
 */
function temple_noid_project_create_form() {
  $form = array();
  $form['project_create_wrapper'] = array(
    '#prefix' => '<div class="project-create"><hr><h3 style="color:red;">For Project Administrators Only!</h3>',
    '#suffix' => '</div>',
  );
  $form['project_create_wrapper']['project_label'] = array(
    '#title' => t('Project Label'),
    '#type' => 'textfield',
    '#size' => 20,
    '#maxlength' => 60,
  );
  $form['project_create_wrapper']['project_code'] = array(
    '#title' => t('Project Code'),
    '#type' => 'textfield',
    '#size' => 20,
    '#maxlength' => 7,
  );
  $form['project_create_wrapper']['add'] = array(
    '#type' => 'submit',
    '#value' => t('Create new project'),
  );
  return $form;
}

/**
 * Form creation validation.
 */
function temple_noid_project_create_form_validate($form, &$form_state) {
  if (strlen($form_state['values']['project_code']) > 7) {
    form_set_error('project_code', t('Project code must be no more than seven characters.'));
  }
  if (temple_noid_project_load_by_name($form_state['values']['project_code'])) {
    form_set_error('project_code', t('A project with this code already exists.'));
  }
  if (strlen($form_state['values']['project_label']) < 1) {
    form_set_error('project_label', t('Please enter a name for the new project.'));
  }
  if (temple_noid_project_load_by_name($form_state['values']['project_label'])) {
    form_set_error('project_label', t('A project by this name already exists.'));
  }
  $chars = "!@#$%^&*()+=-[]\\\';,./{}|\":<>?_";
  similar_text($chars, $form_state['values']['project_code'],$percent);
  if ($percent > 0) {
    form_set_error('project_code', t('Please use only alpha-numeric characters (0-9 and A-Z).'));
  }

}

/**
 * Form creation submission.
 */
function temple_noid_project_create_form_submit($form, &$form_state) {
  temple_noid_project_create($form_state['values']['project_code'],$form_state['values']['project_label']);
  $args = array(
    '%project' => $form_state['values']['project_code'],
    '%project_label' => $form_state['values']['project_label']
  );
  drupal_set_message(t('Your project "%project_label" with the code "%project" has been created.', $args));
}

/**
 * Creates a project.
 */
function temple_noid_project_load_by_name($project) {
  $clause = array(':code' => substr($project, 0, 1), ':project' => substr($project, 1));
  return db_query("SELECT * FROM {temple_noid_project} WHERE code=:code AND project=:project", $clause)
    ->fetchObject();
}

/**
 * Loads all projects as an associative array();
 */
function temple_noid_get_projects() {
  $projects = db_query("SELECT * FROM {temple_noid_project} ORDER BY code ASC, project ASC")
    ->fetchAll();
  $options = array();
  foreach ($projects as $project) {
    $this_project = $project->code . $project->project;
    $this_project_label = $project->label;
    $options[$this_project] = $this_project_label;
  }
  return $options;
}

/**
 * Creates a project.
 */
function temple_noid_project_create($project, $project_label) {
  db_insert('temple_noid_project')
    ->fields(array(
      'code' => strtoupper(substr($project, 0, 1)),
      'project' => strtoupper(substr($project, 1)),
      'label' => $project_label,
    ))
    ->execute();
}

