<div id="tabs">
	<ul>
<?php
		foreach ( $field_groups as $index => $field_group )
		{
?>
		<li><a href="#tabs-<?= ( $index + 1 ) ?>"><?= $field_group[ 'group_name' ] ?></a></li>
<?php
		}
?>
	</ul>
<?php
	foreach ( $field_groups as $index => $field_group )
	{
?>
	<div id="tabs-<?= ( $index + 1 ) ?>">
		<h3 class="section-heading"><?= lang( 'field_group_name' )?>: <span><?=$field_groups[ $index ][ 'group_name' ]?></span></h3>
		<table class="customFieldTable" cellspacing="0" cellpadding="0">
			<thead>
<?php
			if ( isset( $field_group['custom_fields'] ) )
			{
?>
			<tr>
				<th><?= lang( 'field_label' )?></th>
				<th><?= lang( 'field_order' )?></th>
				<th><?= lang( 'field_name_syntax' )?></th>
				<th class="no-sort"><?= lang( 'field_type' )?></th>
				<th class="no-sort"><?= lang( 'edit' )?></th>
			</tr>
<?php
			}
?>
			</thead>
			<tbody>
<?php
			if ( isset( $field_group['custom_fields'] ) )
			{
				foreach ( $field_group[ 'custom_fields' ] as $i => $custom_field )
				{
?>
				<tr>
					<td class="fieldLabel"><?=$custom_field[ 'field_label' ]?></td>
					<td class="fieldOrder"><?=$custom_field[ 'field_order' ]?></td>
					<td class="fieldName"><a class="copy" id="cf<?= $i ?>" href="#"><span class="copyText">{<?=$custom_field[ 'field_name' ]?>}</span><span class="clipTip"><span class="arrow"></span><span class="clipText"></span></span></a></td>
					<td class="fieldType"><?=$custom_field[ 'field_type' ]?></td>
					<td><a href="<?=$custom_field[ 'field_link' ]?>"><?= lang( 'edit' )?></a></td>
				</tr>
<?php
				}
			}
?>
			</tbody>
			<tfoot>
			<tr>
				<td colspan="5"><a href="<?=$field_group[ 'new_custom_field_link' ]?>"><?= lang( 'create_new_custom_field' )?></a>
				</td>
			</tr>
			</tfoot>
		</table>
	</div>
<?php
	}
?>
</div>