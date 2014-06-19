<?php  if ( !defined( 'BASEPATH' ) )
{
	exit( 'No direct script access allowed' );
}
/**
 * ExpressionEngine Template Variables Reference Accessory
 *
 * Matthew Krivanek was the original author (http://www.sherpawebstudios.com)
 *
 * @package		ExpressionEngine
 * @subpackage	Control Panel
 * @category	Accessories
 * @author		Aaron Waldon
 * @link		http://www.causingeffect.com
 */
class Template_variables_acc
{
	public $name = 'Template Variables';
	public $id = 'template_variables';
	public $version = '1.2.3';
	public $description = 'Shows custom fields, snippets, and global variables';
	public $sections = array();

	/**
	 * Constructor
	 */
	public function __construct()
	{
		$this->EE = get_instance();
		$this->EE->lang->loadfile( 'template_variables' );
		$this->include_styles_and_scripts();
	}

	/**
	 * Old school constructor
	 *
	 * @return Template_variables_acc
	 */
	public function Template_variables_acc()
	{
		return $this->__construct();
	}

	/**
	 * Set content for the accessory
	 *
	 * @return	void
	 */
	public function set_sections()
	{
		//add custom fields section
		$data = array( 'field_groups' => $this->get_fields() );
		$this->sections[ lang( 'custom_fields' ) ] = ( empty( $data[ 'field_groups' ] ) ) ? '<p>' . lang( 'no_custom_fields' ) . '</p>' : $this->EE->load->view( 'custom_fields', $data, TRUE );

		//add snippets section
		$data = array( 'snippets' => $this->get_snippets() );
		$this->sections[ lang( 'snippets' ) ] = ( empty( $data[ 'snippets' ] ) ) ? '<p>' . lang( 'no_snippets' ) . '<br><a href="'. BASE . AMP . 'C=design' . AMP . 'M=snippets_edit">' . lang( 'create_new_snippet' ) . '</a></p>' : $this->EE->load->view( 'snippets', $data, TRUE );

		//add global variables section
		$data = array( 'global_variables' => $this->get_globals() );
		$this->sections[ lang( 'global_variables' ) ] = ( empty( $data[ 'global_variables' ] ) ) ? '<p>' . lang( 'no_global_variables' ) . '<br><a href="' . BASE . AMP . 'C=design' . AMP . 'M=global_variables_create">' . lang( 'create_new_global_variable' ) . '</a></p>' :  $this->EE->load->view( 'global_variables', $data, TRUE );
	}

	/**
	 * Get array of variables
	 *
	 * @return array
	 */
	protected function get_fields()
	{
		//the main variables array
		$field_groups = array();

		//query the field groups
		$temp = $this->EE->db->query( '
			SELECT
				fg.group_id,
				fg.group_name,
				cf.field_id,
				cf.field_label,
				cf.field_order,
				cf.field_name,
				cf.field_type
			FROM
				exp_field_groups fg
			LEFT JOIN
				exp_channel_fields cf
			ON fg.group_id = cf.group_id
			WHERE fg.site_id=?
			ORDER BY cf.field_order, fg.group_name ASC', array( $this->EE->config->item( 'site_id' ) )
		);

		//process the field groups
		if ( $temp->num_rows() > 0 )
		{
			$results = $temp->result_array();

			foreach ( $results as $result )
			{
				if ( ! isset( $field_groups[ $result['group_id'] ] ) )
				{
					$field_groups[ $result['group_id'] ] = array(
						'group_id' => $result[ 'group_id' ],
						'group_name' => $result[ 'group_name' ],
						'new_custom_field_link' => BASE . AMP . 'C=admin_content' . AMP . 'M=field_edit' . AMP . 'group_id=' . $result[ 'group_id' ],
					);
				}

				if ( ! empty( $result[ 'field_id' ] ) )
				{
					$field_groups[ $result['group_id'] ]['custom_fields'][] = array(
						'field_id' => $result[ 'field_id' ],
						'field_label' => $result[ 'field_label' ],
						'field_order' => $result[ 'field_order' ],
						'field_name' => $result[ 'field_name' ],
						'field_type' => $result[ 'field_type' ],
						'field_link' => BASE . AMP . 'C=admin_content' . AMP . 'M=field_edit' . AMP . 'field_id=' . $result[ 'field_id' ] . AMP . 'group_id=' . $result[ 'group_id' ]

					);
				}
			}
		}

		//reset the key values
		$field_groups = array_merge( $field_groups );

		return $field_groups;
	}

	/**
	 * Get the snippets array.
	 *
	 * @return array
	 */
	protected function get_snippets()
	{
		//initialize the snippet array
		$snippets = array();

		//query the snippets
		$temp = $this->EE->db->query( 'SELECT snippet_id, snippet_name FROM exp_snippets' );

		//process the snippets
		if ( $temp->num_rows() > 0 )
		{
			foreach ( $temp->result_array() as $row )
			{
				$snippets[] = array(
					'snippet_id' => $row[ 'snippet_id' ],
					'snippet_name' => $row[ 'snippet_name' ],
					'snippet_link' => BASE . AMP . 'C=design' . AMP . 'M=snippets_edit' . AMP . 'snippet=' . $row[ 'snippet_name' ]
				);
			}
		}

		//sort the snippets
		usort( $snippets, array( $this, 'snippet_sort' ) );

		return $snippets;
	}

	/**
	 * Callback to sort the snippet array by name.
	 *
	 * @param $a The first item.
	 * @param $b The second item.
	 * @return int
	 */
	protected function snippet_sort( $a, $b )
	{
		return strcmp( $a['snippet_name'], $b['snippet_name'] );
	}

	/**
	 * Gets the globals array.
	 *
	 * @return array
	 */
	protected function get_globals()
	{
		$global_variables = array();

		//query the global variables
		$temp = $this->EE->db->query( 'SELECT variable_id, variable_name FROM exp_global_variables' );

		//process the global variables
		if ( $temp->num_rows() > 0 )
		{
			foreach ( $temp->result_array() as $row )
			{
				$global_variables[] = array(
					'variable_id' => $row[ 'variable_id' ],
					'variable_name' => $row[ 'variable_name' ],
					'variable_link' => BASE . AMP . 'C=design' . AMP . 'M=global_variables_update' . AMP . 'variable_id=' . $row[ 'variable_id' ]
				);
			}
		}

		//sort the snippets
		usort( $global_variables, array( $this, 'globals_sort' ) );

		return $global_variables;
	}

	/**
	 * Callback to sort the globals array by name.
	 *
	 * @param $a The first item.
	 * @param $b The second item.
	 * @return int
	 */
	protected function globals_sort( $a, $b )
	{
		return strcmp( $a['variable_name'], $b['variable_name'] );
	}

	/**
	 * Setup the styles and scripts.
	 */
	protected function include_styles_and_scripts()
	{
		// Confirm this is actually being loaded from the CP
		if (!property_exists($this->EE, 'cp')) { return false; }
		
		//load cp jquery files for the tabs functionality
		$this->EE->cp->add_js_script( array( 'ui' => array( 'core', 'widget', 'tabs' ) ) );

		//get the theme URL
		$theme_url =  defined('URL_THIRD_THEMES') ? URL_THIRD_THEMES : $this->EE->config->slash_item('theme_folder_url').'third_party/';
		$theme_url .= 'template_variables/';

		//add the css to the header
		$this->EE->cp->add_to_head( '<link rel="stylesheet" type="text/css" href="' . $theme_url . 'css/template_variables.css" />' );

		//setup the js and add it to the footer
$scripts = <<<EOT
<script type="text/javascript" src="{$theme_url}scripts/ZeroClipboard.js"></script>
<script type="text/javascript">pathToZeroClipboardSwf = "{$theme_url}scripts/ZeroClipboard.swf";</script>
<script type="text/javascript" src="{$theme_url}scripts/template_variables.js"></script>
EOT;
		$this->EE->cp->add_to_foot( $scripts );
	}
}
/* End of file acc.template_variables.php */
/* Location: ./system/expressionengine/third_party/template_variables/acc.template_variables.php */
