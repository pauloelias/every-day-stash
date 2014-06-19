<table class="globalVariableTable" cellspacing="0" cellpadding="0">
	<thead>
		<tr>
			<th><?= lang( 'variable_syntax' )?></th>
			<th><?= lang( 'edit' )?></th>
		</tr>
	</thead>
	<tbody>
	<?php
	foreach ( $global_variables as $i => $result )
	{
		?>
		<tr>
			<td><a class="copy" id="s<?= ( $i + 1 ) ?>" href="#"><span class="copyText">{<?=$result[ 'variable_name' ]?>}</span><span class="clipTip"><span class="arrow"></span><span class="clipText"></span></span></a></td>
			<td><a href="<?=$result[ 'variable_link' ]?>"><?= lang( 'edit' )?></a></td>
		</tr>
		<?php
	}
	?>
	</tbody>
	<tfoot>
		<tr>
			<td colspan="2"><a href="<?=BASE . AMP . 'C=design' . AMP . 'M=global_variables_create'?>"><?= lang( 'create_new_global_variable' )?></a></td>
		</tr>
	</tfoot>
</table>